# 📝 Anotações de Estudos - Semana 01

**Tema Principal:** Fundamentos de LLMs, Métrica de Custos e Engenharia de Prompt  
**Período:** Dias 1 a 7  
**Status:** [ ] Não iniciado | [ ] Em andamento | [ ] Concluído  

---

## 🎯 Metas da Semana

- [x] Entender a tokenização e calcular custos de chamadas de API.
- [ ] Construir e testar System Prompts com Few-Shot Learning.
- [ ] Implementar Structured Outputs usando Pydantic e extrair dados em JSON válido.

---

## 💡 Conceitos-Chave Aprendidos

### 1. Tokens & Custos

Conceito: 
Tokenização nada mais é o processo de divisão do texto em linguagem natural para tokens, que é a linguagem que o modelo processa.
Cada chamada para o modelo, gasta uma certa quantidade de tokens a depender de qual modelo é usado, geralmente calculado em milhoes clique [aqui](https://developers.openai.com/api/docs/pricing) para ver a documentação de preços da open ai.
Tambem para dar uma reforçada no assunto eu fiz uns testes no [tokenizer](https://platform.openai.com/tokenizer), vale a pena clicar e t4estar alguns prompts ali para entender a importancia deles
- 

### 2. Engenharia de Prompt
*Diferença entre Zero-Shot e Few-Shot, técnicas para evitar alucinações.*
- 

### 3. Structured Outputs & Pydantic
*Por que forçar JSON na API e como Pydantic garante a consistência dos tipos no Python.*
- 

---

## 💻 Snippets & Comandos Úteis

```python
# Exemplo de Structured Output com Pydantic
from pydantic import BaseModel, Field

class DadosNotaFiscal(BaseModel):
    numero: str = Field(description="Número da nota fiscal")
    valor_total: float = Field(description="Valor total emitido")
    fornecedor: str = Field(description="Razão social ou nome do fornecedor")

# Seu código de chamada de API aqui
```

---

## 🐛 Desafios & Soluções (Troubleshooting)

- **Problema:** 
  - **Solução:** 

---

## 🔗 Links & Referências Rápidas

- [OpenAI Tokenizer](https://platform.openai.com/tokenizer)
- [Tik Token](https://developers.openai.com/cookbook/examples/how_to_count_tokens_with_tiktoken) - Contador de tokens gastos por frase
- Documentação do Pydantic

---

## 🏁 Autoavaliação do Marco da Semana

> **Marco:** Script Python extraindo dados via LLM e validando em schema Pydantic sem falhas.

- [ ] Marco atingido?
- **O que deu mais orgulho:** 
- **O que preciso revisar antes da Semana 2:** 
