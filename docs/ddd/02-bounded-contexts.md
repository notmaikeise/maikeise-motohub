# Bounded Contexts do Maikeise MotoHub

Este documento registra os limites iniciais de modelo e linguagem do Maikeise MotoHub, consolidados na `BKL-003`. As relações formais entre os contextos estão documentadas no Context Map da `BKL-004`.

> [!TIP]
> A tabela de visão geral apresenta a divisão em poucos minutos. Abra o detalhamento somente quando precisar conferir propriedade de dados, responsabilidades ou exclusões de um contexto.

## Objetivo

Definir limites claros para que cada parte do sistema possua:

- responsabilidade principal explícita;
- modelo próprio;
- termos com significado consistente;
- propriedade bem definida sobre os dados;
- dependências controladas com as demais partes.

## Subdomínio e Bounded Context

| Conceito | Espaço | Pergunta respondida |
| --- | --- | --- |
| Subdomínio | Problema | Qual capacidade do negócio precisa ser compreendida? |
| Bounded Context | Solução | Dentro de qual limite um modelo e sua linguagem são consistentes? |
| Microsserviço | Implantação | Como uma capacidade será executada, escalada e operada? |

Não existe obrigação de mapear cada subdomínio diretamente para um Bounded Context ou microsserviço.

## Decisão arquitetural

A `BKL-007` formalizou a seguinte decisão na [ADR-001](../architecture/decisions/ADR-001-monolito-modular-arquitetura-hexagonal.md):

> Uma aplicação Spring Boot em monólito modular, com um módulo por Bounded Context e Arquitetura Hexagonal dentro de cada módulo.

Os contextos descritos aqui são limites de modelo. Eles não representam seis aplicações independentes.

### Estrutura inicial de módulos

```text
com.maikeise.motohub
├── identity
├── customer
├── catalog
├── inventory
├── commercial
└── audit
```

### Estrutura interna de cada módulo

```text
<contexto>
├── api
└── internal
    ├── domain
    ├── application
    │   ├── port
    │   │   ├── in
    │   │   └── out
    │   └── usecase
    └── adapter
        ├── in
        └── out
```

Somente `api` forma o contrato publicado para outros módulos. O código em `internal` pertence ao contexto, e seus limites serão verificados com Spring Modulith e testes arquiteturais. A estrutura completa está na [visão da arquitetura](../architecture/00-overview.md).

## Regras gerais dos limites

1. Somente o contexto proprietário cria e altera diretamente seus dados.
2. Um contexto não importa entidades, agregados ou repositórios internos de outro contexto.
3. Um contexto não cria associações JPA diretas com entidades de outro contexto.
4. A comunicação utiliza portas, contratos explícitos, identificadores e eventos.
5. Informações históricas relevantes são preservadas como snapshots no contexto consumidor.
6. Cada contexto controla suas tabelas, mesmo que todos utilizem inicialmente a mesma instância PostgreSQL.
7. Compartilhamento de banco físico não autoriza consultas diretas às tabelas de outro módulo.
8. Regras que precisam de consistência forte devem permanecer dentro do mesmo limite sempre que possível.

## Visão geral dos contextos

| Bounded Context | Módulo | Responsabilidade principal |
| --- | --- | --- |
| Identity and Access | `identity` | Contas, autenticação, papéis e permissões. |
| Customer Management | `customer` | Clientes PF, clientes PJ e representantes. |
| Catalog | `catalog` | Apresentação pública de modelos e unidades anunciadas. |
| Inventory and Reservation | `inventory` | Unidades físicas, disponibilidade e exclusividade das reservas. |
| Commercial | `commercial` | Solicitações, propostas, descontos, aceite, pagamento externo e vendas. |
| Audit | `audit` | Rastreabilidade estruturada de ações e decisões relevantes. |

## Relação inicial com os subdomínios

| Subdomínio | Bounded Context relacionado |
| --- | --- |
| Negociação e Vendas | Commercial |
| Disponibilidade e Reservas | Inventory and Reservation |
| Catálogo e Estoque | Catalog; Inventory and Reservation |
| Gestão de Clientes | Customer Management |
| Rastreabilidade e Auditoria | Audit |
| Identidade e Acesso | Identity and Access |

O subdomínio Supporting **Catálogo e Estoque** participa de dois contextos porque o modelo de apresentação pública é diferente do modelo operacional da unidade física. O contexto **Inventory and Reservation** também contém capacidades provenientes de dois subdomínios, pois a unidade e sua reserva precisam compartilhar uma invariante forte.

<details>
<summary><strong>Aprofundar os seis Bounded Contexts</strong></summary>

