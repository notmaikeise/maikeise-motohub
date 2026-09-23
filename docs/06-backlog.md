# Backlog inicial

Este backlog organiza o trabalho conhecido antes do início da implementação. Os itens podem mudar depois do DDD estratégico e tático.

> [!TIP]
> A visão rápida mostra a sequência de entrega. Abra um épico para consultar IDs, prioridade e resultado esperado de cada item.

<details>
<summary><strong>Convenções de prioridade e tipo</strong></summary>

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
- **Feature:** valor perceptível a um ator do sistema.
- **Technical:** infraestrutura ou qualidade interna.

</details>

## Visão rápida

| Épico | Foco |
| --- | --- |
| 0 | Descobrir e modelar o domínio antes do código. |
| 1 | Preparar a fundação técnica reproduzível. |
| 2 | Implementar identidade, acesso e clientes. |
| 3 | Disponibilizar catálogo e estoque. |
| 4 | Conduzir propostas, versões e descontos. |
| 5 | Proteger reservas e concorrência. |
| 6 | Concluir e consultar vendas. |
| 7 | Reforçar auditoria, qualidade e experiência. |
| 8 | Construir a interface web e publicar os contratos REST. |
| 9 | Empacotar, validar e apresentar a versão local. |

<details>
<summary><strong>Épico 0 — Descoberta e DDD</strong></summary>

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-001 | Consolidar a linguagem ubíqua | Discovery | Must | Glossário revisado com termos do domínio |
| BKL-002 | Identificar subdomínios | Discovery | Must | Subdomínios Core, Supporting e Generic |
| BKL-003 | Definir Bounded Contexts | Discovery | Must | Limites e responsabilidades dos contextos |
| BKL-004 | Criar o Context Map | Discovery | Must | Relações entre os contextos |
| BKL-005 | Mapear eventos de domínio | Discovery | Must | Linha do tempo do fluxo comercial |
| BKL-006 | Modelar agregados e invariantes | Discovery | Must | Modelo tático inicial por contexto |
| BKL-007 | Registrar decisão arquitetural inicial | Architecture | Must | ADR sobre monólito modular e evolução |

> [!NOTE]
> Os itens `BKL-001` a `BKL-007` estão concluídos. O próximo item recomendado é `BKL-010`.

</details>

<details>
<summary><strong>Épico 1 — Fundação técnica</strong></summary>

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-010 | Criar projeto Spring Boot | Technical | Must | Aplicação executável com configuração mínima |
| BKL-011 | Configurar PostgreSQL local | Technical | Must | Banco iniciado de forma reproduzível |
| BKL-012 | Configurar Docker Compose | Technical | Must | Aplicação e dependências iniciadas localmente |
| BKL-013 | Configurar migrações com Flyway | Technical | Must | Estrutura do banco versionada |
| BKL-014 | Definir padrão de respostas de erro | Architecture | Must | Contrato de erros documentado |
| BKL-015 | Configurar testes e Testcontainers | Technical | Must | Base de testes unitários e de integração |
| BKL-016 | Configurar integração contínua | Technical | Must | Build e testes executados em cada mudança |
| BKL-017 | Estruturar módulos Spring Modulith | Architecture | Must | Seis módulos detectados e sem ciclos |
| BKL-018 | Configurar qualidade automática do código | Technical | Should | Formatação, análise estática e cobertura integradas ao Maven |
| BKL-019 | Configurar perfis, propriedades e segredos locais | Technical | Must | Configuração reproduzível sem credenciais versionadas |

</details>

<details>
<summary><strong>Épico 2 — Identidade e acesso</strong></summary>

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-020 | Cadastrar cliente PF | Feature | Must | Cliente e conta de acesso criados com validações |
| BKL-021 | Cadastrar cliente PJ | Feature | Must | Cliente PJ e um ou mais representantes vinculados às próprias contas |
| BKL-022 | Autenticar conta de acesso | Feature | Must | Entrada e saída seguras |
| BKL-023 | Autorizar ações por papel | Feature | Must | Permissões aplicadas no servidor |
| BKL-024 | Gerenciar contas de funcionários | Feature | Must | Administrador convida funcionários e controla acessos internos |
| BKL-025 | Recuperar senha | Feature | Should | Titular recupera acesso à conta |
| BKL-026 | Confirmar e alterar e-mail de acesso | Feature | Must | Operações comerciais usam uma conta com e-mail verificado |
| BKL-027 | Consultar e editar o próprio cadastro | Feature | Must | Cliente atualiza dados permitidos sem alterar documentos protegidos |
| BKL-028 | Pesquisar e controlar clientes | Feature | Must | Funcionário pesquisa, inativa, bloqueia e corrige cadastros conforme sua permissão |
| BKL-029 | Gerenciar representantes de cliente PJ | Feature | Must | Vínculos possuem autorização, histórico e proteção do último representante |

