# 📝 Anotações de Estudos - Semana 01

**Tema Principal:** Fundamentos de LLMs, Métrica de Custos e Engenharia de Prompt  
**Período:** Dias 1 a 7  
**Status:** [ ] Não iniciado | [x] Em andamento | [ ] Concluído  
**Andamento:** 2/7  
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

Quando trabalhamos com apis e chamadas devemos pensar além de perguntas e respostas que uma ia pode gerar, pois as apis são faturadas de uma forma simples mas que mal gerenciadas podem faer o custo variar bastante.

1. Input + output  
Input: tudo que você envia para o modelo.

* system prompt
* instruções
* histórico da conversa
* documentos/contexto
* sua pergunta

Output: tudo que o modelo gera.

Exemplo 

```
Você: 
Explique o que é Django em 500 palavras.

Output:
Django é um framework de desenvolvimento web de alto nível, escrito em Python, projetado para ajudar desenvolvedores a construir aplicações web de forma rápida, segura e escalável. Lançado como código aberto em 2005, ele segue a filosofia "batteries included" (baterias incluídas), o que significa que traz nativamente uma vasta gama de ferramentas e recursos prontos para uso, evitando que o desenvolvedor precise "reinventar a roda" a cada novo projeto.
Princípios de Design e Arquitetura

O funcionamento do Django é fundamentado em diretrizes claras de arquitetura e desenvolvimento:

    Padrão MTV (Model-Template-View): Embora seja conceitualmente similar ao padrão MVC (Model-View-Controller), o Django divide suas aplicações em:

        Model: Gerencia a estrutura de dados e as regras de negócio, conectando-se ao banco de dados via ORM.

        Template: Cuida da camada de apresentação (HTML estático e dinâmico), definindo como os dados são exibidos ao usuário.

        View: Contém a lógica de controle que processa as requisições HTTP, consulta os Models e renderiza os Templates apropriados.

    Princípio DRY (Don't Repeat Yourself): O framework incentiva a reutilização de código e a centralização de informações, reduzindo redundâncias e facilitando a manutenção do sistema.

Principais Recursos Integrados

Por vir com "baterias incluídas", o Django oferece componentes essenciais prontos para uso:

    Painel de Administração Automático: Uma interface gráfica intuitiva e gerada automaticamente a partir dos seus modelos de dados, permitindo gerenciar o conteúdo do banco sem escrever código de interface do zero.

    ORM (Object-Relational Mapping): Permite interagir com bancos de dados relacionais (como PostgreSQL, MySQL e SQLite) usando código Python puro, eliminando a necessidade de escrever consultas SQL manuais na maioria dos casos.

    Segurança Robusta: Protege por padrão contra as vulnerabilidades web mais comuns, como Cross-Site Scripting (XSS), Cross-Site Request Forgery (CSRF), injeção de SQL e clique sequestrado (clickjacking).

    Sistema de Autenticação Integrado: Gerenciamento completo de usuários, permissões, grupos e sessões pronto para uso.

    Rotas e URLs Elegantes: Um sistema flexível para definir URLs limpas e amigáveis para motores de busca (SEO).

Casos de Uso e Ecossistema

O Django é conhecido por sua versatilidade, atendendo desde startups criando seus primeiros produtos mínimos viáveis (MVPs) até grandes corporações globais. Placas de grande escala como Instagram, Spotify, Disque e Mozilla utilizam o Django para gerenciar alto tráfego e volumes massivos de dados.

Quando combinado com o ecossistema Python de ciência de dados e aprendizado de máquina, o Django torna-se uma escolha ideal para integrar modelos de IA a plataformas web interativas. Além disso, o pacote Django REST Framework (DRF) expande o framework para o desenvolvimento ágil de APIs RESTful consumidas por aplicativos móveis e front-ends modernos (como React, Vue ou Angular).

Em suma, o Django é a escolha ideal para quem busca produtividade, convenções sólidas e um ambiente seguro para transformar ideias em aplicações web completas em tempo recorde.
```
Imagine que:

input = 100 tokens
output = 500 tokens

O custo seria aproximadamente:

```
Custo = (100 × preço_input) + (500 × preço_output)
```
Normalmente input e output têm preços diferentes, e o output costuma ser mais caro.

2. Cache de prompt
Imagine um prompt com várias palavras regras e instruções que servirá de base para várias perguntas.
Sem o cache, voce pagaria pela mesma coisa repetidamente, e com o cache de prompt, uma parte é reutilizada pelo provedor.
ou seja 
```
    Contexto inicial, regras e instruçoes
              10.000 tokens
                   │
                   ▼
              Prompt cache
                   │
       ┌───────────┼───────────┐
       ▼           ▼           ▼
    chamada 1   chamada 2   chamada 3
```
Assim sendo no lugar de tratar os 10k de token da primeira chamada toda vez ele é reaproveitado para que não seja gasto todas as vezes que  uma nova chamada for feita

3. Tokens de raciocinio

Aqui é um ponto que muitas vezes não é observado na engenhharia de prompt, pois alguns modelos podem cobrar por um raciocinio interno

```
Quando voce pergunta: 

"Quanto é 12345 × 6789?"
E o modelo responde:
"o resultado da conta é 83810205"
```
Você pode pensar que o custo foi apenas do input e do output, porém quando envolve raciocinio pode ser que a cont seja um pouco diferente.

O conceito é:
```
Input : 500 tokens
  ↓
Raciocínio interno 2000 tokens
  ↓
Resposta 300 tokens
```
e voce pode pensar
> fiz 1000 chamadas de 800 tokens porque foi cobrado 2800000 tokens?

Isso acontece porque não levamos em conta os tokens de raciocinio e  somos surpreendidos pela cobrança, claro que falei de valores pequenos aqui, mas imagine isso em grande escala, onde são feitas milhoes de chamadas por dia.
então precisamos observar  todas as formas de cobrança.


```
CUSTO POR TAREFA
=
nº de chamadas
×
(
input novo
+
input cacheado
+
reasoning
+
output
)
```
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
