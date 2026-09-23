# Subdomínios do Maikeise MotoHub

Este documento registra a identificação inicial dos subdomínios do Maikeise MotoHub, consolidada na `BKL-002`. A classificação representa o conhecimento atual e poderá ser refinada quando novos comportamentos do negócio forem descobertos.

> [!TIP]
> Leitura rápida: consulte a visão geral abaixo. As responsabilidades e justificativas detalhadas estão recolhidas para quem quiser acompanhar o raciocínio completo.

## Objetivo

Dividir o domínio da concessionária em capacidades de negócio coerentes, deixando claro:

- qual problema cada parte resolve;
- quais responsabilidades pertencem a cada parte;
- onde está o diferencial estratégico do produto;
- quais capacidades apenas apoiam esse diferencial;
- quais problemas são comuns a muitos tipos de sistema.

## Conceitos utilizados

| Classificação | Significado |
| --- | --- |
| **Core** | Capacidade estratégica que concentra diferenciação, complexidade e regras centrais do produto. |
| **Supporting** | Capacidade necessária e adaptada ao negócio, mas que não constitui seu principal diferencial. |
| **Generic** | Problema comum a muitos sistemas, atendido por padrões, bibliotecas ou soluções amplamente conhecidas. |

Uma capacidade ser obrigatória no MVP não significa que ela seja Core. **Prioridade de entrega** e **classificação estratégica** respondem a perguntas diferentes.

## Coração do domínio

> Transformar unidades disponíveis em vendas controladas, por meio de solicitações, propostas comerciais, descontos, aceite, reserva e conclusão da venda.

No conhecimento atual, esse diferencial é representado por dois subdomínios Core: **Negociação e Vendas** e **Disponibilidade e Reservas**.

## Visão geral

| Subdomínio | Classificação | Principal contribuição |
| --- | --- | --- |
| Negociação e Vendas | Core | Conduzir a negociação desde a solicitação até a venda concluída. |
| Disponibilidade e Reservas | Core | Garantir exclusividade temporária e impedir conflitos sobre unidades. |
| Catálogo e Estoque | Supporting | Manter modelos, unidades físicas e informações comerciais disponíveis. |
| Gestão de Clientes | Supporting | Manter clientes PF, clientes PJ e seus representantes. |
| Rastreabilidade e Auditoria | Supporting | Preservar responsáveis, datas, decisões e justificativas relevantes. |
| Identidade e Acesso | Generic | Autenticar contas e aplicar papéis e permissões. |

<details>
<summary><strong>Aprofundar responsabilidades e justificativas por subdomínio</strong></summary>

## Subdomínios Core

### Negociação e Vendas

#### Propósito

Conduzir a relação comercial com o cliente, preservando condições, decisões e histórico até a conclusão da venda.

#### Responsabilidades

- Receber solicitações de proposta.
- Preparar propostas para unidades específicas.
- Calcular valor bruto, desconto global e valor final.
- Controlar a alçada de desconto do vendedor.
- Solicitar e registrar análise gerencial de descontos.
- Versionar propostas e preservar versões anteriores.
- Controlar a validade de sete dias.
- Registrar aceite ou recusa do cliente.
- Registrar a confirmação de pagamento externo.
- Concluir a venda e preservar o snapshot comercial.
- Cancelar a venda por ação compensatória sem apagar o histórico.

#### Justificativa da classificação

Esse subdomínio concentra regras comerciais próprias do MotoHub, como versionamento, validade, alçada de 10%, aprovação gerencial e preservação das condições aceitas. Ele transforma interesse em resultado comercial e representa uma parte central da proposta de valor.

### Disponibilidade e Reservas

#### Propósito

Controlar o direito temporário de um cliente concluir a aquisição de unidades específicas sem permitir reservas conflitantes.

#### Responsabilidades

- Verificar novamente a disponibilidade depois do aceite da proposta.
- Criar uma reserva somente para unidades disponíveis.
- Impedir duas reservas ativas para a mesma unidade.
- Bloquear todas as unidades confirmadas para o cliente correto.
- Controlar o prazo inicial de 48 horas e uma única prorrogação gerencial de 24 horas.
- Expirar, cancelar e prorrogar reservas.
- Liberar unidades quando a reserva terminar sem venda.
- Permitir que unidades reservadas sejam utilizadas na conclusão da venda.

#### Justificativa da classificação

Esse subdomínio protege uma das principais invariantes do negócio: uma unidade não pode ser prometida simultaneamente a clientes diferentes. Ele combina regras de tempo, exclusividade, concorrência e transição comercial, sendo estratégico para a confiabilidade do produto.

## Subdomínios Supporting

### Catálogo e Estoque

#### Propósito

