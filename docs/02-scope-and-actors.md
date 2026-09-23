# Escopo e atores

## Escopo do MVP

O MVP cobre o fluxo comercial principal de uma concessionária de motocicletas.

### Área do comprador

- Consultar motocicletas disponíveis sem autenticação.
- Criar uma conta como pessoa física ou jurídica.
- Editar o próprio cadastro.
- Solicitar e acompanhar propostas.
- Aceitar ou recusar propostas.
- Solicitar e cancelar reservas.
- Acompanhar o prazo de uma reserva.
- Consultar o histórico de compras.

### Área interna

- Gerenciar modelos e unidades de motocicletas.
- Controlar a disponibilidade do estoque.
- Consultar clientes.
- Analisar solicitações e preparar propostas.
- Controlar versões e validade das propostas.
- Aprovar descontos acima da alçada do vendedor.
- Gerenciar reservas.
- Registrar pagamentos externos.
- Concluir e consultar vendas.
- Gerenciar contas de funcionários.
- Consultar registros básicos de auditoria.

## Fora do escopo do MVP

- Pagamento online.
- Multi-tenancy.
- Emissão fiscal real.
- Financiamento bancário real.
- Oficina e ordens de serviço.
- Trade-in de motocicletas usadas.
- Seguros e garantias.
- Telemetria e OBD-II.
- Aplicativo móvel nativo.

## Atores

### Comprador PF

Pessoa física interessada em adquirir uma ou mais motocicletas.

### Representante de empresa

Pessoa responsável por negociar em nome de uma empresa ou frota.

### Responsável pelo estoque

Funcionário que cadastra modelos e unidades, registra a preparação e controla a disponibilidade das motocicletas.

### Vendedor

Funcionário que consulta clientes, prepara propostas, acompanha reservas, registra a confirmação de pagamento externo e conclui vendas.

### Gerente

Funcionário que acompanha a operação, aprova descontos especiais e autoriza exceções permitidas pelas políticas comerciais.

### Administrador

Funcionário responsável por contas, perfis e permissões dos demais funcionários.

## Matriz inicial de responsabilidades

| Ação | Comprador | Estoque | Vendedor | Gerente | Administrador |
| --- | :---: | :---: | :---: | :---: | :---: |
| Consultar catálogo | Sim | Sim | Sim | Sim | Sim |
| Alterar o próprio cadastro | Sim | Sim | Sim | Sim | Sim |
| Gerenciar motocicletas | Não | Sim | Consulta | Consulta | Não |
| Solicitar proposta | Sim | Não | Não | Não | Não |
| Preparar proposta | Não | Não | Sim | Sim | Não |
| Aprovar desconto acima de 10% | Não | Não | Não | Sim | Não |
| Solicitar reserva | Sim | Não | Sim | Sim | Não |
| Confirmar venda | Não | Não | Sim | Sim | Não |
| Gerenciar funcionários | Não | Não | Não | Não | Sim |

Esta matriz é inicial e será revisada durante o DDD e a modelagem de autorização.
