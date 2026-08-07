# Projeto de Banco de Dados Oficina Mecânica

Este projeto contém arquivos que demonstram a modelagem e consulta de um banco de dados para uma oficina mecânica.

## Arquivo: oficina_queries.sql

Este arquivo contém todas as queries SQL necessárias para criar e estruturar o banco de dados de uma oficina mecânica. Ele inclui:

### Estrutura do Banco de Dados
- **Criação do banco de dados** `oficina_mecanica_db`
- **Tabelas principais**:
  - `clientes`: Armazena informações dos clientes (nome, email, CPF, endereço, etc.)
  - `veiculos`: Registra os veículos dos clientes (marca, modelo, placa, etc.)
  - `mecanicos`: Contém dados dos mecânicos (nome, especialidade, salário, etc.)
  - `servicos`: Lista os serviços oferecidos pela oficina
  - `ordens_servico`: Controla as ordens de serviço abertas
  - `itens_ordem`: Detalha os serviços em cada ordem de serviço
  - `pecas`: Cataloga as peças disponíveis em estoque
  - `pecas_ordem`: Registra as peças utilizadas em ordens de serviço

### Características
- Relacionamentos adequados entre tabelas usando chaves estrangeiras
- Dados de exemplo para demonstração
- Tipos de dados apropriados para cada campo
- Constraints para garantir integridade dos dados

## Arquivo: oficina_perguntas.md

Este arquivo contém 35 perguntas que podem ser respondidas usando o banco de dados da oficina mecânica. As perguntas estão organizadas em 6 categorias:

1. **Recuperações simples com SELECT** - Consultas básicas
2. **Filtros com WHERE** - Consultas com critérios de filtragem
3. **Atributos derivados** - Consultas que requerem cálculos
4. **Ordenações com ORDER BY** - Consultas com classificação
5. **Filtros em grupos com HAVING** - Consultas com agregações filtradas
6. **Junções entre tabelas** - Consultas complexas com relacionamentos

## Arquivo: oficina_respostas.sql

Este arquivo contém as queries SQL correspondentes para responder a todas as 35 perguntas do arquivo de perguntas.

### Objetivo
O conjunto de arquivos serve como base para praticar a escrita de consultas SQL e entender como extrair informações úteis de um banco de dados relacional no contexto de uma oficina mecânica.

## Como usar

1. Execute o arquivo `oficina_queries.sql` para criar o banco de dados
2. Use as perguntas do arquivo `oficina_perguntas.md` como base para escrever suas próprias consultas SQL
3. Verifique suas respostas comparando com as queries do arquivo `oficina_respostas.sql`

Este conjunto de arquivos é ideal para iniciantes que desejam aprender sobre modelagem de banco de dados e consultas SQL em um contexto de oficina mecânica.