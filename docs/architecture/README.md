# Arquitetura do Maikeise MotoHub

Esta pasta registra como o modelo de domínio será transformado em uma aplicação executável sem perder os limites descobertos durante o DDD.

> [!IMPORTANT]
> A arquitetura inicial foi aceita na `BKL-007`. O Maikeise MotoHub começará como um monólito modular e somente será distribuído quando existir uma necessidade operacional demonstrável.

## Comece por aqui

| Documento | Para que serve | Leitura |
| --- | --- | ---: |
| [Arquitetura em uma visão](00-overview.md) | Explica módulos, dados, integrações, segurança, testes e execução local. | 15 min |
| [ADR-001](decisions/ADR-001-monolito-modular-arquitetura-hexagonal.md) | Registra a decisão oficial, alternativas e consequências. | 8 min |
| [Context Map](../ddd/03-context-map.md) | Mostra as relações de domínio que a arquitetura precisa preservar. | 10 min |
| [Agregados e invariantes](../ddd/05-aggregates-and-invariants.md) | Explica quais regras exigem consistência e transação. | Consulta |

## Decisões consolidadas

1. Um repositório, um projeto Maven e uma aplicação Spring Boot.
2. Um módulo lógico por Bounded Context, verificado pelo Spring Modulith.
3. Arquitetura Hexagonal dentro de cada módulo.
4. Um PostgreSQL com um schema de negócio por contexto.
5. Chamadas Java internas para respostas imediatas e eventos persistidos para reações.
6. REST e Thymeleaf/HTMX como adaptadores de entrada do mesmo núcleo.
7. Autenticação por sessão e autorização por permissões.
8. Testes em camadas, CI gratuita e deploy local com Docker Compose.

## Restrição de custo

O ambiente essencial não depende de ferramenta paga, cartão de crédito ou serviço em nuvem. Planos gratuitos externos poderão complementar o projeto, mas nunca serão requisito para clonar, testar ou executar a aplicação.

## Estado

| Marco | Situação |
| --- | --- |
| DDD estratégico e tático | ✅ Concluído |
| Decisão arquitetural inicial | ✅ Concluída |
| Fundação Spring Boot | ⏭️ Próxima |
| Fluxos verticais do MVP | ⬜ Planejados |
| Deploy local reproduzível | ⬜ Planejado |

[Voltar ao Hub da documentação](../README.md).
