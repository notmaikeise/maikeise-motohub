# Modelagem DDD

## Estado atual

A linguagem ubíqua foi consolidada na `BKL-001`, os subdomínios foram identificados na `BKL-002`, os Bounded Contexts foram definidos na `BKL-003`, suas relações foram registradas no Context Map da `BKL-004`, os eventos foram mapeados na `BKL-005` e o modelo tático inicial foi consolidado na `BKL-006`. A modelagem continuará com a decisão arquitetural.

O projeto não adotará limites de microsserviços antes de identificar os limites reais do negócio.

| Atividade | Situação |
| --- | --- |
| BKL-001 - Consolidar a linguagem ubíqua | Concluída |
| BKL-002 - Identificar subdomínios | Concluída |
| BKL-003 - Definir Bounded Contexts | Concluída |
| BKL-004 - Criar o Context Map | Concluída |
| BKL-005 - Mapear eventos de domínio | Concluída |
| BKL-006 - Modelar agregados e invariantes | Concluída |
| BKL-007 - Registrar decisão arquitetural inicial | Próxima |

## DDD estratégico

O DDD estratégico analisa o domínio em uma visão ampla.

### Entregáveis

1. [Linguagem ubíqua revisada](../glossary.md).
2. [Subdomínios Core, Supporting e Generic](01-subdomains.md).
3. [Bounded Contexts](02-bounded-contexts.md).
4. [Context Map](03-context-map.md).
5. [Eventos de domínio e Event Storming textual](04-domain-events.md).

## DDD tático

O DDD tático modela os elementos internos de cada contexto.

### Entregável inicial

[Agregados e invariantes](05-aggregates-and-invariants.md) reúne entidades, Value Objects, Aggregate Roots, regras, repositórios e serviços iniciais por contexto.

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

## Eventos de domínio

A linha do tempo principal foi detalhada desde a habilitação do cliente até a conclusão ou o cancelamento da venda. O mapeamento separa comandos, fatos ocorridos, políticas automáticas e modelos de leitura.

As principais decisões incluem reserva integral de múltiplas unidades, prazo inicial de 48 horas, uma única prorrogação de 24 horas, tentativa automática de reserva após o aceite e cancelamento de venda por ação compensatória.

O resultado completo está em [Eventos de domínio e Event Storming textual](04-domain-events.md).

## Agregados e invariantes

O modelo tático inicial identifica onze Aggregate Roots. `UnidadeEstoque` e `Reserva` permanecem separadas, mas a criação integral da reserva ocorre em uma transação local do mesmo contexto. `Proposta` controla suas versões internamente, enquanto `Venda` preserva o registro comercial definitivo.

Entidades internas e Value Objects não possuem repositórios próprios. Referências entre agregados utilizam IDs tipados, e regras globais recebem proteção adicional por restrições no banco.

O resultado completo está em [Agregados e invariantes](05-aggregates-and-invariants.md).

## Próximo passo

A `BKL-007` formalizará o monólito modular, a Arquitetura Hexagonal, as regras de dependência, as transações e a entrega confiável de eventos.

## Critério para concluir esta fase

O modelo inicial é considerado pronto para orientar a arquitetura porque:

- Cada contexto tem responsabilidade clara.
- Os termos ambíguos possuem significado acordado.
- As principais invariantes estão associadas a agregados.
- As integrações entre contextos estão explícitas.
- As decisões e dúvidas relevantes estão documentadas.
