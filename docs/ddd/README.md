# Modelagem DDD

## Estado atual

A linguagem ubíqua foi consolidada na `BKL-001`, os subdomínios foram identificados na `BKL-002` e os Bounded Contexts foram definidos na `BKL-003`. A modelagem DDD ainda não está concluída e continuará com a criação do Context Map.

O projeto não adotará limites de microsserviços antes de identificar os limites reais do negócio.

| Atividade | Situação |
| --- | --- |
| BKL-001 - Consolidar a linguagem ubíqua | Concluída |
| BKL-002 - Identificar subdomínios | Concluída |
| BKL-003 - Definir Bounded Contexts | Concluída |
| BKL-004 - Criar o Context Map | Próxima |
| BKL-005 a BKL-006 | Backlog |

## DDD estratégico

O DDD estratégico analisa o domínio em uma visão ampla.

### Entregáveis planejados

1. [Linguagem ubíqua revisada](../glossary.md).
2. [Subdomínios Core, Supporting e Generic](01-subdomains.md).
3. [Bounded Contexts](02-bounded-contexts.md).
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

## Próximo passo

A `BKL-004` criará o Context Map para registrar as relações, direções de dependência e formas de integração entre os seis contextos.

## Critério para concluir esta fase

A modelagem será considerada pronta para orientar a arquitetura quando:

- Cada contexto tiver responsabilidade clara.
- Os termos ambíguos tiverem significado acordado.
- As principais invariantes estiverem associadas a agregados.
- As integrações entre contextos estiverem explícitas.
- As decisões e dúvidas relevantes estiverem documentadas.
