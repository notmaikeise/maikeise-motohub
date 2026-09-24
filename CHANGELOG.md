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
- Visão arquitetural inicial com módulos, persistência, integrações, segurança, testes e execução local.
- ADR-001 formalizando o monólito modular com Arquitetura Hexagonal.
- Catálogo estruturado com 90 cards do planejamento, cobrindo o MVP até a release local.
- Script idempotente para criar issues, labels e preencher os campos do GitHub Project em lote.
- Documento transparente sobre como a IA apoia o estudo, quais decisões continuam humanas e como suas sugestões serão verificadas durante o desenvolvimento.

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
- Formalização do monólito modular com Arquitetura Hexagonal como arquitetura inicial aceita.
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
- Definição de um projeto Maven único com seis módulos lógicos protegidos pelo Spring Modulith.
- Definição de um PostgreSQL com schema por Bounded Context e JPA restrito aos adaptadores.
- Definição do Event Publication Registry para eventos confiáveis e de lock pessimista para reservas concorrentes.
- Escolha de REST e Thymeleaf/HTMX como adaptadores de entrada, com autenticação por sessão.
- Registro da baseline Java 21, Spring Boot 4.1, testes com Testcontainers, Docker Compose e CI gratuita.
- Expansão do backlog com interface web, API, segurança, observabilidade, empacotamento e apresentação de portfólio.
- Compatibilidade do script de backlog com Windows PowerShell e validação conjunta das opções ausentes no GitHub Project antes de qualquer escrita.
