# Como a IA é usada neste projeto

> [!IMPORTANT]
> A IA é uma ferramenta de apoio neste projeto. Ela ajuda no estudo, faz perguntas e sugere caminhos, mas não substitui as decisões, a revisão ou a responsabilidade de quem está desenvolvendo o sistema.

## Por que estou registrando isso

Durante a ideação e a modelagem do Maikeise MotoHub, usei o ChatGPT/Codex, da OpenAI, para estudar conceitos, organizar ideias e revisar o que estava sendo produzido.

Além de apoiar o desenvolvimento, esse uso também faz parte do próprio estudo. Quero observar, na prática, até onde a IA consegue contribuir com a modelagem de software e em quais situações suas respostas precisam ser questionadas, corrigidas ou descartadas.

## Como a IA participa

A ferramenta tem sido usada para:

- explicar termos e conceitos de engenharia de software;
- fazer perguntas que ajudam a transformar ideias em regras mais claras;
- apontar possíveis lacunas ou contradições entre os documentos;
- apresentar alternativas de modelagem e arquitetura;
- ajudar na organização do backlog, dos diagramas e da documentação;
- automatizar tarefas repetitivas, como a preparação dos cards do GitHub Projects.

Esse apoio não significa aceitar toda sugestão. Cada decisão é discutida, revisada e aprovada antes de entrar no projeto.

## Quem é responsável por cada parte

| Responsabilidade de ANNY MAIKEISE | Como a IA pode apoiar |
| --- | --- |
| Definir o objetivo, o escopo e as prioridades. | Fazer perguntas e ajudar a organizar as respostas. |
| Explicar, revisar e aprovar as regras de negócio. | Sugerir casos alternativos, conflitos e pontos ainda indefinidos. |
| Escolher as decisões de DDD e arquitetura. | Explicar opções, vantagens, riscos e consequências. |
| Entender os documentos e comandos antes de usá-los. | Ajudar a escrever, revisar e simplificar o conteúdo. |
| Implementar, executar, testar e corrigir o sistema. | Apoiar a investigação de erros e sugerir possíveis soluções. |
| Responder pela autoria e pela qualidade do repositório. | Servir como ferramenta de apoio, sem tomar decisões finais. |

Uma resposta da IA, sozinha, não é considerada requisito, evidência ou decisão arquitetural.

## Como vou validar a modelagem

A IA pode ajudar a encontrar problemas, mas não pode afirmar sozinha que a modelagem está correta. Por isso, o modelo será validado aos poucos:

1. **Coerência:** glossário, regras, requisitos, eventos, agregados e arquitetura precisam representar o mesmo negócio.
2. **Rastreabilidade:** deve ser possível entender de onde uma decisão veio e onde ela aparece na documentação, nas issues, no código e nos testes.
3. **Cenários reais:** o fluxo principal, as exceções e os casos de erro precisam fazer sentido quando aplicados a exemplos concretos.
4. **Implementação:** se uma regra for difícil ou impossível de representar no código, o modelo deverá ser revisto.
5. **Testes:** as regras mais importantes deverão ser demonstradas por testes automatizados e reproduzíveis.
6. **Revisão humana:** sugestões relevantes serão comparadas com referências técnicas e com o conhecimento disponível sobre o domínio.

## O que quero observar

Ao longo do projeto, quero descobrir se a IA realmente ajuda a:

- tornar conceitos técnicos mais compreensíveis;
- levantar perguntas que eu ainda não havia considerado;
- manter vários documentos coerentes entre si;
- reduzir tarefas repetitivas sem retirar o aprendizado;
- comparar alternativas sem esconder os seus trade-offs;
- perceber e corrigir decisões que não funcionam quando chegam ao código.

Também quero registrar suas limitações: respostas que parecem corretas, mas não são; sugestões genéricas; arquitetura desnecessariamente complexa; perda de contexto; e o risco de depender da ferramenta sem compreender o que está sendo feito.

## Cuidados adotados

- Nenhuma resposta entra no projeto apenas por ter sido gerada pela IA.
- Toda decisão importante precisa ser compreendida e justificada por mim.
- Código sugerido deve ser lido, executado e testado antes do commit.
- Credenciais, segredos e informações confidenciais não devem ser compartilhados com a ferramenta.
- Erros, correções e mudanças de entendimento fazem parte do histórico real do projeto.
- O uso da IA permanece visível para avaliações acadêmicas e profissionais.

## Autoria

A IA contribui com perguntas, explicações, sugestões, revisões e automações. A escolha do que será usado, a adaptação dos artefatos, as decisões do projeto e a verificação do software são responsabilidade de [ANNY MAIKEISE](https://github.com/notmaikeise).

Esta página será atualizada durante o desenvolvimento para registrar exemplos reais do que funcionou, do que precisou ser corrigido e do que foi aprendido com esse processo.

[Voltar ao Hub da documentação](README.md).
