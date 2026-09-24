# Decisões em aberto

Este documento registra perguntas ainda não respondidas. Elas não devem ser tratadas como requisitos definitivos antes de uma decisão explícita.

> [!NOTE]
> Uma decisão em aberto não representa falha de planejamento. Ela mostra que o projeto reconhece a dúvida e sabe em qual etapa deverá resolvê-la.

> [!IMPORTANT]
> Como o projeto está em pausa, estas perguntas permanecem conscientemente sem resposta. Elas deverão ser revisitadas antes de qualquer implementação e não devem ser inferidas a partir dos cards planejados.

| ID | Pergunta | Momento recomendado |
| --- | --- | --- |
| DEC-002 | Existe um desconto máximo que nem o gerente poderá aprovar? | Modelagem de Propostas |
| DEC-006 | A primeira concessionária terá uma ou várias filiais? | DDD estratégico |
| DEC-009 | Qual licença será aplicada ao repositório público? | Antes da primeira versão pública de código |
| DEC-016 | Quem poderá vincular ou encerrar representantes de um cliente PJ? | Autorização e casos de uso antes da implementação |

<details>
<summary><strong>Consultar o histórico de decisões já tomadas</strong></summary>

## Decisões já tomadas

| ID | Decisão |
| --- | --- |
| DEC-C-001 | O produto se chama Maikeise MotoHub. |
| DEC-C-002 | O MVP atende clientes PF e PJ. |
| DEC-C-003 | Clientes, representantes e funcionários acessam o sistema diretamente por contas individuais. |
| DEC-C-004 | O MVP atende uma concessionária; multi-tenancy é uma evolução. |
| DEC-C-005 | A proposta vale sete dias. |
| DEC-C-006 | A reserva acontece depois do aceite da proposta. |
| DEC-C-007 | A reserva vale inicialmente 48 horas e admite uma única prorrogação gerencial de 24 horas, antes do vencimento e com justificativa. |
| DEC-C-008 | O vendedor concede até 10% de desconto sem aprovação. |
| DEC-C-009 | Pagamento online não integra o MVP. |
| DEC-C-010 | `Cliente` é o termo oficial do domínio; `comprador` permanece apenas como expressão informal. |
| DEC-C-011 | O catálogo apresenta separadamente cada unidade física anunciada, mesmo quando várias pertencem ao mesmo modelo; unidades reservadas podem continuar visíveis sem seleção. |
| DEC-C-012 | O catálogo exibe o preço anunciado, sujeito às condições comerciais da proposta. |
| DEC-C-013 | Solicitação e proposta são conceitos distintos; o envio não reserva unidades, enquanto o aceite dispara uma tentativa separada de reserva. |
| DEC-C-014 | Cliente, representante e funcionário são conceitos de negócio distintos de conta e papel de acesso. |
| DEC-C-015 | No MVP, o desconto comercial é global e calculado sobre o valor bruto total da proposta. |
| DEC-C-016 | `Venda` é o registro oficial do domínio; `compra` é a perspectiva apresentada ao cliente. |
| DEC-C-017 | Negociação e Vendas e Disponibilidade e Reservas são os subdomínios Core iniciais. |
| DEC-C-018 | Catálogo e Estoque, Gestão de Clientes e Rastreabilidade e Auditoria são Supporting; Identidade e Acesso é Generic. |
| DEC-C-019 | Os seis Bounded Contexts iniciais são Identity and Access, Customer Management, Catalog, Inventory and Reservation, Commercial e Audit. |
| DEC-C-020 | Catálogo permanece separado do controle operacional do estoque; Estoque e Reservas ficam no mesmo contexto para proteger a exclusividade da unidade. |
| DEC-C-021 | A arquitetura inicial é um monólito modular com um módulo por Bounded Context e Arquitetura Hexagonal dentro de cada módulo, formalizada pela `ADR-001`. |
| DEC-C-022 | Commercial e Inventory and Reservation mantêm uma Partnership, com respostas síncronas para reservar unidades e confirmar o uso da reserva. |
| DEC-C-023 | Customer Management é upstream de Commercial em uma relação Customer/Supplier; Commercial guarda apenas referências e snapshots necessários. |
| DEC-C-024 | Catalog fornece anúncio e preço para Commercial, que protege seu modelo com uma Anti-Corruption Layer e preserva um snapshot. |
| DEC-C-025 | Catalog valida a referência do modelo de forma síncrona; Inventory and Reservation atualiza a disponibilidade pública por eventos assíncronos. |
| DEC-C-026 | Identity and Access fornece um Open Host Service mínimo de autenticação e autorização; as regras de negócio permanecem nos contextos correspondentes. |
| DEC-C-027 | Audit é downstream assíncrono dos demais contextos e não substitui suas fontes oficiais de estado. |
| DEC-C-028 | Os contextos não compartilham entidades, repositórios, associações JPA, tabelas ou Shared Kernel; a integração usa identificadores, contratos, snapshots e eventos. |
| DEC-C-029 | O aceite de uma proposta dispara automaticamente a tentativa de reserva, mas aceite e reserva permanecem fatos distintos. |
| DEC-C-030 | A reserva de várias unidades é integral: todas são reservadas ou nenhuma delas é bloqueada. |
| DEC-C-031 | Toda venda do MVP nasce de proposta aceita, reserva ativa e confirmação de pagamento externo. |
| DEC-C-032 | A confirmação de pagamento registra forma, data, funcionário e referência externa opcional, sem dados bancários ou cartão. |
| DEC-C-033 | Uma venda somente pode ser cancelada pelo gerente, com justificativa; o registro original é preservado e suas unidades seguem para revisão. |
| DEC-C-034 | O cliente confirma o e-mail e completa os dados mínimos antes de realizar operações comerciais. |
| DEC-C-035 | Funcionários entram apenas por convite do administrador e recebem permissões por papéis de acesso. |
| DEC-C-036 | Cliente PF precisa ter pelo menos 18 anos; cliente PJ precisa possuir ao menos um representante vinculado. |
| DEC-C-037 | CPF e CNPJ não são alterados diretamente pelo cliente; a correção é gerencial, justificada e auditada. |
| DEC-C-038 | O bloqueio comercial impede novas negociações e encaminha operações abertas para análise sem cancelá-las automaticamente. |
| DEC-C-039 | Uma unidade reservada permanece visível no catálogo como indisponível para seleção; uma unidade vendida tem o anúncio arquivado. |
| DEC-C-040 | O ciclo da unidade utiliza `EM_PREPARACAO`, `DISPONIVEL`, `RESERVADA`, `VENDIDA`, `EM_REVISAO` e `FORA_DE_VENDA`. |
| DEC-C-041 | O MVP envia notificações somente por e-mail e avisa 24 horas antes do vencimento de propostas e reservas. |
| DEC-C-042 | Falha de e-mail não desfaz a operação de negócio; o envio falho é registrado para nova tentativa. |
| DEC-C-043 | As ações obrigatoriamente auditadas estão enumeradas no Event Storming textual da `BKL-005`. |
| DEC-C-044 | `UnidadeEstoque` e `Reserva` são Aggregate Roots separadas, coordenadas atomicamente em uma transação local de Inventory and Reservation. |
| DEC-C-045 | `Reserva` guarda referências por IDs, usa os estados `ATIVA`, `CANCELADA`, `EXPIRADA` e `UTILIZADA`, e não possui `PRORROGADA` ou `RECUSADA` como estados. |
| DEC-C-046 | Commercial possui `SolicitacaoProposta`, `Proposta` e `Venda` como raízes; `VersaoProposta` pertence internamente a `Proposta`. |
| DEC-C-047 | `Cliente` é uma raiz com perfil PF ou PJ; cliente PJ pode possuir vários vínculos de representantes com contas próprias. |
| DEC-C-048 | Catalog possui `ModeloMotocicleta` e `Anuncio` como raízes; situação editorial e disponibilidade pública do anúncio são dimensões separadas. |
| DEC-C-049 | Identity and Access possui `ContaAcesso` e `ConviteFuncionario`; Audit possui `RegistroAuditoria` imutável. |
| DEC-C-050 | Agregados usam IDs tipados e apenas Aggregate Roots possuem repositórios. |
| DEC-C-051 | Unicidades globais usam consulta para erro amigável e restrição no banco para proteção concorrente. |
| DEC-C-052 | Entrega e repetição de e-mail permanecem uma preocupação técnica e não formam um agregado de negócio nesta fase. |
| DEC-C-053 | O MVP será implantado como um monólito modular; uma futura extração de microsserviços exigirá evidências operacionais e uma nova ADR. |
| DEC-C-054 | O repositório terá um único projeto Maven, com módulos lógicos Spring Modulith organizados em `api` e `internal` e Arquitetura Hexagonal. |
| DEC-C-055 | Uma instância PostgreSQL terá um schema por contexto, sem consultas, associações JPA ou chaves estrangeiras atravessando schemas; domínio e entidades JPA serão separados por Data Mappers. |
| DEC-C-056 | Decisões que exigem resposta imediata usam APIs Java dos módulos; reações assíncronas usam eventos persistidos pelo Event Publication Registry. |
| DEC-C-057 | A reserva integral usa transação local e lock pessimista das unidades em ordem estável para impedir bloqueios concorrentes e reduzir deadlocks. |
| DEC-C-058 | Conta e cadastro de cliente são criados em etapas locais, idempotentes e recuperáveis, sem transação distribuída. |
| DEC-C-059 | A venda utiliza a reserva por uma operação síncrona idempotente e registra evento persistido; `operationId`, repetição segura e unicidade por `reservaId` evitam duplicidade. |
| DEC-C-060 | Expirações e novas tentativas usam `@Scheduled`, uma abstração de `Clock` e operações idempotentes. |
| DEC-C-061 | A interface combina REST, OpenAPI e Thymeleaf/HTMX na mesma aplicação; a autenticação web usa sessão, Spring Security, CSRF e permissões explícitas. |
| DEC-C-062 | A base técnica usa Java 21, Spring Boot 4.1, Spring Modulith 2.1, Maven, PostgreSQL, Testcontainers, Docker Compose e GitHub Actions, sem serviço pago obrigatório. |

</details>

[Voltar ao Hub da documentação](README.md).
