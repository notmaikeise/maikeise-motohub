# Uso responsável de IA no projeto

> [!IMPORTANT]
> O Maikeise MotoHub utiliza inteligência artificial generativa como apoio ao aprendizado, à revisão crítica e à organização do trabalho. A IA não é tratada como autora, especialista de domínio nem fonte automática de verdade.

## Declaração de uso

Durante a ideação, a modelagem e a preparação do desenvolvimento, foram utilizadas ferramentas de IA generativa da OpenAI, por meio do ChatGPT/Codex.

O uso faz parte de um estudo prático sobre até que ponto a IA pode ajudar uma pessoa desenvolvedora a:

- compreender e aplicar conceitos de engenharia de software;
- transformar perguntas de negócio em artefatos de modelagem;
- encontrar inconsistências, lacunas e ambiguidades;
- comparar alternativas arquiteturais e seus trade-offs;
- manter rastreabilidade entre regras, modelo, backlog, código e testes;
- aprender durante a construção, em vez de apenas receber um resultado pronto.

## Divisão de responsabilidades

| Responsabilidade da autora | Apoio fornecido pela IA |
| --- | --- |
| Definir objetivos, escopo e prioridades. | Fazer perguntas para explicitar decisões e dúvidas. |
| Informar, revisar e aprovar regras de negócio. | Sugerir formulações, alternativas e possíveis casos de borda. |
| Escolher os trade-offs de DDD e arquitetura. | Explicar conceitos e confrontar opções. |
| Revisar documentos e comandos antes de aceitá-los. | Ajudar a estruturar documentos, diagramas e automações. |
| Implementar, executar, testar e corrigir o sistema. | Apoiar a investigação de erros e a revisão técnica. |
| Responder pela autoria e pela qualidade do repositório. | Atuar como ferramenta de suporte, sem responsabilidade decisória. |

As decisões registradas neste repositório só são consideradas aceitas depois de revisão e confirmação humana. Prompts ou respostas da IA, isoladamente, não constituem requisitos, evidências ou decisões arquiteturais.

## Como a modelagem será validada

A IA pode ajudar a questionar o modelo, mas não consegue validá-lo sozinha. A validação será incremental e utilizará evidências verificáveis:

1. **Coerência interna:** glossário, regras, requisitos, eventos, agregados e arquitetura devem contar a mesma história.
2. **Rastreabilidade:** decisões relevantes devem aparecer em issues, commits, ADRs ou documentos versionados.
3. **Cenários e exemplos:** fluxos principais, alternativas e casos de erro devem confirmar ou desafiar as regras propostas.
4. **Implementação:** dificuldades para expressar o domínio no código podem revelar limites incorretos ou abstrações prematuras.
5. **Testes automatizados:** invariantes e políticas importantes devem ser demonstradas por testes reproduzíveis.
6. **Revisão humana:** conclusões sugeridas pela IA devem ser analisadas criticamente e, quando necessário, confrontadas com documentação técnica e conhecimento de domínio.

## O que será observado sobre a eficácia da IA

Ao longo do projeto, o uso da IA será avaliado principalmente por sua capacidade de:

- tornar conceitos técnicos compreensíveis sem ocultar sua complexidade;
- revelar perguntas que ainda não haviam sido consideradas;
- reduzir trabalho repetitivo sem retirar o aprendizado;
- preservar consistência entre muitos artefatos relacionados;
- explicar alternativas em vez de impor uma única solução;
- reconhecer incertezas e permitir correções quando uma sugestão não se sustentar.

Também serão observados riscos como respostas convincentes, porém incorretas; excesso de arquitetura; decisões sem evidência; perda de contexto; e dependência da ferramenta para tarefas que a autora precisa aprender a executar.

## Critérios de uso responsável

- Nenhuma saída é incorporada apenas porque foi gerada pela IA.
- Decisões importantes devem possuir justificativa compreensível pela autora.
- Código gerado ou sugerido deve ser lido, executado e testado antes do commit.
- Dados pessoais, credenciais, segredos e informações confidenciais não devem ser fornecidos à ferramenta.
- O histórico do Git deve registrar a evolução real, incluindo correções e mudanças de entendimento.
- O uso da IA deve ser declarado quando relevante para avaliação acadêmica ou profissional.

## Autoria

A IA colaborou com perguntas, explicações, sugestões, revisões e automações, mas não possui autoria ou responsabilidade sobre o projeto. A seleção, adaptação e aprovação dos artefatos, bem como a futura implementação e verificação do software, são de responsabilidade de [Not Maikeise](https://github.com/notmaikeise).

Esta declaração poderá evoluir junto com o projeto para registrar exemplos concretos de acertos, limitações e correções identificados durante o desenvolvimento.

[Voltar ao Hub da documentação](README.md).
