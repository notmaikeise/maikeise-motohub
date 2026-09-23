# Maikeise MotoHub

Plataforma de gestão e comercialização de motocicletas para uma concessionária que atende compradores pessoa física e pessoa jurídica.

> Status atual: ideação concluída e documentação inicial em construção. O código da aplicação ainda não foi iniciado.

## Visão geral

O Maikeise MotoHub centraliza catálogo, estoque, clientes, propostas, reservas e vendas. Compradores podem consultar motocicletas e acompanhar negociações. Funcionários controlam a operação comercial com regras de acesso, histórico e rastreabilidade.

O MVP será desenvolvido para uma única concessionária. A possibilidade de atender várias concessionárias como uma plataforma multi-tenant ficará para uma evolução futura.

## Origem e propósito

O Maikeise MotoHub é um **projeto individual de estudo e portfólio**, desenvolvido como uma evolução técnica paralela a um projeto acadêmico coletivo da faculdade.

O trabalho em grupo está concentrado na modelagem, ideação e planejamento de um sistema para o domínio de concessionárias de motocicletas. Esse contexto serviu como inspiração e referência inicial para este repositório. O Maikeise MotoHub, porém, possui identidade própria e será desenvolvido individualmente para aprofundar conhecimentos em DDD, Java, Spring Boot, arquitetura, microsserviços, testes, documentação e deploy local.

Este repositório:

- Não representa a entrega oficial da equipe da faculdade.
- Não atribui a uma única pessoa a autoria exclusiva do conceito acadêmico coletivo.
- Não reutiliza o nome ou a identidade visual do projeto acadêmico.
- Não contém código produzido pela equipe; a implementação será construída separadamente.
- Documenta decisões, adaptações e expansões realizadas no estudo individual.

O contexto completo está registrado em [Origem e propósito do projeto](docs/00-project-context.md).

## Problema

Concessionárias que atendem pessoas físicas, empresas e frotistas podem manter dados de veículos, clientes e negociações em ferramentas separadas. Essa fragmentação aumenta o risco de informações inconsistentes, reservas simultâneas e perda do histórico das operações.

## Escopo do MVP

- Cadastro e autenticação de compradores PF e PJ.
- Controle de acesso para comprador, estoque, vendedor, gerente e administrador.
- Catálogo e estoque de motocicletas.
- Solicitação, análise, versionamento e aceite de propostas.
- Aprovação gerencial de descontos superiores a 10%.
- Reservas com duração de 72 horas.
- Registro de pagamento realizado fora da plataforma.
- Conclusão e histórico de vendas.
- Auditoria das operações mais importantes.

## Documentação

| Documento | Conteúdo |
| --- | --- |
| [Origem e propósito](docs/00-project-context.md) | Relação com o projeto acadêmico e objetivo do estudo individual |
| [Visão do produto](docs/01-product-vision.md) | Problema, objetivos, proposta de valor e modelo de negócio |
| [Escopo e atores](docs/02-scope-and-actors.md) | Limites do MVP, usuários e responsabilidades |
| [Jornada principal](docs/03-user-journey.md) | Fluxo do comprador e caminhos alternativos |
| [Regras de negócio](docs/04-business-rules.md) | Regras de clientes, estoque, propostas, reservas e vendas |
| [Requisitos](docs/05-requirements.md) | Requisitos funcionais, não funcionais e prioridades |
| [Backlog inicial](docs/06-backlog.md) | Épicos e itens planejados |
| [Decisões em aberto](docs/07-open-decisions.md) | Questões que ainda precisam de análise |
| [Glossário](docs/glossary.md) | Linguagem inicial do produto |
| [DDD](docs/ddd/README.md) | Estado e roteiro da modelagem de domínio |
| [GitHub Projects](docs/project-management/github-projects-setup.md) | Configuração recomendada para os cards |

## Tecnologias planejadas

As decisões técnicas serão registradas por ADRs depois da modelagem DDD. A direção inicial considera:

- Java e Spring Boot
- Spring Security
- Spring Data JPA
- PostgreSQL
- Flyway
- JUnit, Mockito e Testcontainers
- Docker e Docker Compose
- OpenAPI

A escolha entre monólito modular e microsserviços ainda não foi concluída. Ela dependerá dos limites de domínio identificados no DDD estratégico.

## Roadmap de aprendizado

1. Consolidar a ideação e os requisitos.
2. Elaborar o DDD estratégico.
3. Elaborar o DDD tático.
4. Registrar decisões arquiteturais.
5. Criar a primeira aplicação Spring Boot.
6. Implementar o fluxo principal com testes.
7. Avaliar a extração gradual de microsserviços.
8. Criar a interface e o deploy local.

## Estrutura atual

```text
maikeise-motohub/
├── .github/
│   └── ISSUE_TEMPLATE/
├── docs/
│   ├── ddd/
│   └── project-management/
├── .editorconfig
├── .gitattributes
├── .gitignore
├── CHANGELOG.md
└── README.md
```

## Autoria

Esta evolução técnica individual é desenvolvida por [Not Maikeise](https://github.com/notmaikeise). A inspiração acadêmica inicial surgiu de um trabalho coletivo e não é apresentada como criação exclusiva da autora deste repositório.

## Licença

A licença ainda será definida antes da primeira versão pública do software.