</details>

<details>
<summary><strong>Épico 3 — Catálogo e estoque</strong></summary>

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-030 | Cadastrar modelo de motocicleta | Feature | Must | Base de modelos disponível para vincular unidades |
| BKL-031 | Cadastrar unidade de estoque | Feature | Must | Unidade identificada por chassi |
| BKL-032 | Controlar status da unidade | Feature | Must | Transições válidas e auditadas |
| BKL-033 | Consultar catálogo público | Feature | Must | Visitante encontra unidades específicas e seus preços anunciados |
| BKL-034 | Pesquisar e filtrar catálogo | Feature | Should | Busca por atributos comerciais |
| BKL-035 | Gerenciar fotos da unidade | Feature | Should | Detalhes visuais no catálogo |
| BKL-036 | Gerenciar anúncios | Feature | Must | Rascunho, publicação, preço e arquivamento controlados |
| BKL-037 | Sincronizar disponibilidade pública | Technical | Must | Catálogo reage a mudanças do estoque sem decidir a disponibilidade real |
| BKL-038 | Proteger identificadores únicos da unidade | Technical | Must | Chassi, motor e placa permanecem únicos sob concorrência |
| BKL-039 | Pesquisar estoque para funcionários | Feature | Should | Equipe consulta unidades e situações operacionais |

</details>

<details>
<summary><strong>Épico 4 — Propostas e descontos</strong></summary>

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-040 | Solicitar proposta | Feature | Must | Cliente envia interesse por unidades específicas |
| BKL-041 | Preparar e calcular proposta | Feature | Must | Vendedor calcula valor bruto, desconto global e valor final |
| BKL-042 | Controlar validade da proposta | Feature | Must | Expiração automática em sete dias |
| BKL-043 | Versionar proposta | Feature | Must | Histórico preservado após mudanças |
| BKL-044 | Aprovar desconto especial | Feature | Must | Gerente decide descontos acima de 10% |
| BKL-045 | Aceitar ou recusar proposta | Feature | Must | Cliente registra sua decisão |
| BKL-046 | Gerar proposta em PDF | Feature | Should | Documento comercial para download |
| BKL-047 | Enviar proposta e aviso de vencimento | Feature | Must | Cliente recebe a versão enviada e o aviso previsto |
| BKL-048 | Acompanhar solicitações de proposta | Feature | Must | Cliente e vendedor visualizam situação e responsável pelo atendimento |
| BKL-049 | Consultar histórico da negociação | Feature | Must | Atores autorizados veem versões e decisões sem alteração retroativa |

</details>

<details>
<summary><strong>Épico 5 — Reservas</strong></summary>

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-050 | Criar reserva de proposta aceita | Feature | Must | Unidades reservadas para o cliente |
| BKL-051 | Impedir reserva simultânea | Technical | Must | Apenas uma reserva ativa por unidade |
| BKL-052 | Expirar reserva em 48 horas | Feature | Must | Estoque liberado automaticamente |
| BKL-053 | Cancelar reserva | Feature | Must | Cliente ou funcionário libera unidades |
| BKL-054 | Prorrogar reserva uma vez | Feature | Must | Gerente acrescenta 24 horas com justificativa |
| BKL-055 | Avisar vencimento da reserva | Feature | Must | Cliente recebe e-mail 24 horas antes do prazo |
| BKL-056 | Consultar situação e prazo da reserva | Feature | Must | Cliente e equipe visualizam estado, unidades e vencimento |
| BKL-057 | Tornar a tentativa de reserva idempotente | Technical | Must | Repetições não criam reservas nem bloqueios duplicados |

</details>

<details>
<summary><strong>Épico 6 — Vendas</strong></summary>

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-060 | Registrar confirmação de pagamento externo | Feature | Must | Confirmação vinculada à negociação |
| BKL-061 | Concluir venda | Feature | Must | Venda, proposta, reserva e estoque atualizados |
| BKL-062 | Preservar snapshot comercial | Technical | Must | Valores históricos não mudam |
| BKL-063 | Consultar histórico de compras | Feature | Must | Cliente visualiza suas vendas concluídas sob a perspectiva de compra |
| BKL-064 | Pesquisar vendas | Feature | Must | Funcionário consulta operações concluídas |
| BKL-065 | Cancelar venda e revisar unidades | Feature | Must | Gerente compensa a venda sem apagar o histórico |
| BKL-066 | Recuperar falhas na conclusão da venda | Technical | Must | Repetições e eventos confiáveis concluem o fluxo sem duplicar a venda |
| BKL-067 | Exibir resumo gerencial de vendas | Feature | Should | Gerente consulta indicadores comerciais básicos do período |

</details>