## Identity and Access

### Propósito

Identificar quem acessa o sistema e determinar quais ações sua conta está autorizada a executar.

### Modelo controlado

- Conta de acesso.
- E-mail de login único.
- Senha protegida.
- Situação da conta.
- Papel de acesso.
- Permissão.
- Sessão ou token, conforme a estratégia futura.
- Metadados mínimos das contas internas necessários à administração de acesso.

### Responsabilidades

- Autenticar credenciais.
- Encerrar sessões com segurança.
- Ativar, bloquear e desativar contas.
- Confirmar o e-mail das contas de clientes.
- Convidar funcionários para criar as próprias credenciais.
- Atribuir papéis e permissões.
- Impedir elevação indevida de privilégios.
- Identificar a conta responsável por uma ação.

### Fora do limite

- CPF, CNPJ, endereço e cadastro comercial.
- Relação entre representante e cliente PJ.
- Dados de RH ou gestão completa de funcionários.
- Propostas, reservas e vendas.

### Regra de integração

Outros contextos utilizam `accountId` para identificar a conta responsável. Eles não recebem senha, token ou modelo interno de permissões.

## Customer Management

### Propósito

Representar quem negocia com a concessionária e quem pode agir em nome de um cliente pessoa jurídica.

### Modelo controlado

- Cliente pessoa física.
- Cliente pessoa jurídica.
- CPF e CNPJ.
- Nome e razão social.
- Dados de contato.
- Situação comercial do cliente.
- Representante.
- Vínculo entre representante e cliente PJ.

### Responsabilidades

- Cadastrar e validar clientes PF e PJ.
- Manter dados comerciais e de contato.
- Ativar e inativar clientes sem apagar o histórico.
- Bloquear comercialmente clientes e solicitar análise das operações abertas.
- Manter representantes e seus vínculos.
- Informar se um cliente está apto a iniciar uma negociação.

### Fora do limite

- Senha, sessão, token, papel e permissão.
- Proposta, reserva e venda.
- Unidade de estoque e preço anunciado.

### Regra de integração

O contexto pode associar um cliente PF ou representante a um `accountId`, mas não controla a conta. O e-mail de contato pertence ao cadastro comercial e pode ser diferente do e-mail de login.

## Catalog

### Propósito

Apresentar ao visitante e ao cliente as informações comerciais necessárias para descobrir e selecionar uma unidade específica.

### Modelo controlado

- Modelo de motocicleta para apresentação.
- Marca, modelo, versão e especificações públicas.
- Anúncio de uma unidade.
- Descrição comercial.
- Fotos.
- Preço anunciado.
- Filtros e atributos de pesquisa.
- Representação pública da disponibilidade.

### Responsabilidades

- Publicar e retirar anúncios.
- Exibir separadamente unidades físicas distintas.
- Manter preço e conteúdo comercial do anúncio.
- Permitir busca e filtros.
- Exibir somente informações seguras para consulta pública.
- Atualizar sua representação quando a disponibilidade operacional mudar.

### Fora do limite

- Chassi completo, motor e placa como dados operacionais editáveis.
- Preparação física da unidade.
- Reserva ativa e seu prazo.
- Proposta e desconto negociado.
- Decisão definitiva sobre disponibilidade.

### Regra de integração

O catálogo utiliza `unitId` e uma representação publicada pelo contexto `inventory`. Ele não altera diretamente a unidade nem determina se uma reserva pode ser criada.

## Inventory and Reservation

### Propósito

Controlar as unidades físicas e garantir que uma unidade somente possa estar vinculada a uma reserva ativa por vez.

### Modelo controlado

- Unidade de estoque.
- Chassi, número do motor e placa.
- Modelo de referência por `modelId`.
- Ano, cor e demais características físicas próprias da unidade.
- Situação operacional da unidade.
- Preparação.
- Reserva.
- Prazo, expiração, cancelamento e prorrogação.

### Responsabilidades

- Cadastrar e preparar unidades.
- Controlar as transições operacionais.
- Colocar unidades em revisão e retirá-las de venda.
- Informar disponibilidade.
- Criar uma reserva para unidades específicas.
- Impedir reservas ativas simultâneas para a mesma unidade.
- Controlar as 48 horas iniciais da reserva e uma única prorrogação gerencial de 24 horas.
- Liberar unidades após cancelamento ou expiração.
- Confirmar o uso da reserva e marcar unidades como vendidas.

### Invariante principal

> Uma unidade de estoque não pode participar de duas reservas ativas simultaneamente.

