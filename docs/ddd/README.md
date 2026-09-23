# Modelagem DDD

## Estado atual

A linguagem ubíqua foi consolidada na `BKL-001`, os subdomínios foram identificados na `BKL-002`, os Bounded Contexts foram definidos na `BKL-003` e suas relações foram registradas no Context Map da `BKL-004`. A modelagem continuará com os eventos de domínio.

O projeto não adotará limites de microsserviços antes de identificar os limites reais do negócio.

| Atividade | Situação |
| --- | --- |
| BKL-001 - Consolidar a linguagem ubíqua | Concluída |
| BKL-002 - Identificar subdomínios | Concluída |
| BKL-003 - Definir Bounded Contexts | Concluída |
| BKL-004 - Criar o Context Map | Concluída |
| BKL-005 - Mapear eventos de domínio | Próxima |
| BKL-006 - Modelar agregados e invariantes | Backlog |

## DDD estratégico

O DDD estratégico analisa o domínio em uma visão ampla.

### Entregáveis planejados

1. [Linguagem ubíqua revisada](../glossary.md).
2. [Subdomínios Core, Supporting e Generic](01-subdomains.md).
3. [Bounded Contexts](02-bounded-contexts.md).
4. [Context Map](03-context-map.md).
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

Esses subdomínios representam o espaço do problema e não correspondem automaticamente a Bounded Contexts ou microsserviços.

## Bounded Contexts definidos

O modelo inicial foi dividido em seis limites de solução:

- **Identity and Access:** contas, autenticação, papéis e permissões.
- **Customer Management:** clientes PF, clientes PJ e representantes.
- **Catalog:** apresentação pública dos modelos e anúncios das unidades.
- **Inventory and Reservation:** unidades físicas, disponibilidade e reservas.
- **Commercial:** solicitações, propostas, descontos, aceite, pagamento confirmado e vendas.
- **Audit:** rastreabilidade estruturada das ações relevantes.

Catálogo foi separado do controle operacional do estoque porque possuem modelos e ritmos de mudança diferentes. Estoque e Reservas permanecem juntos para garantir a invariante de que uma unidade não pode participar de duas reservas ativas simultaneamente.

A descrição completa está em [Bounded Contexts do Maikeise MotoHub](02-bounded-contexts.md).

## Context Map

As relações iniciais foram definidas com os seguintes padrões:

- **Partnership:** Commercial e Inventory and Reservation.
- **Customer/Supplier:** Customer Management fornece dados comerciais para Commercial.
- **Anti-Corruption Layer:** Commercial traduz anúncio e preço recebidos de Catalog.
- **Open Host Service:** Identity and Access fornece identidade e permissões aos contextos protegidos.
- **Published Language:** contratos e eventos conectam Catalog, Inventory and Reservation e Audit.

Consultas necessárias à decisão atual são inicialmente síncronas. Disponibilidade pública e auditoria aceitam consistência eventual por eventos assíncronos.

O mapa completo está em [Context Map do Maikeise MotoHub](03-context-map.md).

## Próximo passo

A `BKL-005` mapeará eventos, comandos, decisões e reações ao longo do fluxo comercial.

## Critério para concluir esta fase

A modelagem será considerada pronta para orientar a arquitetura quando:

- Cada contexto tiver responsabilidade clara.
- Os termos ambíguos tiverem significado acordado.
- As principais invariantes estiverem associadas a agregados.
- As integrações entre contextos estiverem explícitas.
- As decisões e dúvidas relevantes estiverem documentadas.
