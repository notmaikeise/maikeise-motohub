# Linguagem ubíqua

Este documento registra o vocabulário oficial inicial do Maikeise MotoHub, consolidado na `BKL-001`. Ele é um documento vivo e será refinado quando novos conhecimentos surgirem durante a modelagem e a implementação.

> [!TIP]
> Use este arquivo como referência, não como leitura linear. Procure primeiro o termo do domínio; conceitos técnicos estão recolhidos ao final.

| Termo | Definição oficial no Maikeise MotoHub |
| --- | --- |
| Administrador | Funcionário que gerencia contas, papéis de acesso e permissões internas. |
| Aceite da proposta | Confirmação registrada de que o cliente concorda com uma proposta enviada e válida. O aceite não bloqueia automaticamente as unidades. |
| Alçada de desconto | Percentual máximo que um funcionário pode conceder sem aprovação superior. No MVP, a alçada do vendedor é de 10% sobre o valor bruto total da proposta. |
| Análise de desconto | Decisão registrada do gerente sobre um desconto que ultrapassa a alçada do vendedor. |
| Anúncio | Representação pública de uma unidade de estoque no catálogo, com descrição, fotos, preço anunciado e situação de disponibilidade. |
| Auditoria | Registro de uma ação com responsável, data e horário. |
| Bloqueio comercial | Restrição aplicada ao cliente que impede novas negociações sem apagar seu cadastro ou histórico. Operações abertas são encaminhadas para análise. |
| Cancelamento da reserva | Encerramento intencional de uma reserva por um cliente ou funcionário autorizado. |
| Cancelamento da venda | Ação compensatória autorizada pelo gerente que preserva a venda original, registra um motivo e coloca suas unidades em revisão. |
| Catálogo | Apresentação pública dos anúncios de unidades de estoque. Unidades do mesmo modelo aparecem separadamente, e uma unidade reservada pode continuar visível sem permitir nova seleção. |
| Cliente | Pessoa física ou jurídica cadastrada que participa de propostas, reservas e vendas. É o termo oficial do domínio para quem negocia a aquisição de motocicletas. |
| Cliente ativo | Cliente autorizado a iniciar novas propostas e reservas. |
| Compra | Perspectiva pela qual o cliente visualiza uma venda concluída. Não representa um registro comercial diferente da venda. |
| Concessionária | Organização que utiliza o sistema e comercializa motocicletas. |
| Confirmação de pagamento | Registro feito por um funcionário autorizado após verificar que um pagamento externo foi realizado. Não significa que o MotoHub processou a transação. |
| Conclusão da venda | Operação que valida a proposta aceita, a reserva ativa e a confirmação de pagamento antes de criar a venda definitiva. |
| Conta de acesso | Credenciais e estado de acesso utilizados por uma pessoa para entrar no sistema. Não representa, por si só, um cliente ou funcionário. |
| Desconto comercial | Redução aplicada ao valor bruto total de uma proposta. |
| E-mail confirmado | Endereço eletrônico cuja posse foi validada por meio do fluxo de confirmação da conta. |
| Expiração da reserva | Encerramento automático de uma reserva quando seu prazo termina sem a conclusão da venda. |
| Funcionário | Pessoa interna da concessionária que utiliza uma conta de acesso para realizar atividades autorizadas. |
| Funcionário autorizado | Funcionário cuja conta possui permissão para executar determinada ação. |
| Gerente | Funcionário que analisa descontos especiais e exceções permitidas. |
| Modelo de motocicleta | Definição compartilhada de marca, modelo, versão e especificações. Não representa uma motocicleta física que possa ser reservada ou vendida. |
| Pagamento externo | Pagamento realizado fora do Maikeise MotoHub e confirmado por um funcionário. |
| Pagamento online | Processamento de pagamento dentro do MotoHub. É uma capacidade futura e não pertence ao MVP. |
| Papel de acesso | Conjunto nomeado de permissões atribuído a uma conta, como responsável pelo estoque, vendedor, gerente ou administrador. |
| Pessoa física | Cliente individual identificado pelo CPF. |
| Pessoa jurídica | Cliente empresarial identificado pelo CNPJ. |
| Preparação | Etapa anterior à disponibilidade comercial de uma unidade. |
| Preço anunciado | Valor atual exibido para uma unidade no catálogo e usado como base na criação de uma versão de proposta. |
| Proposta | Oferta comercial preparada pelo vendedor em resposta a uma solicitação, contendo unidades, valores, descontos, condições e validade. Somente uma proposta enviada e válida pode ser aceita ou recusada pelo cliente. |
| Prorrogação da reserva | Extensão do prazo de uma reserva ativa, autorizada pelo gerente antes da expiração e acompanhada de justificativa. |
| Representante | Pessoa física vinculada a um cliente pessoa jurídica que utiliza uma conta de acesso para agir em nome da empresa. |
| Reserva | Bloqueio temporário confirmado de uma ou mais unidades para o cliente de uma proposta aceita. Possui prazo inicial de 48 horas e admite uma única prorrogação gerencial de 24 horas. |
| Reserva ativa | Reserva confirmada que ainda não expirou, não foi cancelada e não foi utilizada para concluir uma venda. |
| Responsável pelo estoque | Funcionário que gerencia modelos, unidades e disponibilidade. |
| Snapshot comercial | Cópia imutável das unidades, preços, desconto e condições da proposta aceita, preservada na venda. |
| Solicitação de proposta | Pedido inicial enviado por um cliente ativo após a escolha de uma ou mais unidades. Demonstra interesse comercial, mas ainda não constitui uma oferta e não reserva as unidades. |
| Solicitação de reserva | Comando interno disparado automaticamente após o aceite de uma proposta válida para verificar novamente a disponibilidade e tentar bloquear suas unidades. |
| Unidade de estoque | Motocicleta física específica, identificada principalmente pelo chassi e com informações próprias, como cor, ano, preço e situação no estoque. É a unidade escolhida pelo cliente, incluída na proposta, reservada e vendida. |
| Unidade disponível | Unidade de estoque apta a aparecer no catálogo e participar de uma nova negociação. |
| Unidade em revisão | Unidade temporariamente impedida de voltar ao catálogo até uma conferência explícita, inclusive depois do cancelamento de uma venda. |
| Unidade fora de venda | Unidade retirada da comercialização sem apagar seu cadastro ou histórico. |
| Usuário autenticado | Pessoa que entrou no sistema por meio de uma conta de acesso válida. É uma condição de acesso, não um sinônimo de cliente. |
| Valor bruto da proposta | Soma dos preços das unidades incluídas em uma versão da proposta antes do desconto comercial. |
| Valor final da proposta | Valor bruto da proposta menos o desconto comercial concedido. |
| Venda | Registro comercial definitivo criado após proposta aceita, reserva ativa e confirmação do pagamento externo. Preserva as condições comerciais utilizadas na conclusão. |
| Vendedor | Funcionário que prepara propostas, acompanha negociações e conclui vendas. |
| Versão de proposta | Edição identificada e preservada de uma proposta. Quando condições comerciais são alteradas, uma nova versão substitui a anterior para fins de aceite. |
| Visitante | Pessoa que consulta o catálogo público sem precisar estar autenticada ou cadastrada como cliente. |