Essa regra precisa permanecer verdadeira mesmo quando solicitações concorrentes ocorrerem. Unidade e reserva permanecem no mesmo contexto para que a exclusividade possa ser garantida dentro de um único limite de consistência.

### Fora do limite

- Conteúdo de marketing e fotos.
- Preço negociado e desconto.
- Cadastro completo do cliente.
- Confirmação do pagamento externo.
- Registro definitivo da venda.

### Regra de integração

O contexto recebe identificadores como `customerId`, `proposalId` e `accountId`, sem importar os modelos internos dos contextos correspondentes.

## Commercial

### Propósito

Conduzir a negociação com o cliente e preservar as condições utilizadas para concluir a venda.

### Modelo controlado

- Solicitação de proposta.
- Proposta.
- Versão de proposta.
- Valor bruto, desconto comercial e valor final.
- Análise de desconto.
- Aceite e recusa.
- Confirmação de pagamento externo.
- Venda.
- Snapshot comercial.

### Responsabilidades

- Receber solicitações para unidades específicas.
- Preparar, calcular e versionar propostas.
- Controlar validade de sete dias.
- Aplicar a alçada de desconto.
- Registrar decisões gerenciais.
- Registrar aceite ou recusa do cliente.
- Disparar a tentativa de reserva das unidades depois do aceite.
- Registrar confirmação de pagamento externo.
- Solicitar a confirmação do uso de uma reserva.
- Concluir a venda e preservar seu snapshot.
- Cancelar a venda como ação compensatória e solicitar a revisão das unidades.

### Fora do limite

- Cadastro editável do cliente.
- Credenciais e permissões.
- Preço atual do catálogo depois da criação da versão.
- Estado operacional interno da unidade.
- Reserva ativa como modelo controlado.
- Registro técnico de auditoria.

### Referências e snapshots

O contexto referencia dados externos por identificadores:

```text
customerId
unitId
reservationId
accountId
```

Quando o histórico precisa permanecer estável, o contexto preserva um snapshot. Uma versão da proposta mantém, por exemplo, a descrição apresentada, o preço utilizado, o desconto e as condições daquele momento.

## Audit

### Propósito

Preservar evidências estruturadas de ações e decisões relevantes para o negócio e a segurança.

### Modelo controlado

- Registro de auditoria.
- Contexto de origem.
- Tipo da ação.
- Identificador do objeto afetado.
- Conta responsável.
- Data e horário.
- Resultado.
- Justificativa ou metadados seguros quando aplicáveis.

### Responsabilidades

- Registrar ações selecionadas dos demais contextos.
- Impedir alteração comum de registros já armazenados.
- Restringir consultas conforme autorização.
- Permitir rastrear responsáveis e resultados.

### Fora do limite

- Regras que autorizam a operação original.
- Estado oficial da proposta, reserva, cliente ou venda.
- Logs técnicos de desempenho e diagnóstico.
- Credenciais ou dados sensíveis desnecessários.

### Regra de integração

O histórico essencial continua no contexto que executou a ação. A auditoria recebe uma representação adicional do acontecimento e não se torna a única fonte da verdade comercial.

</details>

## Matriz de propriedade dos conceitos

| Conceito | Contexto proprietário |
| --- | --- |
| Conta, papel e permissão | Identity and Access |
| Cliente PF, cliente PJ e representante | Customer Management |
| Modelo apresentado, anúncio, foto e preço anunciado | Catalog |
| Unidade física, situação operacional e reserva | Inventory and Reservation |
| Solicitação, proposta, desconto, pagamento confirmado e venda | Commercial |
| Registro estruturado de auditoria | Audit |

## Encaminhamentos arquiteturais

- A conclusão da venda combina uma decisão síncrona de `inventory` com evento persistido, idempotência e repetição segura.
- As ações de auditoria obrigatória estão enumeradas no mapa de eventos.
- Cada contexto controla seu próprio schema dentro de uma instância PostgreSQL.
- Spring Modulith e testes arquiteturais verificam acesso somente por APIs públicas e ausência de ciclos.

As relações, direções e formas iniciais de integração estão no [Context Map](03-context-map.md), e os mecanismos técnicos estão na [arquitetura inicial](../architecture/00-overview.md).

## Próximo passo

Os eventos e a linha do tempo foram consolidados na [BKL-005](04-domain-events.md), as raízes, entidades internas e invariantes foram definidas na [BKL-006](05-aggregates-and-invariants.md), e a `BKL-007` formalizou a arquitetura que preserva esses limites. O projeto foi pausado neste marco; a `BKL-010` permanece como referência para uma possível retomada.

[Voltar ao resumo do DDD](00-overview.md).