Manter as informações dos produtos e das unidades físicas comercializadas pela concessionária.

#### Responsabilidades

- Cadastrar modelos de motocicleta.
- Cadastrar unidades identificadas por chassi.
- Controlar motor e placa quando informados.
- Registrar preparação, disponibilidade, reserva, venda, revisão e retirada de venda.
- Manter o preço anunciado.
- Exibir separadamente cada unidade anunciada e sua situação pública.
- Preservar o histórico de unidades que participaram de negociações.

#### Justificativa da classificação

É uma capacidade indispensável e possui adaptações para o domínio de motocicletas, porém cadastros de produtos, estoque e catálogo são problemas conhecidos em sistemas comerciais. Ela sustenta os fluxos Core sem representar sozinha o principal diferencial do MotoHub.

### Gestão de Clientes

#### Propósito

Representar corretamente quem negocia com a concessionária e quem pode agir em nome de cada cliente.

#### Responsabilidades

- Cadastrar clientes pessoa física.
- Cadastrar clientes pessoa jurídica.
- Validar CPF e CNPJ.
- Manter representantes vinculados a clientes PJ.
- Controlar ativação e inativação.
- Preservar vínculos históricos com propostas, reservas e vendas.

#### Justificativa da classificação

As regras de PF, PJ e representação são necessárias e adaptadas ao cenário brasileiro, mas funcionam como suporte à comercialização. O valor principal do MotoHub não está apenas no cadastro de clientes.

### Rastreabilidade e Auditoria

#### Propósito

Permitir que ações e decisões comerciais importantes possam ser explicadas posteriormente.

#### Responsabilidades

- Registrar responsáveis por alterações de situação.
- Registrar solicitações e decisões de aprovação de desconto.
- Registrar confirmações de pagamento externo.
- Registrar conclusões de venda.
- Preservar data, horário, resultado e justificativa quando aplicável.
- Restringir a consulta de registros sensíveis.

#### Justificativa da classificação

Ferramentas de log são genéricas, mas definir quais decisões do negócio precisam ser rastreadas e quais informações devem ser preservadas exige conhecimento específico do MotoHub. Por isso, a capacidade de negócio é Supporting; a infraestrutura técnica utilizada poderá ser genérica.

## Subdomínio Generic

### Identidade e Acesso

#### Propósito

Identificar quem está acessando o sistema e limitar cada ação às permissões concedidas.

#### Responsabilidades

- Manter contas de acesso individuais.
- Confirmar o e-mail das contas de clientes.
- Convidar funcionários para criação de contas internas.
- Autenticar credenciais.
- Encerrar sessões com segurança.
- Ativar e desativar contas.
- Atribuir papéis de acesso.
- Verificar permissões no servidor.
- Impedir elevação indevida de privilégios.

#### Justificativa da classificação

Autenticação e autorização são problemas críticos, mas comuns a diversos sistemas. O MotoHub poderá usar padrões e recursos consolidados, como Spring Security, sem transformar segurança em seu diferencial comercial.

</details>

## Capacidades que não formam subdomínios no MVP

### Pagamentos

O MotoHub registra a confirmação de um pagamento realizado externamente, mas não processa a transação. Essa confirmação permanece em **Negociação e Vendas**. Pagamento online poderá originar uma integração ou nova capacidade no futuro.

### Gestão de Frotas

Clientes PJ podem comprar várias unidades, mas o MVP não controla motoristas, manutenção, quilometragem, abastecimento ou alocação de veículos. Gestão de Frotas é uma possibilidade futura, não um subdomínio atual.

### Elementos técnicos

API REST, banco de dados, interface web, Docker e mensageria são escolhas ou componentes técnicos. Eles não representam, por si próprios, subdomínios do negócio.

## Subdomínio, Bounded Context e microsserviço

| Conceito | Pergunta respondida |
| --- | --- |
| Subdomínio | Qual parte do problema de negócio estamos tentando entender? |
| Bounded Context | Dentro de qual limite um modelo e sua linguagem são consistentes? |
| Microsserviço | Como uma parte da solução será implantada e operada? |

Não existe obrigação de mapear cada subdomínio diretamente para um Bounded Context ou microsserviço. Os limites definidos posteriormente estão documentados em [Bounded Contexts do Maikeise MotoHub](02-bounded-contexts.md), sem antecipar uma arquitetura distribuída.

## Continuidade da modelagem

A `BKL-003` definiu os Bounded Contexts, a `BKL-004` registrou suas relações, a `BKL-005` mapeou os eventos e a `BKL-006` consolidou o modelo tático inicial. A `BKL-007` formalizou a [arquitetura inicial](../architecture/00-overview.md); a continuidade está na fundação técnica do projeto.

[Voltar ao resumo do DDD](00-overview.md).
