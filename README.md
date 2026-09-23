# Maikeise MotoHub

![Status](https://img.shields.io/badge/status-modelagem%20DDD%20conclu%C3%ADda-2ea44f)
![Próxima etapa](https://img.shields.io/badge/pr%C3%B3xima%20etapa-arquitetura-8250df)
![Código](https://img.shields.io/badge/c%C3%B3digo-ainda%20n%C3%A3o%20iniciado-6e7781)

Plataforma web para organizar o fluxo comercial de uma concessionária de motocicletas, do catálogo à venda, atendendo clientes pessoa física e jurídica.

> [!IMPORTANT]
> Este repositório está propositalmente na fase de modelagem. O objetivo é mostrar como as decisões de negócio orientam o futuro código Java, em vez de começar pelo framework e adaptar o domínio depois.

## O projeto em um minuto

| Pergunta | Resposta |
| --- | --- |
| Qual problema resolve? | Centraliza catálogo, clientes, propostas, reservas e vendas, reduzindo conflitos e perda de histórico. |
| Quem utiliza? | Visitantes, clientes PF, representantes de empresas e funcionários da concessionária. |
| Qual é o diferencial estudado? | Propostas versionadas, aprovação de descontos, reserva atômica de unidades e rastreabilidade das decisões. |
| Qual é o escopo inicial? | Uma concessionária, pagamento externo e aplicação web responsiva. |
| Qual é a abordagem? | DDD estratégico e tático, seguido de monólito modular com Arquitetura Hexagonal. |
| Em que fase está? | Modelagem de domínio concluída; decisão arquitetural é o próximo passo. |

## Fluxo principal

```mermaid
flowchart LR
    CAT["Catálogo"] --> PRO["Proposta"]
    PRO --> RES["Reserva atômica"]
    RES --> VEN["Venda"]
```

O visitante consulta unidades físicas específicas. Depois de se cadastrar, solicita uma proposta. O vendedor prepara uma versão com preço e desconto; descontos acima de 10% exigem aprovação do gerente. O aceite dispara uma tentativa de reserva de todas as unidades e, após a confirmação do pagamento externo, a venda é concluída.

### Regras que orientam o modelo

| Tema | Decisão do MVP |
| --- | --- |
| Proposta | Vale sete dias e preserva todas as versões enviadas. |
| Desconto | Vendedor concede até 10%; acima disso, a versão exata exige aprovação gerencial. |
| Reserva | Todas as unidades são reservadas juntas ou nenhuma delas é. |
| Prazo | 48 horas, com uma única prorrogação gerencial de 24 horas. |
| Concorrência | Uma unidade nunca participa de duas reservas ativas. |
| Pagamento | Acontece fora da plataforma e é confirmado por funcionário autorizado. |
| Cancelamento de venda | Preserva o histórico e envia as unidades para revisão. |

## Por que este projeto existe

O Maikeise MotoHub é um estudo individual e uma peça de portfólio inspirada pelo domínio discutido em um trabalho acadêmico coletivo. Ele não representa a entrega oficial da equipe e não reutiliza código, nome ou identidade visual daquele projeto.

Aqui, a proposta é continuar além da ideação acadêmica: documentar o raciocínio, implementar o sistema em Java e Spring Boot, testar as regras e chegar a uma execução local reproduzível.

[Entenda a origem, a autoria e os limites entre os projetos](docs/00-project-context.md).

## Decisões de engenharia já consolidadas

- Seis Bounded Contexts com responsabilidades e dados próprios.
- Onze Aggregate Roots e invariantes associadas aos objetos que as protegem.
- Referências entre agregados por IDs tipados, sem grafos de entidades entre módulos.
- Repositórios somente para Aggregate Roots.
- Catálogo separado do estoque operacional.
- Estoque e reservas no mesmo contexto para proteger a exclusividade das unidades.
- Hipótese de monólito modular, com Arquitetura Hexagonal dentro de cada módulo.
- Microsserviços somente quando houver uma necessidade demonstrável de implantação ou escala independente.

> [!NOTE]
> Evento de domínio não significa Event Sourcing, e Bounded Context não significa microsserviço. Essas separações são intencionais e estão explicadas na documentação.

## Escolha uma trilha de leitura

| Se você é... | Comece por... | Tempo aproximado |
| --- | --- | ---: |
| Recrutador(a) | Este README e o [resumo do DDD](docs/ddd/00-overview.md) | 8 min |
| Professor(a) | [Contexto acadêmico](docs/00-project-context.md), [visão do produto](docs/01-product-vision.md) e [resumo do DDD](docs/ddd/00-overview.md) | 15 min |
| Pessoa desenvolvedora | [Hub da documentação](docs/README.md), seguido dos documentos técnicos numerados | 30+ min |
| Autora estudando o projeto | [Hub da documentação](docs/README.md) e as seções “O que registrar no caderno” | Conforme a etapa |

Toda a navegação está organizada no [Hub da documentação](docs/README.md).

## Progresso

| Etapa | Situação |
| --- | --- |
| Linguagem ubíqua | ✅ Concluída |
| Subdomínios | ✅ Concluída |
| Bounded Contexts | ✅ Concluída |
| Context Map | ✅ Concluída |
| Eventos de domínio | ✅ Concluída |
| Agregados e invariantes | ✅ Concluída |
| Decisão arquitetural inicial | ⏭️ Próxima |
| Implementação Spring Boot | ⬜ Planejada |
| Interface e deploy local | ⬜ Planejados |

## Tecnologias planejadas

<details>
<summary><strong>Ver stack técnica</strong></summary>

- Java e Spring Boot.
- Spring Security.
- PostgreSQL e Flyway.
- JUnit, Mockito e Testcontainers.
- Docker e Docker Compose.
- OpenAPI.
- Interface web a ser decidida na ADR de frontend.

</details>

## Escopo futuro

<details>
<summary><strong>O que foi deixado conscientemente fora do MVP</strong></summary>

- Pagamento online.
- Multi-tenancy para várias concessionárias.
- Emissão fiscal e financiamento bancário reais.
- Oficina, trade-in, seguros e garantias.
- Telemetria e aplicativo móvel nativo.

</details>

## Autoria e licença

Esta evolução técnica individual é desenvolvida por [Not Maikeise](https://github.com/notmaikeise), preservando o reconhecimento da inspiração acadêmica coletiva.

A licença será definida antes da primeira versão pública de código.
