# Escopo e atores

## Escopo do MVP

O MVP cobre o fluxo comercial principal de uma concessionária de motocicletas.

### Área do cliente

- Consultar unidades disponíveis e seus preços anunciados sem autenticação.
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
- Registrar confirmações de pagamentos externos.
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

### Visitante

Pessoa que consulta o catálogo público sem utilizar uma conta de acesso.

### Cliente PF

Pessoa física interessada em adquirir uma ou mais motocicletas.

### Representante de empresa

Pessoa responsável por negociar em nome de uma empresa ou frota.

### Responsável pelo estoque

Funcionário que cadastra modelos e unidades, registra a preparação e controla a disponibilidade das unidades.

### Vendedor

Funcionário que consulta clientes, prepara propostas, acompanha reservas, registra a confirmação de pagamento externo e conclui vendas.

### Gerente

Funcionário que acompanha a operação, aprova descontos especiais e autoriza exceções permitidas pelas políticas comerciais.

### Administrador

Funcionário responsável por contas, papéis de acesso e permissões dos demais funcionários.

## Matriz inicial de responsabilidades

| Ação | Visitante | Cliente | Estoque | Vendedor | Gerente | Administrador |
| --- | :---: | :---: | :---: | :---: | :---: | :---: |
| Consultar catálogo | Sim | Sim | Sim | Sim | Sim | Sim |
| Alterar o próprio cadastro | Não | Sim | Sim | Sim | Sim | Sim |
| Gerenciar modelos e unidades | Não | Não | Sim | Consulta | Consulta | Não |
| Solicitar proposta | Não | Sim | Não | Não | Não | Não |
| Preparar proposta | Não | Não | Não | Sim | Sim | Não |
| Aprovar desconto acima de 10% | Não | Não | Não | Não | Sim | Não |
| Solicitar reserva | Não | Sim | Não | Não | Não | Não |
| Concluir venda | Não | Não | Não | Sim | Sim | Não |
| Gerenciar funcionários | Não | Não | Não | Não | Não | Sim |

Na matriz, **Cliente** representa o cliente PF ou o representante que age por um cliente PJ. Esta matriz é inicial e será revisada durante o DDD e a modelagem de autorização.
