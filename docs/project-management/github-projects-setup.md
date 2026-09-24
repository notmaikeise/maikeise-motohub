# Configuração do GitHub Projects

> [!IMPORTANT]
> O catálogo com 90 cards já foi sincronizado e o projeto está em pausa. Este guia permanece como registro reproduzível da organização realizada; não é necessário executar novamente o script sem uma revisão ou retomada do planejamento.

> [!TIP]
> Este é um guia operacional. Execute uma seção por vez e volte ao Hub quando terminar.

## Por que usar

GitHub Projects mantém backlog, issues, pull requests e progresso próximos do código. O mesmo conjunto de itens pode ser visualizado como tabela, quadro ou roadmap.

## Projeto recomendado

- **Nome:** Maikeise MotoHub
- **Proprietário:** conta pessoal `notmaikeise`
- **Modelo inicial:** projeto em branco
- **Primeira visualização:** Board

## Campos recomendados

### Status

Campo de seleção única:

```text
Backlog
Ready
In progress
In review
Done
```

### Priority

Campo de seleção única:

```text
Must
Should
Could
Won't
```

### Category

Campo de seleção única:

```text
Discovery
Documentation
Architecture
Feature
Technical
Bug
```

### Area

Campo de seleção única:

```text
Product
DDD
Architecture
Identity
Customer
Catalog
Inventory
Commercial
Audit
Platform
```

### Size

Não é necessário adicionar estimativas agora. Depois que o trabalho estiver melhor refinado, poderá ser criado um campo numérico ou uma escala simples:

```text
XS
S
M
L
XL
```

## Visualizações

### 1. Board

- Layout: Board.
- Colunas: campo `Status`.
- Uso: acompanhar o trabalho atual.

### 2. Backlog

- Layout: Table.
- Agrupamento: `Area`.
- Ordenação: `Priority`.
- Uso: revisar e priorizar o trabalho futuro.

### 3. Roadmap

Criar somente quando existirem datas ou iterações confiáveis. Evite inventar cronogramas antes de estimar o trabalho.

## Issues e rascunhos

- Use **Issue** para trabalho já compreendido, com contexto e critérios de aceite.
- Use **Draft issue** para ideias rápidas que ainda precisam de refinamento.
- Transforme um rascunho em issue antes de iniciar a implementação.

## Catálogo oficial

O [backlog](../06-backlog.md) possui **90 cards** conhecidos:

- `BKL-001` a `BKL-007`: descoberta, DDD e arquitetura já concluídos;
- `BKL-010`: primeiro candidato de uma possível retomada; seu planejamento original o marcou como `Ready`;
- demais cards: desenvolvimento possível do MVP, preservado em `Backlog`;
- `BKL-097`: estacionamento pós-MVP, com prioridade `Won't`.

O arquivo [backlog-cards.csv](backlog-cards.csv) é a fonte estruturada usada para preencher `Status`, `Priority`, `Category` e `Area` sem digitação repetitiva.

Os status dos cards registram a organização concebida antes da pausa. Eles não indicam que a implementação esteja em andamento.

## Criação em lote com GitHub CLI

> [!IMPORTANT]
> Execute primeiro no modo de simulação. O script identifica cards existentes pelo prefixo `BKL-000`, portanto os sete primeiros não são duplicados.

### 1. Instalar e autenticar

No PowerShell, dentro do repositório:

```powershell
winget install --id GitHub.cli
gh auth login
gh auth refresh -s project
```

O último comando concede ao GitHub CLI o escopo necessário para editar Projects. Nenhum token deve ser copiado para o repositório.

### 2. Simular

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\project\create-github-backlog.ps1
```

A simulação consulta o repositório e o Project, valida todos os campos e informa o que seria criado sem fazer alterações.

Se alguma opção de seleção estiver ausente, o script interrompe a simulação antes de qualquer escrita e lista, por campo, tudo o que precisa ser adicionado. No Project, abra o menu do campo indicado, escolha **Edit field** e use **Add option** para completar a lista da seção [Campos recomendados](#campos-recomendados).

### 3. Criar e sincronizar

```powershell
.\scripts\project\create-github-backlog.ps1 -Apply
```

O script:

1. reaproveita issues cujo título começa com o mesmo ID;
2. cria somente as issues ausentes;
3. atribui as issues à própria conta;
4. adiciona as labels de tipo e área ausentes;
5. adiciona cada issue ao Project;
6. preenche os quatro campos personalizados em uma única requisição por card;
7. mantém somente `BKL-010` em `Ready` e os demais trabalhos futuros em `Backlog`.

Antes de escrever, o script também verifica se existe cota GraphQL suficiente para concluir o processamento com segurança. Se a cota estiver baixa, ele informa o horário de renovação e encerra antes de alterar qualquer item.

Depois de confirmar que `BKL-001` a `BKL-007` estão publicados no repositório, é possível também fechá-los:

```powershell
.\scripts\project\create-github-backlog.ps1 -Apply -CloseCompleted
```

O script é idempotente: uma nova execução sincroniza os itens existentes em vez de criar outra issue com o mesmo ID.

As atualizações de `Status`, `Priority`, `Category` e `Area` são agrupadas em uma única mutação GraphQL. Isso reduz o número de chamadas à API e diminui a chance de bloqueio durante a criação em lote.

## Labels recomendadas no repositório

Use labels para categorias estáveis e campos do Project para planejamento.

```text
area: ddd
area: product
area: architecture
area: identity
area: customer
area: catalog
area: inventory
area: commercial
area: audit
area: platform
type: discovery
type: documentation
type: architecture
type: feature
type: technical
type: bug
```

Não duplique `Status` e `Priority` como labels se eles já existirem como campos do Project.

## Automação inicial

Configuração inicial adotada:

- Item adicionado ao projeto recebe `Status: Backlog`.
- Issue fechada recebe `Status: Done`.
- Pull request integrado recebe `Status: Done`.

Outras automações devem ser adicionadas apenas quando o fluxo estiver estável.

## Referências oficiais

- [Criar um projeto](https://docs.github.com/pt/issues/planning-and-tracking-with-projects/creating-projects/creating-a-project)
- [Sobre o GitHub Projects](https://docs.github.com/pt/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects)
- [Personalizar visualizações](https://docs.github.com/en/issues/planning-and-tracking-with-projects/customizing-views-in-your-project)
- [Adicionar itens ao projeto](https://docs.github.com/en/issues/planning-and-tracking-with-projects/managing-items-in-your-project/adding-items-to-your-project)
- [GitHub CLI para Projects](https://cli.github.com/manual/gh_project)
- [Criar issues com GitHub CLI](https://cli.github.com/manual/gh_issue_create)

[Voltar ao Hub da documentação](../README.md).
