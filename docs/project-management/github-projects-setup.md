# Configuração do GitHub Projects

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

## Ordem para criar os primeiros cards

1. BKL-001 - Consolidar a linguagem ubíqua.
2. BKL-002 - Identificar subdomínios.
3. BKL-003 - Definir Bounded Contexts.
4. BKL-004 - Criar o Context Map.
5. BKL-005 - Mapear eventos de domínio.
6. BKL-006 - Modelar agregados e invariantes.
7. BKL-007 - Registrar decisão arquitetural inicial.

## Labels recomendadas no repositório

Use labels para categorias estáveis e campos do Project para planejamento.

```text
area: ddd
area: identity
area: customer
area: catalog
area: inventory
area: commercial
area: audit
type: discovery
type: documentation
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

[Voltar ao Hub da documentação](../README.md).
