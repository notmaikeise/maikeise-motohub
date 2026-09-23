# Regras de negócio

## Convenção

As regras seguem o padrão `RN-ÁREA-NÚMERO`.

| Código | Área |
| --- | --- |
| `CLI` | Clientes |
| `MOT` | Motocicletas e estoque |
| `PRO` | Solicitações e propostas |
| `RES` | Reservas |
| `VEN` | Vendas |
| `ACE` | Acesso |

## Clientes

| Código | Regra |
| --- | --- |
| RN-CLI-001 | Todo cliente deve ser cadastrado como pessoa física ou pessoa jurídica. |
| RN-CLI-002 | Um cliente pessoa física deve possuir um CPF matematicamente válido. |
| RN-CLI-003 | Um cliente pessoa jurídica deve possuir um CNPJ matematicamente válido. |
| RN-CLI-004 | Não pode existir mais de um cliente com o mesmo CPF ou CNPJ. |
| RN-CLI-005 | Todo cliente PF e todo representante deve utilizar uma conta de acesso individual. |
| RN-CLI-006 | Uma pessoa jurídica deve possuir pelo menos um representante responsável. |
| RN-CLI-007 | Somente clientes ativos podem solicitar propostas ou reservas. |
| RN-CLI-008 | A inativação de um cliente não apaga seu histórico de propostas, reservas e vendas. |
| RN-CLI-009 | O MVP valida formato e dígitos de CPF e CNPJ sem consultar serviços externos. |

## Motocicletas e estoque

### Modelo e unidade

Um **modelo de motocicleta** descreve um produto genérico, como marca, modelo, versão e especificações. Uma **unidade de estoque** representa uma motocicleta física específica, identificada pelo chassi e escolhida individualmente pelo cliente.

| Código | Regra |
| --- | --- |
| RN-MOT-001 | Toda unidade deve estar vinculada a um modelo cadastrado. |
| RN-MOT-002 | Cada unidade deve possuir um número de chassi único. |
| RN-MOT-003 | O número do motor deve ser único quando informado. |
| RN-MOT-004 | A placa deve ser única quando informada. |
| RN-MOT-005 | Uma nova unidade entra no estoque com status `EM_PREPARACAO`. |
| RN-MOT-006 | A unidade somente muda de `EM_PREPARACAO` para `DISPONIVEL` após a confirmação da preparação pelo responsável. |
| RN-MOT-007 | Somente uma unidade `DISPONIVEL` pode aparecer no catálogo e ser escolhida para uma nova solicitação de proposta. |
| RN-MOT-008 | Uma unidade `RESERVADA` não pode ser incluída em outra proposta ou reserva. |
| RN-MOT-009 | Uma unidade `VENDIDA` não pode voltar ao estoque por uma edição comum. |
| RN-MOT-010 | Uma unidade `INATIVA` não aparece no catálogo dos clientes. |
| RN-MOT-011 | Uma unidade com histórico comercial não pode ser apagada definitivamente. |
| RN-MOT-012 | A inativação preserva todo o histórico da unidade. |
| RN-MOT-013 | O preço anunciado de uma unidade disponível deve ser maior que zero. |
| RN-MOT-014 | O ano de fabricação não pode ser posterior ao próximo ano-calendário. |
| RN-MOT-015 | Toda alteração de status registra data, horário e conta responsável. |
| RN-MOT-016 | Cada unidade física aparece separadamente no catálogo, mesmo quando existem unidades do mesmo modelo. |

### Status de uma unidade

```text
EM_PREPARACAO
DISPONIVEL
RESERVADA
VENDIDA
INATIVA
```

### Transições permitidas inicialmente

```mermaid
stateDiagram-v2
    [*] --> EM_PREPARACAO
    EM_PREPARACAO --> DISPONIVEL
    EM_PREPARACAO --> INATIVA
    DISPONIVEL --> RESERVADA
    DISPONIVEL --> INATIVA
    RESERVADA --> DISPONIVEL
    RESERVADA --> VENDIDA
    INATIVA --> EM_PREPARACAO
```

O cancelamento de uma venda exigirá um fluxo específico de estorno em uma versão futura.

## Solicitações e propostas

| Código | Regra |
| --- | --- |
| RN-PRO-001 | Toda solicitação de proposta deve estar vinculada a um único cliente ativo. |
| RN-PRO-002 | Uma solicitação de proposta deve conter uma ou mais unidades específicas escolhidas pelo cliente. |
| RN-PRO-003 | A solicitação demonstra interesse comercial, mas não constitui uma oferta e não reserva unidades. |
| RN-PRO-004 | Uma proposta é preparada por um vendedor para um único cliente a partir de uma solicitação. |
| RN-PRO-005 | Uma proposta deve conter unidades específicas, valores, desconto comercial, condições e validade. |
| RN-PRO-006 | O valor bruto da proposta corresponde à soma dos preços anunciados capturados na criação da versão. |
| RN-PRO-007 | No MVP, o desconto comercial é aplicado ao valor bruto total, e o valor final corresponde ao valor bruto menos o desconto. |
| RN-PRO-008 | O vendedor pode conceder desconto de até 10% sobre o valor bruto sem aprovação gerencial. |
| RN-PRO-009 | Desconto superior a 10% exige aprovação do gerente. |
| RN-PRO-010 | Uma proposta aguardando aprovação não pode ser enviada ao cliente. |
| RN-PRO-011 | O vendedor não pode aprovar o desconto de uma proposta criada por ele. |
| RN-PRO-012 | A análise de desconto registra solicitante, responsável pela decisão, data e resultado. |
| RN-PRO-013 | Se o gerente rejeitar o desconto, a proposta volta ao vendedor para ajuste. |
| RN-PRO-014 | Mudanças em valores ou descontos depois da aprovação exigem nova análise. |
| RN-PRO-015 | A proposta permanece válida por sete dias contados a partir do envio ao cliente. |
| RN-PRO-016 | O cliente somente pode aceitar ou recusar uma proposta enviada e dentro da validade. |
| RN-PRO-017 | Uma proposta não aceita no prazo muda automaticamente para `EXPIRADA`. |
| RN-PRO-018 | Uma proposta expirada não pode ser aceita ou originar uma reserva. |
| RN-PRO-019 | O envio ou o aceite de uma proposta não reserva automaticamente as unidades. |
| RN-PRO-020 | No momento da solicitação de reserva, o sistema verifica novamente todas as unidades. |
| RN-PRO-021 | Alterações feitas depois do envio geram uma nova versão da proposta. |
| RN-PRO-022 | Versões anteriores são preservadas, mas não podem ser aceitas depois de substituídas. |
| RN-PRO-023 | Uma proposta aceita não pode ser alterada. Uma mudança exige cancelamento e nova versão. |
| RN-PRO-024 | Uma alteração posterior no preço anunciado não modifica versões de proposta já criadas. |

