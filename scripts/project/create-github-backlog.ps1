[CmdletBinding()]
param(
    [string]$Repository = "notmaikeise/maikeise-motohub",
    [string]$ProjectOwner = "notmaikeise",
    [string]$ProjectTitle = "Maikeise MotoHub",
    [switch]$Apply,
    [switch]$CloseCompleted
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Invoke-GhText {
    param([Parameter(Mandatory = $true)][string[]]$Arguments)

    $output = & gh @Arguments 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "Falha ao executar: gh $($Arguments -join ' ')`n$($output | Out-String)"
    }

    return ($output | Out-String).Trim()
}

function Invoke-GhJson {
    param([Parameter(Mandatory = $true)][string[]]$Arguments)

    $text = Invoke-GhText -Arguments $Arguments
    if ([string]::IsNullOrWhiteSpace($text)) {
        return $null
    }

    return $text | ConvertFrom-Json
}

function Get-Collection {
    param(
        [Parameter(Mandatory = $true)]$Value,
        [Parameter(Mandatory = $true)][string]$Property
    )

    if ($null -ne $Value.PSObject.Properties[$Property]) {
        return @($Value.$Property)
    }

    return @($Value)
}

function Get-IssueBody {
    param([Parameter(Mandatory = $true)]$Card)

    $criteria = switch ($Card.category) {
        "Feature" {
            @(
                "- [ ] O comportamento descrito pode ser demonstrado pelo ator autorizado.",
                "- [ ] Caminhos inválidos e acessos sem permissão produzem respostas claras e seguras.",
                "- [ ] Testes automatizados cobrem as regras e os casos de erro relevantes.",
                "- [ ] Interface, contrato e documentação afetados foram atualizados."
            )
        }
        "Architecture" {
            @(
                "- [ ] A decisão está aplicada sem violar a ADR-001 nem os limites dos módulos.",
                "- [ ] Uma verificação automatizada protege a regra arquitetural quando aplicável.",
                "- [ ] Testes e documentação explicam a decisão e suas consequências."
            )
        }
        "Documentation" {
            @(
                "- [ ] O conteúdo está completo para o público indicado e usa a linguagem oficial do projeto.",
                "- [ ] Links, comandos e exemplos foram verificados.",
                "- [ ] A documentação permanece coerente com o código e as decisões vigentes."
            )
        }
        "Discovery" {
            @(
                "- [ ] O resultado da investigação está registrado.",
                "- [ ] Decisões, dúvidas e referências estão explícitas.",
                "- [ ] Os documentos relacionados foram atualizados."
            )
        }
        default {
            @(
                "- [ ] O resultado técnico pode ser reproduzido no ambiente local.",
                "- [ ] A solução respeita os limites de módulos, dados e segurança da ADR-001.",
                "- [ ] Validações automatizadas relevantes passam no build.",
                "- [ ] Configuração e uso foram documentados quando necessário."
            )
        }
    }

    return @"
## Objetivo

$($Card.outcome).

## Escopo

Executar **$($Card.title)** dentro do escopo do MVP, preservando a linguagem ubíqua, os limites dos Bounded Contexts e a arquitetura aprovada.

## Critérios de aceite

$($criteria -join "`n")

## Planejamento

| Campo | Valor |
| --- | --- |
| ID | ``$($Card.id)`` |
| Status inicial | $($Card.status) |
| Prioridade | $($Card.priority) |
| Categoria | $($Card.category) |
| Área | $($Card.area) |

## Referências

- [Backlog](https://github.com/$Repository/blob/main/docs/06-backlog.md)
- [Requisitos](https://github.com/$Repository/blob/main/docs/05-requirements.md)
- [Arquitetura](https://github.com/$Repository/blob/main/docs/architecture/00-overview.md)
"@
}

function Get-Field {
    param(
        [Parameter(Mandatory = $true)][object[]]$Fields,
        [Parameter(Mandatory = $true)][string]$Name
    )

    $field = $Fields | Where-Object { $_.name -eq $Name } | Select-Object -First 1
    if ($null -eq $field) {
        throw "O campo '$Name' não existe no Project. Crie-o antes de aplicar o catálogo."
    }

    return $field
}

function Get-FieldOption {
    param(
        [Parameter(Mandatory = $true)]$Field,
        [Parameter(Mandatory = $true)][string]$Name
    )

    $option = @($Field.options) | Where-Object { $_.name -eq $Name } | Select-Object -First 1
    if ($null -eq $option) {
        throw "A opção '$Name' não existe no campo '$($Field.name)'."
    }

    return $option
}

function Set-ProjectSingleSelectFields {
    param(
        [Parameter(Mandatory = $true)][string]$ProjectId,
        [Parameter(Mandatory = $true)][string]$ItemId,
        [Parameter(Mandatory = $true)]$StatusField,
        [Parameter(Mandatory = $true)][string]$Status,
        [Parameter(Mandatory = $true)]$PriorityField,
        [Parameter(Mandatory = $true)][string]$Priority,
        [Parameter(Mandatory = $true)]$CategoryField,
        [Parameter(Mandatory = $true)][string]$Category,
        [Parameter(Mandatory = $true)]$AreaField,
        [Parameter(Mandatory = $true)][string]$Area
    )

    $statusOption = Get-FieldOption -Field $StatusField -Name $Status
    $priorityOption = Get-FieldOption -Field $PriorityField -Name $Priority
    $categoryOption = Get-FieldOption -Field $CategoryField -Name $Category
    $areaOption = Get-FieldOption -Field $AreaField -Name $Area

    $mutation = @'
mutation(
  $projectId: ID!
  $itemId: ID!
  $statusFieldId: ID!
  $statusOptionId: String!
  $priorityFieldId: ID!
  $priorityOptionId: String!
  $categoryFieldId: ID!
  $categoryOptionId: String!
  $areaFieldId: ID!
  $areaOptionId: String!
) {
  status: updateProjectV2ItemFieldValue(input: {
    projectId: $projectId
    itemId: $itemId
    fieldId: $statusFieldId
    value: { singleSelectOptionId: $statusOptionId }
  }) { projectV2Item { id } }
  priority: updateProjectV2ItemFieldValue(input: {
    projectId: $projectId
    itemId: $itemId
    fieldId: $priorityFieldId
    value: { singleSelectOptionId: $priorityOptionId }
  }) { projectV2Item { id } }
  category: updateProjectV2ItemFieldValue(input: {
    projectId: $projectId
    itemId: $itemId
    fieldId: $categoryFieldId
    value: { singleSelectOptionId: $categoryOptionId }
  }) { projectV2Item { id } }
  area: updateProjectV2ItemFieldValue(input: {
    projectId: $projectId
    itemId: $itemId
    fieldId: $areaFieldId
    value: { singleSelectOptionId: $areaOptionId }
  }) { projectV2Item { id } }
}
'@

    Invoke-GhJson -Arguments @(
        "api", "graphql",
        "-f", "query=$mutation",
        "-f", "projectId=$ProjectId",
        "-f", "itemId=$ItemId",
        "-f", "statusFieldId=$($StatusField.id)",
        "-f", "statusOptionId=$($statusOption.id)",
        "-f", "priorityFieldId=$($PriorityField.id)",
        "-f", "priorityOptionId=$($priorityOption.id)",
        "-f", "categoryFieldId=$($CategoryField.id)",
        "-f", "categoryOptionId=$($categoryOption.id)",
        "-f", "areaFieldId=$($AreaField.id)",
        "-f", "areaOptionId=$($areaOption.id)"
    ) | Out-Null
}

if ($null -eq (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw "GitHub CLI não encontrado. Instale com: winget install --id GitHub.cli"
}

$repositoryRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$catalogPath = Join-Path $repositoryRoot "docs\project-management\backlog-cards.csv"
$cards = @(Import-Csv -Path $catalogPath -Encoding UTF8)
$utf8WithoutBom = [System.Text.UTF8Encoding]::new($false)

if ($cards.Count -eq 0) {
    throw "O catálogo está vazio: $catalogPath"
}

$duplicateIds = $cards | Group-Object id | Where-Object { $_.Count -gt 1 }
if ($duplicateIds) {
    throw "Existem IDs duplicados no catálogo: $($duplicateIds.Name -join ', ')"
}

Invoke-GhText -Arguments @("auth", "status") | Out-Null

if ($Apply) {
    $rateResult = Invoke-GhJson -Arguments @("api", "rate_limit")
    $graphqlRate = $rateResult.resources.graphql
    $minimumGraphqlBudget = ($cards.Count * 2) + 25

    if ([int]$graphqlRate.remaining -lt $minimumGraphqlBudget) {
        $resetAt = [DateTimeOffset]::FromUnixTimeSeconds([long]$graphqlRate.reset).ToLocalTime()
        throw "Cota GraphQL insuficiente para uma execução segura. Restam $($graphqlRate.remaining) de $($graphqlRate.limit) pontos. Aguarde até $($resetAt.ToString('dd/MM/yyyy HH:mm:ss')) e execute novamente. Nenhuma alteração desta execução foi realizada."
    }

    Write-Host "Cota GraphQL disponível: $($graphqlRate.remaining) de $($graphqlRate.limit) pontos."
}

$projectResult = Invoke-GhJson -Arguments @(
    "project", "list", "--owner", $ProjectOwner,
    "--limit", "100", "--format", "json"
)
$projects = Get-Collection -Value $projectResult -Property "projects"
$project = $projects | Where-Object { $_.title -eq $ProjectTitle } | Select-Object -First 1

if ($null -eq $project) {
    throw "Project '$ProjectTitle' não encontrado para o proprietário '$ProjectOwner'."
}

if ([string]::IsNullOrWhiteSpace([string]$project.id)) {
    throw "O GitHub CLI não retornou o ID do Project. Atualize o GitHub CLI e execute novamente."
}

$fieldResult = Invoke-GhJson -Arguments @(
    "project", "field-list", "$($project.number)",
    "--owner", $ProjectOwner, "--limit", "100", "--format", "json"
)
$fields = Get-Collection -Value $fieldResult -Property "fields"
$statusField = Get-Field -Fields $fields -Name "Status"
$priorityField = Get-Field -Fields $fields -Name "Priority"
$categoryField = Get-Field -Fields $fields -Name "Category"
$areaField = Get-Field -Fields $fields -Name "Area"

$requiredFieldOptions = @{
    "Status" = @("Backlog", "Ready", "In progress", "In review", "Done")
    "Priority" = @("Must", "Should", "Could", "Won't")
    "Category" = @("Discovery", "Documentation", "Architecture", "Feature", "Technical", "Bug")
    "Area" = @("Product", "DDD", "Architecture", "Identity", "Customer", "Catalog", "Inventory", "Commercial", "Audit", "Platform")
}
$fieldsByName = @{
    "Status" = $statusField
    "Priority" = $priorityField
    "Category" = $categoryField
    "Area" = $areaField
}
$missingFieldOptions = @()

foreach ($fieldName in $requiredFieldOptions.Keys) {
    $configuredOptions = @($fieldsByName[$fieldName].options | ForEach-Object { $_.name })
    $missingOptions = @($requiredFieldOptions[$fieldName] | Where-Object { $_ -notin $configuredOptions })
    if ($missingOptions.Count -gt 0) {
        $missingFieldOptions += "- ${fieldName}: $($missingOptions -join ', ')"
    }
}

if ($missingFieldOptions.Count -gt 0) {
    throw "Existem opções ausentes nos campos do Project:`n$($missingFieldOptions -join "`n")`nAdicione essas opções nas configurações do Project e execute novamente."
}

$issueResult = Invoke-GhJson -Arguments @(
    "issue", "list", "--repo", $Repository,
    "--state", "all", "--limit", "1000",
    "--json", "number,title,url,state"
)
$issues = @($issueResult)
$issuesById = @{}
foreach ($issue in $issues) {
    if ($issue.title -match "^(BKL-\d{3})\b") {
        $issuesById[$Matches[1]] = $issue
    }
}

$itemResult = Invoke-GhJson -Arguments @(
    "project", "item-list", "$($project.number)",
    "--owner", $ProjectOwner, "--limit", "1000", "--format", "json"
)
$items = Get-Collection -Value $itemResult -Property "items"
$itemsByUrl = @{}
foreach ($item in $items) {
    if ($null -ne $item.content -and -not [string]::IsNullOrWhiteSpace($item.content.url)) {
        $itemsByUrl[$item.content.url] = $item
    }
}

$labelDefinitions = @{
    "type: discovery"    = @{ Color = "8250df"; Description = "Descoberta e modelagem" }
    "type: documentation" = @{ Color = "1d76db"; Description = "Documentação" }
    "type: architecture" = @{ Color = "d4c5f9"; Description = "Decisão ou estrutura arquitetural" }
    "type: feature"      = @{ Color = "0e8a16"; Description = "Funcionalidade para um ator" }
    "type: technical"    = @{ Color = "fbca04"; Description = "Infraestrutura ou qualidade interna" }
    "type: bug"          = @{ Color = "d73a4a"; Description = "Defeito a corrigir" }
    "area: product"      = @{ Color = "cfd3d7"; Description = "Produto e escopo" }
    "area: ddd"          = @{ Color = "cfd3d7"; Description = "Modelagem DDD" }
    "area: architecture" = @{ Color = "cfd3d7"; Description = "Arquitetura" }
    "area: identity"     = @{ Color = "cfd3d7"; Description = "Identity and Access" }
    "area: customer"     = @{ Color = "cfd3d7"; Description = "Customer Management" }
    "area: catalog"      = @{ Color = "cfd3d7"; Description = "Catalog" }
    "area: inventory"    = @{ Color = "cfd3d7"; Description = "Inventory and Reservation" }
    "area: commercial"   = @{ Color = "cfd3d7"; Description = "Commercial" }
    "area: audit"        = @{ Color = "cfd3d7"; Description = "Audit" }
    "area: platform"     = @{ Color = "cfd3d7"; Description = "Plataforma e aspectos transversais" }
}

$existingLabelsResult = Invoke-GhJson -Arguments @(
    "label", "list", "--repo", $Repository,
    "--limit", "200", "--json", "name"
)
$existingLabelNames = @{}
foreach ($label in @($existingLabelsResult)) {
    $existingLabelNames[$label.name] = $true
}

$typeLabels = @{
    "Discovery" = "type: discovery"
    "Documentation" = "type: documentation"
    "Architecture" = "type: architecture"
    "Feature" = "type: feature"
    "Technical" = "type: technical"
    "Bug" = "type: bug"
}

if (-not $Apply) {
    Write-Host "MODO DE SIMULAÇÃO: nenhuma alteração será feita." -ForegroundColor Yellow
    Write-Host "Use -Apply depois de revisar o resumo.`n"
}

$created = 0
$reused = 0
$addedToProject = 0

foreach ($card in $cards) {
    $typeLabel = $typeLabels[$card.category]
    $areaLabel = "area: $($card.area.ToLowerInvariant())"
    $requiredLabels = @($typeLabel, $areaLabel)

    foreach ($labelName in $requiredLabels) {
        if (-not $existingLabelNames.ContainsKey($labelName)) {
            if ($Apply) {
                $definition = $labelDefinitions[$labelName]
                Invoke-GhText -Arguments @(
                    "label", "create", $labelName,
                    "--repo", $Repository,
                    "--color", $definition.Color,
                    "--description", $definition.Description
                ) | Out-Null
                $existingLabelNames[$labelName] = $true
            }
            else {
                Write-Host "[CRIARIA LABEL] $labelName"
                $existingLabelNames[$labelName] = $true
            }
        }
    }

    $issue = $issuesById[$card.id]
    if ($null -eq $issue) {
        if (-not $Apply) {
            Write-Host "[CRIARIA ISSUE] $($card.id) - $($card.title)"
            continue
        }

        $temporaryBody = New-TemporaryFile
        try {
            $bodyText = Get-IssueBody -Card $card
            [System.IO.File]::WriteAllText($temporaryBody.FullName, $bodyText, $utf8WithoutBom)
            $issueUrl = Invoke-GhText -Arguments @(
                "issue", "create", "--repo", $Repository,
                "--title", "$($card.id) - $($card.title)",
                "--body-file", $temporaryBody.FullName,
                "--assignee", "@me",
                "--label", $typeLabel,
                "--label", $areaLabel
            )
        }
        finally {
            Remove-Item -Path $temporaryBody.FullName -Force -ErrorAction SilentlyContinue
        }

        $issueNumber = [int](($issueUrl -split "/")[-1])
        $issue = [PSCustomObject]@{
            number = $issueNumber
            title = "$($card.id) - $($card.title)"
            url = $issueUrl
            state = "OPEN"
        }
        $issuesById[$card.id] = $issue
        $created++
        Write-Host "[CRIADA] $($card.id) -> #$issueNumber" -ForegroundColor Green
    }
    else {
        $reused++
        if ($Apply) {
            Invoke-GhText -Arguments @(
                "issue", "edit", "$($issue.number)",
                "--repo", $Repository,
                "--add-label", $typeLabel,
                "--add-label", $areaLabel
            ) | Out-Null
        }
        Write-Host "[EXISTENTE] $($card.id) -> #$($issue.number)"
    }

    if (-not $Apply) {
        continue
    }

    $item = $itemsByUrl[$issue.url]
    if ($null -eq $item) {
        $item = Invoke-GhJson -Arguments @(
            "project", "item-add", "$($project.number)",
            "--owner", $ProjectOwner,
            "--url", $issue.url,
            "--format", "json"
        )

        if ($null -ne $item.PSObject.Properties["item"]) {
            $item = $item.item
        }

        if ([string]::IsNullOrWhiteSpace([string]$item.id)) {
            throw "O GitHub CLI adicionou '$($card.id)' ao Project, mas não retornou o ID do item. Execute o script novamente para continuar."
        }

        $itemsByUrl[$issue.url] = $item
        $addedToProject++
    }

    if ([string]::IsNullOrWhiteSpace([string]$item.id)) {
        throw "O item de Project correspondente a '$($card.id)' não possui ID. Execute o script novamente para atualizar a leitura do Project."
    }

    Set-ProjectSingleSelectFields `
        -ProjectId $project.id `
        -ItemId $item.id `
        -StatusField $statusField `
        -Status $card.status `
        -PriorityField $priorityField `
        -Priority $card.priority `
        -CategoryField $categoryField `
        -Category $card.category `
        -AreaField $areaField `
        -Area $card.area

    if ($CloseCompleted -and $card.status -eq "Done" -and $issue.state -ne "CLOSED") {
        Invoke-GhText -Arguments @(
            "issue", "close", "$($issue.number)",
            "--repo", $Repository,
            "--reason", "completed"
        ) | Out-Null
    }
}

Write-Host ""
if ($Apply) {
    Write-Host "Sincronização concluída." -ForegroundColor Green
    Write-Host "Issues criadas: $created"
    Write-Host "Issues reaproveitadas: $reused"
    Write-Host "Itens adicionados ao Project: $addedToProject"
}
else {
    Write-Host "Simulação concluída para $($cards.Count) cards. Nenhuma alteração foi realizada."
}
