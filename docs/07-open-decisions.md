# Decisões em aberto

Este documento registra perguntas ainda não respondidas. Elas não devem ser tratadas como requisitos definitivos antes de uma decisão explícita.

| ID | Pergunta | Momento recomendado |
| --- | --- | --- |
| DEC-001 | Qual será o prazo máximo de prorrogação de uma reserva? | Modelagem de Reservas |
| DEC-002 | Existe um desconto máximo que nem o gerente poderá aprovar? | Modelagem de Propostas |
| DEC-003 | A reserva de várias unidades será confirmada integralmente ou poderá ser parcial? | Modelagem de Reservas |
| DEC-004 | Uma empresa poderá possuir vários representantes com contas próprias no MVP? | Modelagem de Clientes |
| DEC-005 | Como funcionará o cancelamento ou estorno de uma venda concluída? | Evolução pós-MVP |
| DEC-006 | A primeira concessionária terá uma ou várias filiais? | DDD estratégico |
| DEC-007 | Quais ações exigirão auditoria detalhada? | Arquitetura e segurança |
| DEC-009 | Qual licença será aplicada ao repositório público? | Antes da primeira versão pública de código |
| DEC-010 | Qual estratégia de interface será usada: Thymeleaf ou frontend separado? | ADR de arquitetura |

## Decisões já tomadas

| ID | Decisão |
| --- | --- |
| DEC-C-001 | O produto se chama Maikeise MotoHub. |
| DEC-C-002 | O MVP atende clientes PF e PJ. |
| DEC-C-003 | Clientes, representantes e funcionários acessam o sistema diretamente por contas individuais. |
| DEC-C-004 | O MVP atende uma concessionária; multi-tenancy é uma evolução. |
| DEC-C-005 | A proposta vale sete dias. |
| DEC-C-006 | A reserva acontece depois do aceite da proposta. |
| DEC-C-007 | A reserva vale 72 horas. |
| DEC-C-008 | O vendedor concede até 10% de desconto sem aprovação. |
| DEC-C-009 | Pagamento online não integra o MVP. |
| DEC-C-010 | `Cliente` é o termo oficial do domínio; `comprador` permanece apenas como expressão informal. |
| DEC-C-011 | O catálogo apresenta separadamente cada unidade física disponível, mesmo quando várias pertencem ao mesmo modelo. |
| DEC-C-012 | O catálogo exibe o preço anunciado, sujeito às condições comerciais da proposta. |
| DEC-C-013 | Solicitação de proposta e proposta são conceitos distintos; nenhuma delas reserva unidades. |
| DEC-C-014 | Cliente, representante e funcionário são conceitos de negócio distintos de conta e papel de acesso. |
| DEC-C-015 | No MVP, o desconto comercial é global e calculado sobre o valor bruto total da proposta. |
| DEC-C-016 | `Venda` é o registro oficial do domínio; `compra` é a perspectiva apresentada ao cliente. |
