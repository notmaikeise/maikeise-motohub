# Modelagem DDD

## Estado atual

A linguagem ubíqua inicial foi consolidada na `BKL-001`. A modelagem DDD ainda não está concluída e continuará com a identificação dos subdomínios.

O projeto não adotará limites de microsserviços antes de identificar os limites reais do negócio.

| Atividade | Situação |
| --- | --- |
| BKL-001 - Consolidar a linguagem ubíqua | Concluída |
| BKL-002 - Identificar subdomínios | Próxima |
| BKL-003 a BKL-006 | Backlog |

## Próxima fase: DDD estratégico

O DDD estratégico analisa o domínio em uma visão ampla.

### Entregáveis planejados

1. [Linguagem ubíqua revisada](../glossary.md).
2. Subdomínios central, de apoio e genéricos.
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

## Hipótese inicial, ainda não aprovada

Os documentos atuais sugerem áreas como Clientes, Catálogo/Estoque e Comercial. Esses nomes ainda não representam Bounded Contexts confirmados.

## Critério para concluir esta fase

A modelagem será considerada pronta para orientar a arquitetura quando:

- Cada contexto tiver responsabilidade clara.
- Os termos ambíguos tiverem significado acordado.
- As principais invariantes estiverem associadas a agregados.
- As integrações entre contextos estiverem explícitas.
- As decisões e dúvidas relevantes estiverem documentadas.
