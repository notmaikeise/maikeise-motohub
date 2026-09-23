# Requisitos

## Convenções

- `RF`: requisito funcional, descreve o que o sistema faz.
- `RNF`: requisito não funcional, descreve qualidades ou restrições.

## Requisitos funcionais

### Autenticação e acesso

| Código | Requisito |
| --- | --- |
| RF-AUT-001 | Autenticar pessoas por meio de uma conta de acesso individual. |
| RF-AUT-002 | Permitir a saída segura de uma conta autenticada. |
| RF-AUT-003 | Permitir que o administrador convide, bloqueie e desative contas de funcionários. |
| RF-AUT-004 | Permitir que o administrador atribua papéis de acesso. |
| RF-AUT-005 | Restringir funcionalidades conforme as permissões da conta autenticada. |
| RF-AUT-006 | Impedir que uma conta altere as próprias permissões. |
| RF-AUT-007 | Exigir confirmação do e-mail da conta do cliente antes de operações comerciais. |
| RF-AUT-008 | Exigir confirmação do novo e-mail antes de substituir o endereço de acesso atual. |

### Clientes

| Código | Requisito |
| --- | --- |
| RF-CLI-001 | Cadastrar clientes pessoa física e vinculá-los a uma conta de acesso. |
| RF-CLI-002 | Cadastrar clientes pessoa jurídica e seus representantes com contas de acesso individuais. |
| RF-CLI-003 | Validar formato e dígitos de CPF e CNPJ. |
| RF-CLI-004 | Permitir que o cliente PF consulte e edite os próprios dados. |
| RF-CLI-005 | Permitir que o representante consulte e edite os dados do cliente PJ vinculado. |
| RF-CLI-006 | Permitir que funcionários autorizados pesquisem clientes. |
| RF-CLI-007 | Inativar clientes sem apagar o histórico. |
| RF-CLI-008 | Exigir idade mínima de 18 anos para habilitar comercialmente um cliente PF no MVP. |
| RF-CLI-009 | Permitir que um gerente corrija CPF ou CNPJ com motivo e auditoria. |
| RF-CLI-010 | Impedir que o cliente altere diretamente o próprio CPF ou CNPJ. |
| RF-CLI-011 | Bloquear comercialmente um cliente sem apagar nem cancelar automaticamente suas operações existentes. |
| RF-CLI-012 | Encaminhar propostas e reservas abertas de cliente bloqueado para análise gerencial. |
| RF-CLI-013 | Permitir vários representantes por cliente PJ e impedir o encerramento do último vínculo enquanto a empresa estiver ativa. |

### Motocicletas e estoque

| Código | Requisito |
| --- | --- |
| RF-MOT-001 | Cadastrar modelos de motocicleta. |
| RF-MOT-002 | Cadastrar unidades físicas e seus identificadores. |
| RF-MOT-003 | Impedir duplicidade de chassi, motor e placa. |
| RF-MOT-004 | Editar, colocar em revisão e retirar unidades de venda. |
| RF-MOT-005 | Alterar status conforme as transições permitidas. |
| RF-MOT-006 | Preservar o histórico das alterações de status. |
| RF-MOT-007 | Pesquisar unidades por marca, modelo, ano, preço anunciado e disponibilidade. |
| RF-MOT-008 | Exibir detalhes, fotos e preço anunciado de uma unidade. |
| RF-MOT-009 | Impedir a seleção de unidades reservadas, em revisão, fora de venda ou vendidas. |
| RF-MOT-010 | Exibir separadamente cada unidade física anunciada e sua situação pública, mesmo quando pertencem ao mesmo modelo. |
| RF-MOT-011 | Controlar os estados `EM_PREPARACAO`, `DISPONIVEL`, `RESERVADA`, `VENDIDA`, `EM_REVISAO` e `FORA_DE_VENDA`. |
| RF-MOT-012 | Exigir liberação explícita antes de uma unidade em revisão voltar a disponível. |

### Catálogo e anúncios

