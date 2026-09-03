# 📅 Cronograma Semanal Detalhado (30 Dias)

## Semana 1: Fundamentos de LLMs, Métrica de Custos e Engenharia de Prompt
**Foco:** Entender a mecânica por trás das IAs e garantir respostas estruturadas e previsíveis.

| Período | Tópico Principal | Atividades Práticas |
| :--- | :--- | :--- |
| **Dias 1 a 3** | Arquitetura de LLMs, Tokens e Custos | • Testar tokenização no OpenAI Tokenizer.<br>• Calcular custos de chamadas API (Input vs. Output Tokens).<br>• Analisar limites de janela de contexto. |
| **Dias 4 a 5** | System Prompts & Few-Shot Prompting | • Criar personas restritivas em System Prompts.<br>• Aplicar técnicas de Few-Shot para formatar saídas.<br>• Implementar validações para evitar alucinações. |
| **Dias 6 a 7** | Structured Output (JSON / Pydantic) | • Forçar respostas em JSON válido.<br>• Validar esquemas JSON via Python com Pydantic.<br>• Extração precisa de dados a partir de textos desestruturados. |

> 🎯 **Marco da Semana 1:** Ter um script em Python que recebe um texto livre, extrai os dados via LLM e valida diretamente em um schema Pydantic com 100% de previsibilidade.

---

## Semana 2: Orquestração Low-Code com n8n e Integrações com IA
**Foco:** Construir fluxos de automação visual conectando APIs e os nós nativos de IA do n8n.

| Período | Tópico Principal | Atividades Práticas |
| :--- | :--- | :--- |
| **Dias 8 a 10** | Fundamentos e Arquitetura do n8n | • Instalar o n8n via Docker ou utilizar conta Cloud.<br>• Criar fluxos com Webhooks, HTTP Requests e manipuladores JSON.<br>• Tratar erros e reexecuções automáticas no n8n. |
| **Dias 11 a 12** | Nós de IA e LangChain no n8n | • Configurar o nó AI Agent do n8n.<br>• Conectar provedores LLM (OpenAI, Anthropic, Gemini).<br>• Criar Tools customizadas no n8n (HTTP & Code Nodes). |
| **Dias 13 a 14** | Agente de Automação Visual | • Construir um agente no n8n que lê um formulário/e-mail e decide qual ação tomar em uma planilha ou banco de dados. |

> 🎯 **Marco da Semana 2:** Um fluxo n8n ativo capaz de receber requisições externas e delegar decisões para um nó de AI Agent autônomo com ferramentas conectadas.

---

## Semana 3: Agentes de IA com Python e RAG Básico
**Foco:** Programar agentes autônomos via código e dar memória ao sistema com base em documentos.

| Período | Tópico Principal | Atividades Práticas |
| :--- | :--- | :--- |
| **Dias 15 a 17** | Agentes em Python (OpenAI SDK & LangGraph) | • Implementar Function Calling nativo com a API da OpenAI.<br>• Criar fluxos de decisão baseados em estados com LangGraph.<br>• Adicionar loops de retentativa e memória de conversa (Short-term Memory). |
| **Dias 18 a 20** | RAG Básico (Retrieval-Augmented Generation) | • Entender o conceito de Embeddings e distância vetorial.<br>• Indexar arquivos (PDFs/CSVs) em um Banco Vetorial (ChromaDB ou Qdrant).<br>• Conectar a busca vetorial como Tool do Agente de IA. |
| **Dia 21** | Teste e Avaliação de Respostas | • Comparar respostas do modelo com e sem contexto do RAG.<br>• Avaliar precisão do agente e tempo de resposta. |

> 🎯 **Marco da Semana 3:** Um agente em LangGraph capaz de consultar uma base vetorial local (ChromaDB) e responder perguntas técnicas fundamentadas em PDFs/documentos.

---

## Semana 4: Projeto Integrador de Portfólio & Preparação Técnica
**Foco:** Desenvolver o case final unindo n8n + Python + IA e preparar o discurso de entrevista.

| Período | Tópico Principal | Atividades Práticas |
| :--- | :--- | :--- |
| **Dias 22 a 25** | Desenvolvimento do Projeto Integrador | • **Opção escolhida:** Triagem Inteligente de E-mails e Extração de Notas Fiscais.<br>• **Fluxo:** E-mail recebido ➔ Webhook n8n ➔ Script Python extrai PDF ➔ Agente RAG classifica e valida ➔ Gravação no banco e alerta no Slack/WhatsApp. |
| **Dias 26 a 27** | Refatoração e Tratamento de Exceções | • Garantir falha segura (fallback) caso a API da IA caia.<br>• Otimizar prompts para reduzir tempo de execução e consumo de tokens. |
| **Dias 28 a 30** | Documentação, GitHub e Pitch de Entrevista | • Criar um README profissional com diagrama de arquitetura.<br>• Gravar uma demonstração de 2 minutos do fluxo funcionando.<br>• Escrever o roteiro de apresentação do case focado em Impacto de Negócio (redução de tempo/custo). |

> 🎯 **Marco da Semana 4:** Projeto publicado no GitHub com README impecável, vídeo de demonstração gravado e discurso de impacto afinado para entrevistas técnicas.
