# Modelagem DDD

## Estado atual

A linguagem ubíqua inicial foi consolidada na `BKL-001` e os subdomínios foram identificados na `BKL-002`. A modelagem DDD ainda não está concluída e continuará com a definição dos Bounded Contexts.

O projeto não adotará limites de microsserviços antes de identificar os limites reais do negócio.

| Atividade | Situação |
| --- | --- |
| BKL-001 - Consolidar a linguagem ubíqua | Concluída |
| BKL-002 - Identificar subdomínios | Concluída |
| BKL-003 - Definir Bounded Contexts | Próxima |
| BKL-004 a BKL-006 | Backlog |

## DDD estratégico

O DDD estratégico analisa o domínio em uma visão ampla.

### Entregáveis planejados

1. [Linguagem ubíqua revisada](../glossary.md).
2. [Subdomínios Core, Supporting e Generic](01-subdomains.md).
3. Bounded Contexts.
4. Context Map.
5. Eventos de domínio e Event Storming textual.

## Fase seguinte: DDD tático

O DDD tático modela os elementos internos de cada contexto.

### Entregáveis planejados

1. Entidades.
2. Value Objects.
3. Agregados e Aggregate Roots.
4. Invariantes.
5. Serviços de domínio.
6. Repositórios.
7. Serviços de aplicação.
8. Diagramas do modelo.

## Subdomínios identificados

O levantamento atual identificou:

- **Core:** Negociação e Vendas; Disponibilidade e Reservas.
- **Supporting:** Catálogo e Estoque; Gestão de Clientes; Rastreabilidade e Auditoria.
- **Generic:** Identidade e Acesso.

Esses subdomínios representam o espaço do problema. Eles ainda não definem Bounded Contexts ou microsserviços.

## Critério para concluir esta fase

A modelagem será considerada pronta para orientar a arquitetura quando:

- Cada contexto tiver responsabilidade clara.
- Os termos ambíguos tiverem significado acordado.
- As principais invariantes estiverem associadas a agregados.
- As integrações entre contextos estiverem explícitas.
- As decisões e dúvidas relevantes estiverem documentadas.
