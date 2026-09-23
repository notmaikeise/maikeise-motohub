# Visão do produto

## Identidade

- **Nome:** Maikeise MotoHub
- **Repositório:** `maikeise-motohub`
- **Tipo de produto:** plataforma web de gestão e comercialização de motocicletas
- **Fase atual:** planejamento e modelagem

## Contexto do estudo

Esta visão pertence à evolução individual Maikeise MotoHub. O domínio foi inspirado por um trabalho acadêmico coletivo de modelagem de software, mas este repositório não representa a entrega oficial do grupo. A relação entre os projetos está detalhada em [Origem e propósito](00-project-context.md).

## Problema

Concessionárias que atendem compradores pessoa física, empresas e frotistas podem manter informações de veículos, clientes e negociações em planilhas ou sistemas separados. Isso dificulta a consulta do estoque, aumenta o risco de reservas conflitantes e prejudica a rastreabilidade das vendas.

## Visão

O Maikeise MotoHub é uma plataforma digital para gestão e comercialização de motocicletas, destinada inicialmente a uma concessionária que atende compradores pessoa física e jurídica.

O sistema centraliza estoque, clientes, propostas, reservas e vendas. Compradores acompanham suas negociações e funcionários controlam a operação comercial com organização e rastreabilidade.

## Proposta de valor

### Para compradores

- Consultar motocicletas disponíveis.
- Manter o próprio cadastro.
- Solicitar e acompanhar propostas.
- Reservar motocicletas a partir de propostas aceitas.
- Consultar o histórico de compras.

### Para a concessionária

- Centralizar estoque, clientes e negociações.
- Evitar reservas simultâneas para a mesma unidade.
- Controlar descontos e aprovações.
- Preservar o histórico das propostas e vendas.
- Identificar os responsáveis por ações importantes.

## Modelo de negócio

O MVP será **single-tenant**, atendendo uma única concessionária com vários compradores e funcionários.

Como evolução, o produto poderá se tornar **multi-tenant** e atender diferentes concessionárias, mantendo os dados de cada organização isolados.

## Objetivo geral

Digitalizar e centralizar o fluxo comercial de motocicletas, desde a consulta do estoque até a conclusão da venda.

## Objetivos específicos

- Facilitar a descoberta de motocicletas disponíveis.
- Padronizar o cadastro de clientes PF e PJ.
- Formalizar propostas e preservar suas versões.
- Controlar reservas por tempo limitado.
- Aplicar alçadas de desconto.
- Registrar vendas e seu histórico comercial.

## Indicadores futuros

Os indicadores serão definidos após a validação do domínio. Possíveis exemplos:

- Percentual de propostas convertidas em vendas.
- Tempo médio entre solicitação e envio de proposta.
- Quantidade de reservas expiradas.
- Tempo médio de permanência de uma motocicleta no estoque.

Esses indicadores ainda não fazem parte do compromisso do MVP.