| Código | Requisito |
| --- | --- |
| RF-CAT-001 | Permitir que o vendedor prepare e edite anúncios em rascunho. |
| RF-CAT-002 | Permitir que gerente ou administrador publique anúncios e altere preços oficiais. |
| RF-CAT-003 | Manter uma unidade reservada visível como `RESERVADA`, sem permitir sua seleção. |
| RF-CAT-004 | Reativar a disponibilidade pública depois da liberação de uma reserva. |
| RF-CAT-005 | Arquivar o anúncio quando a unidade for vendida, preservando o histórico. |

### Propostas

| Código | Requisito |
| --- | --- |
| RF-PRO-001 | Permitir que o cliente envie uma solicitação de proposta para uma ou mais unidades específicas. |
| RF-PRO-002 | Permitir que o vendedor consulte solicitações de proposta. |
| RF-PRO-003 | Preparar propostas com valores, descontos, condições e validade. |
| RF-PRO-004 | Calcular valor bruto, desconto global e valor final. |
| RF-PRO-005 | Capturar os preços anunciados utilizados em cada versão da proposta. |
| RF-PRO-006 | Encaminhar descontos superiores a 10% para aprovação. |
| RF-PRO-007 | Permitir que o gerente aprove ou rejeite o desconto. |
| RF-PRO-008 | Permitir o envio da proposta ao cliente. |
| RF-PRO-009 | Permitir que o cliente aceite ou recuse a proposta. |
| RF-PRO-010 | Controlar a validade de sete dias. |
| RF-PRO-011 | Expirar automaticamente propostas vencidas. |
| RF-PRO-012 | Criar nova versão quando uma proposta enviada for alterada. |
| RF-PRO-013 | Preservar versões anteriores para histórico. |
| RF-PRO-014 | Exibir separadamente a situação da solicitação e da proposta. |
| RF-PRO-015 | Disparar automaticamente uma tentativa de reserva depois do aceite da proposta. |
| RF-PRO-016 | Avisar o cliente 24 horas antes do vencimento de uma proposta pendente. |

### Reservas

| Código | Requisito |
| --- | --- |
| RF-RES-001 | Criar a reserva automaticamente a partir de uma proposta aceita quando todas as unidades estiverem disponíveis. |
| RF-RES-002 | Verificar novamente a disponibilidade antes da confirmação. |
| RF-RES-003 | Impedir duas reservas ativas para a mesma unidade. |
| RF-RES-004 | Alterar unidades confirmadas para `RESERVADA`. |
| RF-RES-005 | Controlar o prazo inicial de 48 horas. |
| RF-RES-006 | Expirar automaticamente reservas vencidas. |
| RF-RES-007 | Permitir o cancelamento por cliente ou funcionário autorizado. |
| RF-RES-008 | Liberar unidades após cancelamento ou expiração. |
| RF-RES-009 | Permitir uma única prorrogação gerencial de 24 horas antes do vencimento e com justificativa. |
| RF-RES-010 | Exibir situação e prazo restante. |
| RF-RES-011 | Confirmar uma reserva de várias unidades integralmente ou recusar toda a tentativa. |
| RF-RES-012 | Exigir motivo no cancelamento realizado por funcionário. |
| RF-RES-013 | Avisar o cliente 24 horas antes do vencimento da reserva. |

### Vendas

| Código | Requisito |
| --- | --- |
| RF-VEN-001 | Registrar a confirmação de um pagamento externo. |
| RF-VEN-002 | Concluir venda a partir de proposta aceita e reserva ativa. |
| RF-VEN-003 | Preservar snapshot das condições comerciais. |
| RF-VEN-004 | Alterar as unidades vendidas para `VENDIDA`. |
| RF-VEN-005 | Vincular venda, cliente, proposta, reserva e responsável. |
| RF-VEN-006 | Exibir ao cliente o próprio histórico de compras. |
| RF-VEN-007 | Permitir que funcionários autorizados pesquisem vendas. |
| RF-VEN-008 | Registrar forma de pagamento, data, funcionário e referência externa opcional sem armazenar dados bancários ou cartão. |
| RF-VEN-009 | Impedir a conclusão da venda quando o endereço necessário estiver incompleto. |
| RF-VEN-010 | Permitir que somente o gerente cancele uma venda concluída, com justificativa. |
| RF-VEN-011 | Preservar a venda cancelada no histórico e colocar suas unidades em revisão. |
| RF-VEN-012 | Permitir liberar ou retirar de venda uma unidade depois da revisão. |

