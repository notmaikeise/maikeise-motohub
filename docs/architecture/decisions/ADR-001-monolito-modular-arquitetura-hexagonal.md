# ADR-001 — Monólito modular com Arquitetura Hexagonal

| Campo | Valor |
| --- | --- |
| Situação | **Aceita** |
| Data | 23 de setembro de 2026 |
| Decisora | ANNY MAIKEISE |
| Relacionada a | `BKL-007` |
| Implementação | Não iniciada; projeto em pausa |

> [!NOTE]
> A decisão permanece aceita como direção de planejamento. Ela ainda não foi validada por código ou operação e deverá ser revisada antes de uma possível implementação.

## Contexto

O Maikeise MotoHub precisa transformar um modelo DDD com seis Bounded Contexts em uma aplicação Java executável. O projeto é individual, educacional e voltado a portfólio; deve ser compreensível, testável e reproduzível localmente sem ferramentas pagas.

O domínio possui regras que exigem consistência forte, principalmente a reserva integral de unidades específicas. Ao mesmo tempo, catálogo, auditoria e notificações aceitam consistência eventual. Ainda não existem equipes, cargas ou requisitos de implantação que justifiquem a operação de vários serviços independentes.

## Direcionadores

- Preservar os limites e a linguagem definidos pelo DDD.
- Impedir duas reservas ativas para a mesma unidade.
- Manter histórico de propostas, vendas e ações relevantes.
- Permitir testes do domínio sem framework ou infraestrutura.
- Minimizar custo cognitivo e operacional para uma desenvolvedora.
- Executar todo o ambiente localmente sem pagamento.
- Manter uma rota de evolução para distribuição futura sem prometê-la antecipadamente.

## Decisão

Adotar um **monólito modular Spring Boot**, com:

1. Um repositório, um projeto Maven e um artefato executável.
2. Um módulo lógico por Bounded Context, detectado e verificado pelo Spring Modulith.
3. Arquitetura Hexagonal dentro de cada módulo.
4. API pública pequena e implementação protegida em `internal`.
5. Um PostgreSQL com schema separado para cada contexto.
6. Domínio sem dependência de Spring, JPA, HTTP ou banco.
7. Spring Data JPA isolado nos adaptadores, com Data Mappers.
8. Chamadas Java internas para decisões que exigem resposta imediata.
9. Eventos persistidos pelo Event Publication Registry para reações desacopladas.
10. Transações locais por módulo, sem uma transação abrangendo todo processo entre contextos, e consumidores idempotentes.
11. Lock pessimista ordenado para a reserva integral de unidades.
12. REST e Thymeleaf/HTMX como adaptadores do mesmo conjunto de casos de uso.
13. Spring Security com sessão, CSRF e permissões explícitas.
14. Testes arquiteturais, Testcontainers, Docker Compose e GitHub Actions.

A [visão arquitetural](../00-overview.md) detalha os mecanismos escolhidos.

## Alternativas consideradas

### Microsserviços desde o início — rejeitada

Acrescentaria rede, descoberta, observabilidade distribuída, consistência entre serviços e múltiplos deploys sem existir escala ou autonomia de equipes que compense esse custo.

### Monólito organizado apenas em camadas técnicas — rejeitada

Pastas globais como `controller`, `service`, `repository` e `entity` misturariam os modelos dos contextos e tornariam os limites dependentes apenas de disciplina manual.

### Um módulo Maven por Bounded Context — adiada

Oferece isolamento físico de compilação, mas amplia a configuração antes de o código justificar essa necessidade. Spring Modulith e testes arquiteturais fornecerão proteção inicial com menor complexidade.

### Banco separado por contexto — rejeitada para o MVP

Imitaria uma implantação distribuída e dificultaria transações locais como a reserva de múltiplas unidades. Schemas separados entregam propriedade lógica sem multiplicar infraestrutura.

### Banco compartilhado sem propriedade de tabelas — rejeitada

Consultas e associações cruzadas transformariam o banco em contrato oculto e dificultariam qualquer evolução independente.

