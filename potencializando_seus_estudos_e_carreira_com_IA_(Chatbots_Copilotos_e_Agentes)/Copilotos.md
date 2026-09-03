# **Plano de Estudos Intensivo: Automação Inteligente com IA**

*Guia Prático de 30 Dias: Agentes de IA, n8n, Python e RAG*

# **Meu Objetivo**

Dominar a criação e orquestração de **Automações Inteligentes** utilizando **Agentes de IA**, **n8n** e **Python** em um período de 30 dias. Ao final do programa, serei capaz de desenvolver fluxos automatizados robustos, conectar IA a dados corporativos via RAG e entregar um Projeto Integrador de Portfólio pronto para ser apresentado em processos seletivos e entrevistas técnicas.

---

# **Cronograma Semanal (Semanas 1 a 4\)**

## **Semana 1: Fundamentos de LLMs, Métrica de Custos e Engenharia de Prompt**

*Foco: Entender a mecânica por trás das IAs e garantir respostas estruturadas e previsíveis.*

| Dias | Tópico Principal | Atividades Práticas |
| :---- | :---- | :---- |
| **Dias 1 a 3** | Arquitetura de LLMs, Tokens e Custos | • Testar tokenização no OpenAI Tokenizer.• Calcular custos de chamadas API (Input vs. Output Tokens).• Analisar limites de janela de contexto. |
| **Dias 4 a 5** | System Prompts & Few-Shot Prompting | • Criar personas restritivas em System Prompts.• Aplicar técnicas de Few-Shot para formatar saídas.• Implementar validações para evitar alucinações. |
| **Dias 6 a 7** | Structured Output (JSON / Pydantic) | • Forçar respostas em JSON válido.• Validar esquemas JSON via Python com Pydantic.• Extração precisa de dados a partir de textos desestruturados. |

---

## **Semana 2: Orquestração Low-Code com n8n e Integrações com IA**

*Foco: Construir fluxos de automação visual conectando APIs e os nós nativos de IA do n8n.*

| Dias | Tópico Principal | Atividades Práticas |
| :---- | :---- | :---- |
| **Dias 8 a 10** | Fundamentos e Arquitetura do n8n | • Instalar o n8n via Docker ou utilizar conta Cloud.• Criar fluxos com Webhooks, HTTP Requests e manipuladores JSON.• Tratar erros e reexecuções automáticas no n8n. |
| **Dias 11 a 12** | Nós de IA e LangChain no n8n | • Configurar o nó *AI Agent* do n8n.• Conectar provedores LLM (OpenAI, Anthropic, Gemini).• Criar *Tools* customizadas no n8n (HTTP & Code Nodes). |
| **Dias 13 a 14** | Agente de Automação Visual | • Construir um agente no n8n que lê um formulário/e-mail e decide qual ação tomar em uma planilha ou banco de dados. |

---

## **Semana 3: Agentes de IA com Python e RAG Básico**

*Foco: Programar agentes autônomos via código e dar memória ao sistema com base em documentos.*

| Dias | Tópico Principal | Atividades Práticas |
| :---- | :---- | :---- |
| **Dias 15 a 17** | Agentes em Python (OpenAI SDK & LangGraph) | • Implementar *Function Calling* nativo com a API da OpenAI.• Criar fluxos de decisão baseados em estados com LangGraph.• Adicionar loops de retentativa e memória de conversa (*Short-term Memory*). |
| **Dias 18 a 20** | RAG Básico (Retrieval-Augmented Generation) | • Entender o conceito de Embeddings e distância vetorial.• Indexar arquivos (PDFs/CSVs) em um Banco Vetorial (ChromaDB ou Qdrant).• Conectar a busca vetorial como *Tool* do Agente de IA. |
| **Dias 21** | Teste e Avaliação de Respostas | • Comparar respostas do modelo com e sem contexto do RAG.• Avaliar precisão do agente e tempo de resposta. |

---

## **Semana 4: Projeto Integrador de Portfólio & Preparação Técnica**

*Foco: Desenvolver o case final unindo n8n \+ Python \+ IA e preparar o discurso de entrevista.*

| Dias | Tópico Principal | Atividades Práticas |
| :---- | :---- | :---- |
| **Dias 22 a 25** | Desenvolvimento do Projeto Integrador | • **Opção escolhida:** Triagem Inteligente de E-mails e Extração de Notas Fiscais.• Fluxo: E-mail recebido → Webhook n8n → Script Python extrai PDF → Agente RAG classifica e valida → Gravação no banco e alerta no Slack/WhatsApp. |
| **Dias 26 a 27** | Refatoração e Tratamento de Exceções | • Garantir falha segura (*fallback*) caso a API da IA caia.• Otimizar prompts para reduzir tempo de execução e consumo de tokens. |
| **Dias 28 a 30** | Documentação, GitHub e Pitch de Entrevista | • Criar um README profissional com diagrama de arquitetura.• Gravar uma demonstração de 2 minutos do fluxo funcionando.• Escrever o roteiro de apresentação do case focado em **Impacto de Negócio** (redução de tempo/custo). |

---

# **Materiais e Referências Recomendados**

## **Plataformas de Ensino e Cursos**

* **DIO (Digital Innovation One):**  
  * *Bootcamps de Python & IA Generativa:* Foco na sintaxe do Python, integração de APIs e fundamentos de Machine Learning.  
  * *Cursos de Engenharia de Prompt e Azure OpenAI:* Ótimos para entender padrões enterprise de adoção de IA.  
* **DeepLearning.AI (Short Courses):**  
  * *AI Agents in LangGraph* (Gratuito)  
  * *Building Systems with the ChatGPT API* (Gratuito)  
  * *Functions, Tools and Agents with LangChain* (Gratuito)

## **Documentações Oficiais (Leitura Obrigatória)**

* **n8n AI Documentation:** Guias práticos sobre a utilização dos nós da biblioteca LangChain dentro do n8n.  
* **OpenAI API & Agents SDK Docs:** Referência técnica sobre *Function Calling*, *Structured Outputs* e gerenciamento de contexto.  
* **LangGraph Documentation:** Guia definitivo para criação de agentes estocásticos e determinísticos em ciclo.  
* **ChromaDB / Qdrant Docs:** Documentação para criação e consulta de bancos de dados vetoriais.

## **Canais e Comunidades no Web**

* **YouTube \- Cole Medin / Brandon Hancock:** Tutoriais práticos focados na arquitetura de Agentes de IA com LangGraph, CrewAI e n8n.  
* **Comunidade n8n (Forum & Discord):** Exemplos de fluxos prontos (*workflows*) criados pela comunidade para casos de uso reais.  
* **GitHub Repositories:** Buscar por repositórios com o tópico `n8n-workflows`, `langgraph-python` e `rag-boilerplate`.

