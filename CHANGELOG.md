# Changelog

Todas as mudanças relevantes deste projeto serão registradas neste arquivo.

## [Unreleased]

### Added

- Documento sobre a origem acadêmica, os limites de autoria e o propósito individual do projeto.
- Visão inicial do produto.
- Escopo e atores do MVP.
- Jornada principal do cliente.
- Regras de negócio iniciais.
- Requisitos funcionais e não funcionais.
- Backlog inicial e guia do GitHub Projects.
- Templates para issues.
- Documento de identificação e classificação dos subdomínios.
- Documento de definição dos Bounded Contexts e da propriedade dos dados.

### Changed

- Consolidação da linguagem ubíqua do domínio.
- Padronização de `cliente` como termo oficial no lugar de `comprador`.
- Distinção entre cliente, representante, funcionário, conta de acesso e papel de acesso.
- Distinção entre modelo de motocicleta, unidade de estoque e unidade disponível.
- Distinção entre solicitação de proposta, proposta, aceite e reserva.
- Definição de preço anunciado, desconto global da proposta e snapshot comercial.
- Padronização de `venda` como registro do domínio e `compra` como perspectiva do cliente.
- Classificação inicial das capacidades Core, Supporting e Generic do domínio.
- Definição dos seis contextos iniciais: Identity and Access, Customer Management, Catalog, Inventory and Reservation, Commercial e Audit.
- Separação entre Catálogo e Estoque e união entre Estoque e Reservas para preservar a exclusividade de cada unidade.
- Registro da hipótese de monólito modular com Arquitetura Hexagonal, a ser formalizada por ADR.