### Status de uma solicitação de proposta

```text
RECEBIDA
EM_ANALISE
ATENDIDA
CANCELADA
```

### Status de uma proposta

```text
EM_ELABORACAO
AGUARDANDO_APROVACAO
PRONTA_PARA_ENVIO
ENVIADA
ACEITA
RECUSADA
EXPIRADA
CANCELADA
SUBSTITUIDA
CONVERTIDA_EM_VENDA
```

Os estados e suas transições serão validados durante o mapeamento de eventos de domínio da `BKL-005`.

## Reservas

| Código | Regra |
| --- | --- |
| RN-RES-001 | Uma unidade somente pode ser reservada se estiver `DISPONIVEL`. |
| RN-RES-002 | O cliente somente pode solicitar a reserva depois de aceitar uma proposta válida. |
| RN-RES-003 | A reserva deve estar vinculada ao mesmo cliente e à mesma proposta aceita. |
| RN-RES-004 | Uma unidade não pode possuir duas reservas ativas simultaneamente. |
| RN-RES-005 | A confirmação da reserva muda a unidade de `DISPONIVEL` para `RESERVADA`. |
| RN-RES-006 | A reserva permanece ativa por 72 horas a partir da confirmação. |
| RN-RES-007 | Sem confirmação da venda no prazo, a reserva expira automaticamente. |
| RN-RES-008 | O cancelamento ou expiração libera a unidade, desde que não exista outro impedimento. |
| RN-RES-009 | A confirmação da venda muda a unidade de `RESERVADA` para `VENDIDA`. |
| RN-RES-010 | O cancelamento pelo cliente libera imediatamente as unidades. |
| RN-RES-011 | O gerente pode prorrogar uma reserva antes da expiração, registrando uma justificativa. |

## Vendas

| Código | Regra |
| --- | --- |
| RN-VEN-001 | Uma venda somente pode ser concluída a partir de uma proposta aceita. |
| RN-VEN-002 | A proposta deve possuir uma reserva ativa vinculada ao mesmo cliente. |
| RN-VEN-003 | Todas as unidades da venda devem estar reservadas para o cliente da proposta. |
| RN-VEN-004 | Uma reserva expirada ou cancelada não pode concluir uma venda. |
| RN-VEN-005 | No MVP, o pagamento acontece fora do Maikeise MotoHub. |
| RN-VEN-006 | A venda exige o registro da confirmação do pagamento externo por funcionário autorizado. |
| RN-VEN-007 | Somente vendedores e gerentes podem concluir uma venda. |
| RN-VEN-008 | A conclusão da venda muda todas as unidades de `RESERVADA` para `VENDIDA`. |
| RN-VEN-009 | A proposta utilizada muda para `CONVERTIDA_EM_VENDA`. |
| RN-VEN-010 | A venda preserva um snapshot dos valores, descontos e condições da proposta aceita. |
| RN-VEN-011 | Uma venda concluída não pode ter seus valores alterados por uma edição comum. |
| RN-VEN-012 | O sistema registra quem concluiu a venda e quando. |

## Acesso

| Código | Regra |
| --- | --- |
| RN-ACE-001 | Cada pessoa que acessa o sistema deve utilizar uma conta individual. |
| RN-ACE-002 | O e-mail utilizado por uma conta de acesso deve ser único. |
| RN-ACE-003 | Um cliente PF somente consulta e altera os próprios dados. |
| RN-ACE-004 | Um representante somente age em nome dos clientes PJ aos quais estiver vinculado. |
| RN-ACE-005 | Clientes e representantes somente consultam as propostas, reservas e vendas às quais possuem vínculo. |
| RN-ACE-006 | O responsável pelo estoque gerencia modelos e unidades, mas não aprova descontos. |
| RN-ACE-007 | O vendedor cria propostas e conclui vendas, mas não aprova descontos acima da própria alçada. |
| RN-ACE-008 | O gerente pode aprovar ou rejeitar descontos superiores a 10%. |
| RN-ACE-009 | Somente o administrador gerencia contas e papéis de acesso de funcionários. |
| RN-ACE-010 | Nenhuma conta pode aumentar as próprias permissões. |
| RN-ACE-011 | Operações importantes registram a conta responsável, a data e o horário. |
