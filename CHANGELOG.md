# Changelog

Todas as mudanças relevantes deste projeto serão registradas neste arquivo.

## [Unreleased]

### Added

- Hub central da documentação com trilhas de leitura para recrutadores, avaliação acadêmica e estudo técnico.
- Resumo executivo do DDD com contextos, fluxo comercial, regras-chave, agregados e decisões em aberto.
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
- Context Map com relações, padrões e modos de integração entre os contextos.
- Event Storming textual com comandos, eventos, políticas, processos temporais e caminhos alternativos.
- Modelo tático inicial com Aggregate Roots, entidades, Value Objects, invariantes, repositórios e fronteiras transacionais.

### Changed

- Reorganização do README e dos documentos extensos com resumos, navegação, callouts e detalhamento progressivo.
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
- Definição de Partnership entre Commercial e Inventory and Reservation.
- Definição de Customer/Supplier, Open Host Service, Published Language e Anti-Corruption Layer nas demais relações.
- Separação entre operações síncronas e atualizações assíncronas com consistência eventual.
- Proibição de Shared Kernel, entidades, repositórios, associações JPA e consultas de tabelas entre contextos.
- Redução do prazo inicial da reserva de 72 para 48 horas, com uma única prorrogação gerencial de 24 horas.
- Definição da reserva integral de múltiplas unidades: todas são bloqueadas ou nenhuma delas é.
- Definição do convite de funcionários, confirmação de e-mail de clientes e habilitação comercial.
- Definição dos estados `EM_REVISAO` e `FORA_DE_VENDA` para o ciclo das unidades.
- Definição do cancelamento da venda como ação compensatória, com revisão obrigatória das unidades.
- Definição de avisos por e-mail 24 horas antes do vencimento de propostas e reservas.
- Definição de onze Aggregate Roots distribuídas entre os seis Bounded Contexts.
- Definição de `UnidadeEstoque` e `Reserva` como raízes separadas, coordenadas atomicamente no mesmo contexto.
- Definição de `VersaoProposta` como entidade interna de `Proposta` e de `Venda` como raiz independente.
- Definição de múltiplos vínculos de representantes dentro do agregado `Cliente` pessoa jurídica.
- Definição de IDs tipados, repositório somente para Aggregate Roots e proteção de unicidade em camadas.
