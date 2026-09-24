# Uso de IA no estudo

> [!IMPORTANT]
> O ChatGPT/Codex, da OpenAI, foi usado como ferramenta de apoio ao aprendizado, à revisão e à organização. A IA não é autora do projeto, não conhece o domínio por experiência própria e não substitui validação humana.

## Por que este registro existe

O uso de IA fez parte de dois objetivos relacionados: apoiar meu estudo de modelagem de software e observar, na prática, o quanto essa tecnologia consegue contribuir para um processo de DDD.

Eu, **ANNY MAIKEISE**, queria compreender as decisões, não apenas receber documentos prontos. Por isso, o trabalho avançou por perguntas curtas, explicações de termos, comparação de alternativas e aprovação explícita das decisões antes de registrá-las.

## Como o uso evoluiu

| Momento | Como a IA apoiou | O que permaneceu humano |
| --- | --- | --- |
| Ideação | Transformou ideias gerais em perguntas sobre público, fluxo e escopo. | Escolha do produto, dos atores e do limite do MVP. |
| Regras de negócio | Sugeriu exceções, conflitos e cenários que precisavam de resposta. | Definição, revisão e aceitação das regras. |
| DDD estratégico | Explicou subdomínios, Bounded Contexts e relações do Context Map. | Delimitação dos contextos e confirmação da linguagem do projeto. |
| DDD tático | Ajudou a comparar agregados, eventos, invariantes e fronteiras transacionais. | Julgamento sobre quais alternativas representavam melhor o domínio estudado. |
| Arquitetura | Apresentou opções, padrões, custos e consequências. | Decisão pelo monólito modular com Arquitetura Hexagonal e registro da ADR. |
| Documentação | Organizou textos, tabelas, diagramas e trilhas de leitura. | Revisão do tom, da autoria, da coerência e do conteúdo publicado. |
| Backlog | Ajudou a decompor o planejamento e a automatizar a criação dos cards. | Execução dos comandos, acompanhamento dos resultados e decisão de interromper ou corrigir. |

## Onde a IA foi útil

O apoio foi especialmente valioso para:

- explicar termos técnicos em linguagem mais acessível;
- manter uma sequência de estudo sem exigir conhecimento prévio de todas as etapas;
- formular perguntas que revelaram decisões ainda implícitas;
- comparar alternativas sem esconder seus custos;
- revisar a coerência entre glossário, regras, eventos, agregados e arquitetura;
- reduzir trabalho repetitivo na documentação e no GitHub Projects.

Essa ajuda tornou o processo mais organizado e permitiu aprofundar assuntos que eu provavelmente estudaria de maneira mais fragmentada sozinha.

## Limites observados

O processo também mostrou que uma resposta bem escrita pode continuar incompleta ou errada. Algumas sugestões precisaram ser simplificadas, corrigidas ou confirmadas antes de entrar no repositório.

Na automação do backlog, por exemplo, ocorreram limite de chamadas da API, ajustes de comandos no PowerShell e uma demora do GitHub Projects para exibir cards que já haviam sido aceitos pela API. A mensagem de sucesso não comprovava, sozinha, que o resultado já estava visível. Foi necessário consultar diferentes relações da API, comparar evidências e aguardar a consistência do serviço.

Os principais cuidados aprendidos foram:

- não confundir confiança na escrita com exatidão;
- não adotar complexidade arquitetural apenas porque ela parece sofisticada;
- verificar comandos e resultados no ambiente real;
- preservar dúvidas quando não existe evidência suficiente;
- revisar o contexto, porque a IA pode esquecer, misturar ou pressupor decisões;
- tratar código, testes e conhecimento de domínio como validações que a conversa não substitui.

## Como avaliei a contribuição

Até esta pausa, a eficácia da IA foi observada por quatro critérios:

1. **Compreensão:** eu conseguia explicar a decisão depois da orientação?
2. **Coerência:** os documentos representavam a mesma linguagem e as mesmas regras?
3. **Rastreabilidade:** era possível identificar decisões, dúvidas e mudanças de entendimento?
4. **Verificação:** comandos e automações produziam o estado esperado nas ferramentas reais?

A modelagem não foi validada por uma aplicação executável, testes automatizados ou operação real, porque o código não foi iniciado. Portanto, o resultado atual demonstra organização e coerência documental, não prova definitiva de que todas as escolhas funcionarão sem revisão.

## Autoria e responsabilidade

As ideias iniciais, respostas sobre o negócio, escolhas de escopo, aprovações e decisões finais são responsabilidade de ANNY MAIKEISE. A IA contribuiu com perguntas, explicações, alternativas, redação assistida e automações.

Nenhuma resposta da IA é tratada isoladamente como requisito, referência técnica ou evidência de correção. O conteúdo publicado foi selecionado e revisado por mim, e o uso da ferramenta permanece explícito para que professoras, recrutadores e outras pessoas possam avaliar o processo com transparência.

## Estado atual

O estudo foi pausado depois da ideação, do DDD e da arquitetura inicial. Caso exista uma retomada, esta página poderá receber uma nova seção sobre o comportamento da IA durante implementação, testes e correções. Até lá, não afirmo que essas etapas aconteceram.

O contexto completo da pausa e os limites do que foi entregue estão em [Estado atual do projeto](09-project-status.md).

[Voltar ao Hub da documentação](README.md).