### Notificações

| Código | Requisito |
| --- | --- |
| RF-NOT-001 | Enviar por e-mail confirmação de conta e convite de funcionário. |
| RF-NOT-002 | Enviar por e-mail os acontecimentos comerciais definidos na `BKL-005`. |
| RF-NOT-003 | Registrar falhas de envio e permitir nova tentativa sem repetir a operação comercial. |

### Auditoria

| Código | Requisito |
| --- | --- |
| RF-AUD-001 | Registrar ações importantes realizadas por contas autenticadas. |
| RF-AUD-002 | Registrar ação, conta responsável, data e horário. |
| RF-AUD-003 | Restringir a consulta da auditoria a contas autorizadas. |
| RF-AUD-004 | Auditar as ações obrigatórias enumeradas no mapa de eventos da `BKL-005`. |
| RF-AUD-005 | Identificar processos automáticos por um ator de sistema. |

## Requisitos não funcionais

| Código | Requisito |
| --- | --- |
| RNF-SEG-001 | Senhas nunca podem ser armazenadas como texto legível. |
| RNF-SEG-002 | Permissões devem ser verificadas pelo servidor. |
| RNF-SEG-003 | Um cliente ou representante não pode acessar dados de clientes sem vínculo autorizado. |
| RNF-SEG-004 | Credenciais e segredos não podem ser incluídos no código ou no GitHub. |
| RNF-CON-001 | A criação da reserva deve ser segura contra solicitações simultâneas para a mesma unidade. |
| RNF-CON-002 | Repetir acidentalmente a conclusão de venda não pode criar vendas duplicadas. |
| RNF-CON-003 | A reserva de várias unidades deve ocorrer de forma atômica: todas ou nenhuma. |
| RNF-DES-001 | Consultas comuns devem responder em até dois segundos no cenário de teste local definido. |
| RNF-USA-001 | A interface deve funcionar em computador, tablet e celular. |
| RNF-USA-002 | Formulários devem apresentar mensagens claras próximas aos campos inválidos. |
| RNF-USA-003 | A interface deve oferecer navegação por teclado, foco visível e contraste adequado. |
| RNF-MAN-001 | As regras de domínio devem ficar separadas da interface e da persistência. |
| RNF-MAN-002 | As principais regras de negócio devem possuir testes automatizados. |
| RNF-MAN-003 | O código deve usar nomes claros e documentação atualizada. |
| RNF-DAD-001 | Alterações do banco devem usar migrações versionadas. |
| RNF-OPS-001 | A execução local deve possuir instruções documentadas. |
| RNF-OPS-002 | Aplicação e dependências devem poder iniciar com Docker Compose. |
| RNF-REL-001 | Falhas no envio de e-mail não podem reverter a operação de negócio que originou a mensagem. |
| RNF-REL-002 | Eventos obrigatórios de integração e auditoria devem possuir estratégia de entrega confiável definida antes da implementação. |

## Priorização MoSCoW

### Must have

- Login e controle de permissões.
- Cadastro PF e PJ.
- Confirmação de e-mail e convite de funcionários.
- Catálogo e estoque.
- Solicitações, propostas e versionamento.
- Desconto global e aprovação por alçada.
- Reservas com expiração.
- Reserva integral de múltiplas unidades e prorrogação única de 24 horas.
- Registro de pagamento externo.
- Conclusão da venda.
- Cancelamento gerencial de venda com revisão das unidades.
- Notificações essenciais por e-mail.
- Histórico e auditoria básica.
- PostgreSQL e migrações.
- Testes das regras principais.
- Execução local documentada.

### Should have

- Recuperação de senha.
- Fotos das unidades.
- Filtros avançados.
- Proposta em PDF.
- Resumo de vendas para gerente.

### Could have

- Exportação CSV.
- Integração simulada com FIPE.
- Favoritos.
- Comparação entre modelos de motocicleta.
- Relatórios e gráficos básicos.

### Won't have now

- Pagamento online.
- Multi-tenancy.
- Emissão fiscal real.
- Financiamento bancário real.
- Oficina e ordens de serviço.
- Trade-in.
- Seguros e garantias.
- OBD-II e telemetria.
- Aplicativo móvel nativo.
