# Requisitos

## Convenções

- `RF`: requisito funcional, descreve o que o sistema faz.
- `RNF`: requisito não funcional, descreve qualidades ou restrições.

## Requisitos funcionais

### Autenticação e acesso

| Código | Requisito |
| --- | --- |
| RF-AUT-001 | Permitir o cadastro de compradores. |
| RF-AUT-002 | Permitir que o comprador escolha entre cadastro PF e PJ. |
| RF-AUT-003 | Permitir entrada e saída por conta autenticada. |
| RF-AUT-004 | Permitir que o administrador cadastre, ative e desative funcionários. |
| RF-AUT-005 | Permitir que o administrador atribua perfis de acesso. |
| RF-AUT-006 | Restringir funcionalidades conforme as permissões do usuário. |

### Clientes

| Código | Requisito |
| --- | --- |
| RF-CLI-001 | Cadastrar clientes pessoa física. |
| RF-CLI-002 | Cadastrar clientes pessoa jurídica e seu representante. |
| RF-CLI-003 | Validar formato e dígitos de CPF e CNPJ. |
| RF-CLI-004 | Permitir que o comprador consulte e edite os próprios dados. |
| RF-CLI-005 | Permitir que funcionários autorizados pesquisem clientes. |
| RF-CLI-006 | Inativar clientes sem apagar o histórico. |

### Motocicletas e estoque

| Código | Requisito |
| --- | --- |
| RF-MOT-001 | Cadastrar modelos de motocicleta. |
| RF-MOT-002 | Cadastrar unidades físicas e seus identificadores. |
| RF-MOT-003 | Impedir duplicidade de chassi, motor e placa. |
| RF-MOT-004 | Editar e inativar unidades. |
| RF-MOT-005 | Alterar status conforme as transições permitidas. |
| RF-MOT-006 | Preservar o histórico das alterações de status. |
| RF-MOT-007 | Pesquisar motocicletas por marca, modelo, ano, preço e disponibilidade. |
| RF-MOT-008 | Exibir detalhes e fotos de uma motocicleta. |
| RF-MOT-009 | Ocultar unidades inativas e vendidas no catálogo público. |

### Propostas

| Código | Requisito |
| --- | --- |
| RF-PRO-001 | Permitir a solicitação de proposta para uma ou mais unidades. |
| RF-PRO-002 | Permitir que o vendedor consulte solicitações. |
| RF-PRO-003 | Preparar propostas com valores, descontos, condições e validade. |
| RF-PRO-004 | Calcular subtotal, desconto e total. |
| RF-PRO-005 | Encaminhar descontos superiores a 10% para aprovação. |
| RF-PRO-006 | Permitir que o gerente aprove ou rejeite o desconto. |
| RF-PRO-007 | Permitir o envio da proposta ao comprador. |
| RF-PRO-008 | Permitir que o comprador aceite ou recuse a proposta. |
| RF-PRO-009 | Controlar a validade de sete dias. |
| RF-PRO-010 | Expirar automaticamente propostas vencidas. |
| RF-PRO-011 | Criar nova versão quando uma proposta enviada for alterada. |
| RF-PRO-012 | Preservar versões anteriores para histórico. |
| RF-PRO-013 | Exibir a situação atual da proposta. |

### Reservas

| Código | Requisito |
| --- | --- |
| RF-RES-001 | Permitir reserva a partir de uma proposta aceita. |
| RF-RES-002 | Verificar novamente a disponibilidade antes da confirmação. |
| RF-RES-003 | Impedir duas reservas ativas para a mesma unidade. |
| RF-RES-004 | Alterar unidades confirmadas para `RESERVADA`. |
| RF-RES-005 | Controlar o prazo de 72 horas. |
| RF-RES-006 | Expirar automaticamente reservas vencidas. |
| RF-RES-007 | Permitir o cancelamento por usuário autorizado. |
| RF-RES-008 | Liberar unidades após cancelamento ou expiração. |
| RF-RES-009 | Permitir prorrogação gerencial com justificativa. |
| RF-RES-010 | Exibir situação e prazo restante. |

### Vendas

| Código | Requisito |
| --- | --- |
| RF-VEN-001 | Registrar a confirmação de um pagamento externo. |
| RF-VEN-002 | Concluir venda a partir de proposta aceita e reserva ativa. |
| RF-VEN-003 | Preservar snapshot das condições comerciais. |
| RF-VEN-004 | Alterar as unidades vendidas para `VENDIDA`. |
| RF-VEN-005 | Vincular venda, cliente, proposta, reserva e responsável. |
| RF-VEN-006 | Exibir ao comprador o próprio histórico de compras. |
| RF-VEN-007 | Permitir que funcionários autorizados pesquisem vendas. |

### Auditoria

| Código | Requisito |
| --- | --- |
| RF-AUD-001 | Registrar ações importantes realizadas pelos usuários. |
| RF-AUD-002 | Registrar ação, usuário, data e horário. |
| RF-AUD-003 | Restringir a consulta da auditoria a usuários autorizados. |

## Requisitos não funcionais

| Código | Requisito |
| --- | --- |
| RNF-SEG-001 | Senhas nunca podem ser armazenadas como texto legível. |
| RNF-SEG-002 | Permissões devem ser verificadas pelo servidor. |
| RNF-SEG-003 | Um comprador não pode acessar dados de outro comprador. |
| RNF-SEG-004 | Credenciais e segredos não podem ser incluídos no código ou no GitHub. |
| RNF-CON-001 | A reserva deve ser atômica e segura contra solicitações simultâneas. |
| RNF-CON-002 | Repetir acidentalmente a confirmação de venda não pode criar vendas duplicadas. |
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

## Priorização MoSCoW

### Must have

- Login e controle de permissões.
- Cadastro PF e PJ.
- Catálogo e estoque.
- Propostas e versionamento.
- Aprovação de descontos.
- Reservas com expiração.
- Registro de pagamento externo.
- Conclusão da venda.
- Histórico e auditoria básica.
- PostgreSQL e migrações.
- Testes das regras principais.
- Execução local documentada.

### Should have

- Recuperação de senha.
- Fotos das motocicletas.
- Filtros avançados.
- Prorrogação de reservas.
- Proposta em PDF.
- Notificações por e-mail.
- Resumo de vendas para gerente.

### Could have

- Exportação CSV.
- Integração simulada com FIPE.
- Favoritos.
- Comparação entre motocicletas.
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
