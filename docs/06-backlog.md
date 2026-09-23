# Backlog inicial

Este backlog organiza o trabalho conhecido antes do início da implementação. Os itens podem mudar depois do DDD estratégico e tático.

## Convenções

### Prioridade

- **Must:** necessário para o MVP.
- **Should:** importante, mas não bloqueia o MVP.
- **Could:** melhoria desejável.
- **Won't:** fora da versão atual.

### Tipo

- **Discovery:** investigação e modelagem.
- **Documentation:** documentação do produto.
- **Architecture:** decisão técnica relevante.
- **Feature:** valor perceptível ao usuário.
- **Technical:** infraestrutura ou qualidade interna.

## Épico 0 - Descoberta e DDD

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-001 | Consolidar a linguagem ubíqua | Discovery | Must | Glossário revisado com termos do domínio |
| BKL-002 | Identificar subdomínios | Discovery | Must | Subdomínios central, de apoio e genéricos |
| BKL-003 | Definir Bounded Contexts | Discovery | Must | Limites e responsabilidades dos contextos |
| BKL-004 | Criar o Context Map | Discovery | Must | Relações entre os contextos |
| BKL-005 | Mapear eventos de domínio | Discovery | Must | Linha do tempo do fluxo comercial |
| BKL-006 | Modelar agregados e invariantes | Discovery | Must | Modelo tático inicial por contexto |
| BKL-007 | Registrar decisão arquitetural inicial | Architecture | Must | ADR sobre monólito modular e evolução |

## Épico 1 - Fundação técnica

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-010 | Criar projeto Spring Boot | Technical | Must | Aplicação executável com configuração mínima |
| BKL-011 | Configurar PostgreSQL local | Technical | Must | Banco iniciado de forma reproduzível |
| BKL-012 | Configurar Docker Compose | Technical | Must | Aplicação e dependências iniciadas localmente |
| BKL-013 | Configurar migrações com Flyway | Technical | Must | Estrutura do banco versionada |
| BKL-014 | Definir padrão de respostas de erro | Architecture | Must | Contrato de erros documentado |
| BKL-015 | Configurar testes e Testcontainers | Technical | Must | Base de testes unitários e de integração |
| BKL-016 | Configurar integração contínua | Technical | Should | Build e testes executados em cada mudança |

## Épico 2 - Identidade e acesso

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-020 | Cadastrar comprador PF | Feature | Must | Conta PF criada com validações |
| BKL-021 | Cadastrar comprador PJ | Feature | Must | Conta PJ e representante criados |
| BKL-022 | Autenticar usuário | Feature | Must | Entrada e saída seguras |
| BKL-023 | Autorizar ações por perfil | Feature | Must | Permissões aplicadas no servidor |
| BKL-024 | Gerenciar contas de funcionários | Feature | Must | Administrador controla acessos internos |
| BKL-025 | Recuperar senha | Feature | Should | Usuário recupera acesso à conta |

## Épico 3 - Catálogo e estoque

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-030 | Cadastrar modelo de motocicleta | Feature | Must | Catálogo de modelos disponível |
| BKL-031 | Cadastrar unidade de estoque | Feature | Must | Unidade identificada por chassi |
| BKL-032 | Controlar status da unidade | Feature | Must | Transições válidas e auditadas |
| BKL-033 | Consultar catálogo público | Feature | Must | Visitante encontra unidades disponíveis |
| BKL-034 | Pesquisar e filtrar catálogo | Feature | Should | Busca por atributos comerciais |
| BKL-035 | Gerenciar fotos da motocicleta | Feature | Should | Detalhes visuais no catálogo |

## Épico 4 - Propostas e descontos

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-040 | Solicitar proposta | Feature | Must | Comprador envia interesse comercial |
| BKL-041 | Preparar e calcular proposta | Feature | Must | Vendedor define itens e condições |
| BKL-042 | Controlar validade da proposta | Feature | Must | Expiração automática em sete dias |
| BKL-043 | Versionar proposta | Feature | Must | Histórico preservado após mudanças |
| BKL-044 | Aprovar desconto especial | Feature | Must | Gerente decide descontos acima de 10% |
| BKL-045 | Aceitar ou recusar proposta | Feature | Must | Comprador registra sua decisão |
| BKL-046 | Gerar proposta em PDF | Feature | Should | Documento comercial para download |

## Épico 5 - Reservas

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-050 | Criar reserva de proposta aceita | Feature | Must | Unidades reservadas para o comprador |
| BKL-051 | Impedir reserva simultânea | Technical | Must | Apenas uma reserva ativa por unidade |
| BKL-052 | Expirar reserva em 72 horas | Feature | Must | Estoque liberado automaticamente |
| BKL-053 | Cancelar reserva | Feature | Must | Comprador ou funcionário libera unidades |
| BKL-054 | Prorrogar reserva | Feature | Should | Gerente estende o prazo com justificativa |

## Épico 6 - Vendas

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-060 | Registrar pagamento externo | Feature | Must | Confirmação vinculada à negociação |
| BKL-061 | Concluir venda | Feature | Must | Venda, proposta, reserva e estoque atualizados |
| BKL-062 | Preservar snapshot comercial | Technical | Must | Valores históricos não mudam |
| BKL-063 | Consultar histórico de compras | Feature | Must | Comprador visualiza suas aquisições |
| BKL-064 | Pesquisar vendas | Feature | Must | Funcionário consulta operações concluídas |

## Épico 7 - Auditoria, qualidade e experiência

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-070 | Registrar ações importantes | Technical | Must | Trilha básica de auditoria |
| BKL-071 | Padronizar validações e mensagens | Feature | Must | Erros claros e consistentes |
| BKL-072 | Garantir navegação por teclado | Technical | Must | Fluxos principais acessíveis |
| BKL-073 | Criar dados demonstrativos | Technical | Should | Avaliação rápida do portfólio |
| BKL-074 | Documentar execução local | Documentation | Must | Projeto executável por outra pessoa |

## Épico futuro - Fora do MVP

- Pagamento online.
- Multi-tenancy.
- Oficina.
- Trade-in.
- Seguros e garantias.
- Integrações fiscais e bancárias reais.
- OBD-II e telemetria.

## Ordem recomendada

1. Concluir os itens BKL-001 a BKL-007.
2. Criar a fundação técnica.
3. Implementar um fluxo vertical simples de catálogo.
4. Acrescentar identidade e clientes.
5. Implementar proposta, reserva e venda nesta ordem.
6. Reforçar auditoria, acessibilidade e documentação continuamente.