### Kafka ou RabbitMQ — adiados

O Event Publication Registry oferece entrega recuperável dentro do processo e do PostgreSQL. Um broker será avaliado somente quando eventos precisarem atravessar fronteiras de implantação.

### Frontend SPA separado — adiado

React ou Angular criariam um segundo build, autenticação por token e deploy adicional. Thymeleaf/HTMX atende o MVP sem impedir que a API seja consumida por outro cliente no futuro.

### JWT no navegador — rejeitado para o MVP

Frontend e backend compartilham origem e processo. Sessão no servidor simplifica revogação e logout; token passa a fazer sentido quando existirem clientes ou serviços independentes.

## Consequências positivas

- Menor custo de execução e manutenção.
- Limites do domínio visíveis no código e verificáveis no build.
- Falhas de e-mail, catálogo ou auditoria não desfazem operações centrais.
- Banco e testes reproduzem comportamentos reais de concorrência.
- API e interface reutilizam os mesmos casos de uso.
- Extração futura pode começar por um módulo com dados e contratos já explícitos.

## Consequências negativas

- Separar domínio e entidades JPA cria mapeadores e código adicional.
- Um único processo ainda compartilha recursos de CPU e memória.
- Schemas não impedem acesso indevido sozinhos; testes e revisão continuam necessários.
- Eventos assíncronos introduzem consistência eventual e exigem idempotência.
- O Event Publication Registry não substitui um broker quando houver serviços separados.
- Thymeleaf/HTMX oferece menos experiência direta com SPAs modernas.

## Riscos e mitigações

| Risco | Mitigação |
| --- | --- |
| Módulos passarem a acessar implementações internas | Spring Modulith, interfaces nomeadas e teste obrigatório no CI. |
| Pacote compartilhado virar depósito de código | Proibir modelo de negócio compartilhado e exigir justificativa para utilitários técnicos. |
| Evento ser processado novamente | Consumidores idempotentes, `eventId` e restrições únicas. |
| Falha entre utilização da reserva e criação da venda | Evento persistido, repetição e unicidade por `reservaId`. |
| Deadlock ao reservar várias unidades | Ordenação estável dos IDs, lock com timeout e transação curta. |
| Scheduler duplicado no futuro | MVP com uma instância; coordenação distribuída antes de escalar horizontalmente. |
| Dados sensíveis aparecerem em logs | Lista explícita de campos proibidos e testes/revisão de logging. |
| Ferramenta gratuita mudar de licença | Dependências essenciais open source e revisão antes de cada adoção. |

## Critérios de conformidade

A implementação respeita esta ADR quando:

- a verificação de módulos passa no `mvn verify`;
- domínio não depende de adaptadores;
- módulos não consultam tabelas de outros contextos;
- integrações usam APIs ou eventos documentados;
- invariantes concorrentes possuem testes com PostgreSQL;
- eventos obrigatórios permanecem recuperáveis após falha;
- o ambiente sobe por Docker Compose sem serviço pago;
- a documentação explica como testar e executar do zero.

## Gatilhos para revisão

Reavaliar esta ADR se ocorrer:

- necessidade comprovada de implantação ou escala independente;
- mais de uma equipe com propriedade clara de módulos diferentes;
- requisitos distintos de disponibilidade ou isolamento de falhas;
- gargalo operacional impossível de resolver dentro do monólito;
- criação de cliente externo que exija OAuth2/OIDC;
- necessidade de eventos atravessarem processos ou organizações.

Uma revisão não implica automaticamente migrar para microsserviços. Ela apenas exige comparar novamente custos, benefícios e riscos com dados reais.

## Resultado

A decisão aceita a complexidade necessária para proteger o domínio, mas adia a complexidade distribuída que o MVP ainda não precisa. A comprovação dessas regras em código ficou adiada com a pausa do projeto e dependerá de uma nova revisão antes da implementação.

[Voltar ao Hub da arquitetura](../README.md).