## Convenções de linguagem

- **Cliente** é o termo oficial utilizado no domínio, na documentação e futuramente no código.
- **Comprador** pode aparecer em conversas informais, mas não representa um conceito separado do domínio.
- Um cliente pessoa jurídica realiza ações no sistema por meio de um **representante**.
- **Moto** e **motocicleta** podem aparecer como palavras genéricas na interface e nas conversas. Quando a distinção importar, devem ser usados **modelo de motocicleta** e **unidade de estoque**.
- O cliente escolhe uma **unidade de estoque específica** no catálogo; o sistema não escolhe automaticamente uma unidade apenas com base no modelo.
- **Solicitação de proposta** é o pedido inicial do cliente; **proposta** é a oferta comercial produzida pelo vendedor.
- O envio de uma solicitação ou proposta não reserva unidades. A reserva somente pode ser solicitada depois do aceite de uma proposta válida.
- No MVP, o aceite dispara automaticamente a tentativa de criar a reserva, mas o aceite e a reserva continuam sendo fatos distintos.
- **Conta de acesso** pertence à identidade e à segurança; **cliente** pertence ao negócio comercial.
- Clientes, representantes e funcionários descrevem quem participa do negócio. Papéis de acesso descrevem o que uma conta está autorizada a fazer.
- **Aceite da proposta** registra concordância comercial; **reserva** registra o bloqueio temporário efetivo das unidades.
- **Expiração** é um encerramento automático causado pelo fim do prazo. **Cancelamento** é um encerramento intencional realizado por um ator autorizado.
- **Venda** é o termo oficial do domínio. **Compra** é a forma de apresentar a mesma operação sob a perspectiva do cliente.
- No MVP, o MotoHub registra a **confirmação de pagamento**, mas não processa o pagamento.
- No MVP, o **desconto comercial** é aplicado ao valor bruto total da proposta. Descontos diferentes por unidade ficam como evolução futura.
- O desconto global é uma escolha de escopo do MVP, não uma regra universal do mercado.
- O **preço anunciado** é copiado para a versão da proposta. Alterações posteriores no catálogo não mudam versões já criadas.

<details>
<summary><strong>Termos técnicos usados no planejamento</strong></summary>

## Termos técnicos usados no planejamento

