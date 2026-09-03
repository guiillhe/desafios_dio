# 📝 Anotações de Estudos - Semana 01

**Tema Principal:** Fundamentos de LLMs, Métrica de Custos e Engenharia de Prompt  
**Período:** Dias 1 a 7  
**Status:** [ ] Não iniciado | [ ] Em andamento | [ ] Concluído  

---

## 🎯 Metas da Semana

- [ ] Entender a tokenização e calcular custos de chamadas de API.
- [ ] Construir e testar System Prompts com Few-Shot Learning.
- [ ] Implementar Structured Outputs usando Pydantic e extrair dados em JSON válido.

---

## 💡 Conceitos-Chave Aprendidos

### 1. Tokens & Custos
*Anote aqui suas reflexões sobre a diferença de preço entre Input e Output, limites de contexto, etc.*
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
- Documentação do Pydantic

---

## 🏁 Autoavaliação do Marco da Semana

> **Marco:** Script Python extraindo dados via LLM e validando em schema Pydantic sem falhas.

- [ ] Marco atingido?
- **O que deu mais orgulho:** 
- **O que preciso revisar antes da Semana 2:** 
