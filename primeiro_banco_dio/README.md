# Projeto de Banco de Dados E-commerce

Este projeto contém dois arquivos principais que trabalham juntos para demonstrar a modelagem e consulta de um banco de dados de e-commerce.

## Arquivo: ecommerce_queries.sql

Este arquivo contém todas as queries SQL necessárias para criar e estruturar o banco de dados de um sistema de e-commerce. Ele inclui:

### Estrutura do Banco de Dados
- **Criação do banco de dados** `ecommerce_db`
- **Tabelas principais**:
  - `clientes`: Armazena informações completas dos clientes (nome, email, CPF, endereço, etc.)
  - `categorias`: Classifica os produtos em diferentes categorias
  - `produtos`: Contém os detalhes dos produtos (nome, preço, estoque, categoria)
  - `pedidos`: Registra as transações de compra dos clientes
  - `itens_pedido`: Detalha os produtos em cada pedido

### Características
- Relacionamentos adequados entre tabelas usando chaves estrangeiras
- Dados de exemplo para demonstração
- Tipos de dados apropriados para cada campo
- Constraints para garantir integridade dos dados

## Arquivo: ecommerce_perguntas.md

Este arquivo contém 35 perguntas que podem ser respondidas usando o banco de dados de e-commerce. As perguntas estão organizadas em 6 categorias:

1. **Recuperações simples com SELECT** - Consultas básicas
2. **Filtros com WHERE** - Consultas com critérios de filtragem
3. **Atributos derivados** - Consultas que requerem cálculos
4. **Ordenações com ORDER BY** - Consultas com classificação
5. **Filtros em grupos com HAVING** - Consultas com agregações filtradas
6. **Junções entre tabelas** - Consultas complexas com relacionamentos

### Objetivo
O arquivo serve como base para praticar a escrita de consultas SQL e entender como extrair informações úteis de um banco de dados relacional.

## Como usar

1. Execute o arquivo `ecommerce_queries.sql` para criar o banco de dados
2. Use as perguntas do arquivo `ecommerce_perguntas.md` como base para escrever suas próprias consultas SQL
3. Verifique suas respostas comparando com as queries do arquivo `ecommerce_respostas.sql` (se disponível)

Este conjunto de arquivos é ideal para iniciantes que desejam aprender sobre modelagem de banco de dados e consultas SQL em um contexto de e-commerce.