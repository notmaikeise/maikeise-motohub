# Modelagem DDD

## Estado atual

A modelagem DDD ainda não está concluída. A documentação disponível representa a ideação e o levantamento inicial do domínio.

O projeto não adotará limites de microsserviços antes de identificar os limites reais do negócio.

## Próxima fase: DDD estratégico

O DDD estratégico analisa o domínio em uma visão ampla.

### Entregáveis planejados

1. Linguagem ubíqua revisada.
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