| Termo | Definição simples |
| --- | --- |
| Ação compensatória | Nova operação que corrige ou neutraliza os efeitos de algo já concluído sem apagar o fato original. |
| Adaptador | Componente que conecta uma porta da aplicação a uma tecnologia ou interface externa, como REST, banco de dados ou mensageria. |
| Aggregate Root (Raiz do Agregado) | Entidade que funciona como única porta autorizada para alterar os objetos de um agregado e proteger suas invariantes. |
| Agregado | Conjunto de entidades e Value Objects tratado como uma unidade de consistência. |
| Anti-Corruption Layer (ACL) | Camada que traduz contratos externos para o modelo interno, impedindo que um contexto seja contaminado pelo modelo de outro. |
| Arquitetura Hexagonal | Organização que mantém as regras de negócio no centro e isola tecnologias externas por meio de portas e adaptadores. |
| Assíncrono | Modo de comunicação em que o publicador não espera que todos os consumidores concluam o processamento. |
| Bounded Context | Limite dentro do qual um modelo e sua linguagem possuem significados consistentes. Os contextos iniciais foram definidos na `BKL-003`. |
| Consistência eventual | Situação em que uma representação pode ficar temporariamente desatualizada, mas converge posteriormente para o estado correto. |
| Context Map | Mapa que registra relações, direções de dependência e padrões de integração entre Bounded Contexts. |
| Core | Classificação de um subdomínio estratégico que concentra diferenciação e complexidade central. |
| Customer/Supplier | Relação em que o contexto consumidor apresenta suas necessidades e o contexto fornecedor oferece um contrato apropriado. Customer, nesse padrão, não significa o cliente da concessionária. |
| DDD | Abordagem de desenvolvimento que organiza o software a partir do domínio do negócio. |
| Domínio | Área de negócio e conjunto de problemas que o software pretende compreender e resolver. |
| Downstream | Contexto que consome uma informação, capacidade ou contrato fornecido por outro contexto. |
| Entidade | Objeto de domínio reconhecido por uma identidade que permanece ao longo das mudanças. |
| Evento de domínio | Representação de algo relevante que já aconteceu no negócio, normalmente nomeada no passado. |
| Generic | Classificação de um subdomínio que resolve um problema comum a muitos sistemas. |
| ID tipado | Value Object que identifica um conceito específico, evitando trocar acidentalmente IDs de tipos diferentes. |
| Idempotência | Repetir uma solicitação não cria resultados duplicados. |
| Invariante | Regra que deve permanecer verdadeira durante toda mudança válida do modelo, como impedir duas reservas ativas para a mesma unidade. |
| Linguagem ubíqua | Vocabulário compartilhado e consistente usado nas conversas, na documentação e no código. |
| Máquina de estados | Modelo que define os estados válidos de um objeto e quais transições podem ocorrer entre eles. |
| Migração de banco | Alteração versionada da estrutura do banco de dados. |
| Monólito modular | Aplicação implantada como uma unidade, mas dividida internamente em módulos com limites e dependências controlados. |
| Multi-tenant | Sistema que atende várias organizações com isolamento de dados. |
| MVP | Menor versão do produto que entrega valor e permite validar o fluxo principal. |
| Open Host Service | Serviço com contrato estável oferecido por um contexto para uso de vários consumidores. |
| Partnership | Relação em que dois contextos coordenam sua evolução porque o sucesso de um fluxo depende de ambos. |
| Porta | Contrato pelo qual o núcleo da aplicação recebe uma ação ou solicita uma capacidade externa sem depender da tecnologia concreta. |
| Política | Regra que reage a um acontecimento e pode iniciar uma nova ação. |
| Published Language | Formato de comunicação explicitamente definido e compreendido pelos contextos envolvidos. |
| RBAC | Controle de acesso baseado em papéis, no qual permissões são agrupadas em perfis atribuídos às contas. |
| Repositório | Porta usada para recuperar e persistir Aggregate Roots sem expor a tecnologia de armazenamento ao domínio. |
| Serviço de aplicação | Componente que coordena um caso de uso, transações, repositórios e portas externas sem substituir as regras das Aggregate Roots. |
| Serviço de domínio | Componente que representa uma regra de negócio que não pertence naturalmente a uma única entidade ou Value Object. |
| Shared Kernel | Parte de modelo ou código deliberadamente compartilhada por contextos e alterada mediante coordenação. Não será adotada entre os contextos de negócio do MotoHub. |
| Single-tenant | Sistema que atende uma organização. |
| Síncrono | Modo de comunicação em que quem solicita aguarda uma resposta para continuar. |
| Snapshot | Cópia imutável dos dados relevantes de um momento, usada para preservar o histórico mesmo que a fonte original mude depois. |
| Subdomínio | Parte coerente do problema de negócio, com responsabilidades e regras relacionadas. |
| Supporting | Classificação de um subdomínio necessário ao Core, mas que não representa o principal diferencial do produto. |
| Transactional Outbox | Padrão que registra uma alteração e o evento correspondente de forma atômica para permitir entrega posterior confiável. Sua adoção ainda será avaliada. |
| Transação local | Conjunto de alterações confirmado por inteiro ou totalmente desfeito dentro do mesmo banco e limite operacional. |
| Upstream | Contexto que fornece uma informação, capacidade ou contrato para outro contexto. |
| Value Object | Objeto imutável, sem identidade própria, definido e comparado pelos seus valores. |

</details>

[Voltar ao Hub da documentação](README.md).