<details>
<summary><strong>Épico 7 — Auditoria, qualidade e experiência</strong></summary>

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-070 | Registrar ações importantes | Technical | Must | Trilha básica de auditoria |
| BKL-071 | Padronizar validações e mensagens | Feature | Must | Erros claros e consistentes |
| BKL-072 | Garantir navegação por teclado | Technical | Must | Fluxos principais acessíveis |
| BKL-073 | Criar dados demonstrativos | Technical | Should | Avaliação rápida do portfólio |
| BKL-074 | Documentar execução local | Documentation | Must | Projeto executável por outra pessoa |
| BKL-075 | Enviar e repetir notificações | Technical | Must | E-mails assíncronos não comprometem a operação comercial |
| BKL-076 | Configurar o Event Publication Registry | Technical | Must | Eventos obrigatórios permanecem recuperáveis após falha |
| BKL-077 | Consultar trilha de auditoria | Feature | Must | Contas autorizadas pesquisam registros seguros e imutáveis |
| BKL-078 | Implementar processos temporais controláveis | Technical | Must | Expirações e repetições usam scheduler, `Clock` e idempotência |
| BKL-079 | Proteger logs e dados auditáveis | Technical | Must | Logs técnicos e auditoria não expõem segredos nem dados desnecessários |

</details>

<details>
<summary><strong>Épico 8 — Interface web e API</strong></summary>

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-080 | Criar layout e design system da interface | Technical | Must | Thymeleaf e HTMX compartilham componentes visuais consistentes |
| BKL-081 | Criar páginas públicas do catálogo | Feature | Must | Visitante navega, filtra e consulta unidades específicas |
| BKL-082 | Criar telas de autenticação e cadastro | Feature | Must | Clientes e funcionários concluem seus fluxos de acesso |
| BKL-083 | Criar área do cliente | Feature | Must | Cliente gerencia cadastro, propostas, reservas e compras |
| BKL-084 | Criar área administrativa | Feature | Must | Funcionários acessam somente operações permitidas ao seu papel |
| BKL-085 | Criar telas do fluxo comercial | Feature | Must | Solicitação, proposta, reserva e venda podem ser conduzidas pela web |
| BKL-086 | Publicar API REST versionada | Technical | Must | Casos de uso selecionados possuem contratos em `/api/v1` |
| BKL-087 | Publicar documentação OpenAPI | Documentation | Must | Contratos REST podem ser explorados e testados localmente |
| BKL-088 | Validar responsividade e acessibilidade | Technical | Must | Fluxos principais funcionam por teclado e em diferentes telas |

</details>

<details>
<summary><strong>Épico 9 — Empacotamento, portfólio e release</strong></summary>

| ID | Item | Tipo | Prioridade | Resultado esperado |
| --- | --- | --- | --- | --- |
| BKL-090 | Criar Dockerfile em múltiplos estágios | Technical | Must | Aplicação gera uma imagem reproduzível e enxuta |
| BKL-091 | Integrar aplicação ao Docker Compose | Technical | Must | Aplicação, PostgreSQL e Mailpit sobem com healthchecks |
| BKL-092 | Configurar variáveis e exemplo de ambiente | Technical | Must | Outra pessoa configura o projeto sem acessar segredos reais |
| BKL-093 | Validar instalação a partir de clone limpo | Technical | Must | Instruções são comprovadas em ambiente sem artefatos anteriores |
| BKL-094 | Preparar apresentação técnica do portfólio | Documentation | Should | README apresenta arquitetura, execução e evidências visuais |
| BKL-095 | Definir licença e governança do repositório | Documentation | Must | Uso do código, contribuições e segurança possuem orientação explícita |
| BKL-096 | Publicar a release local `v0.1.0` | Documentation | Must | Versão demonstrável possui checklist, tag e notas de release |
| BKL-097 | Manter estacionamento de evoluções pós-MVP | Documentation | Won't | Ideias futuras ficam registradas sem ampliar o compromisso atual |

</details>

<details>
<summary><strong>Conteúdo do estacionamento pós-MVP</strong></summary>

- Pagamento online.
- Multi-tenancy.
- Oficina.
- Trade-in.
- Seguros e garantias.
- Integrações fiscais e bancárias reais.
- OBD-II e telemetria.
- Aplicativo móvel nativo.
- Exportação CSV e relatórios avançados.
- Integração simulada ou real com a FIPE.
- Favoritos e comparação entre modelos.
- Extração de microsserviços quando houver evidência operacional.

</details>

## Ordem recomendada

1. **Concluído:** consolidar os itens `BKL-001` a `BKL-007`.
2. **Próximo:** criar a fundação técnica, começando pela `BKL-010`.
3. Implementar um fluxo vertical simples de catálogo.
4. Acrescentar identidade e clientes.
5. Implementar proposta, reserva e venda nesta ordem.
6. Reforçar auditoria, acessibilidade e documentação continuamente.

[Voltar ao Hub da documentação](README.md).
