# Pokemon TCG Database

Este projeto contém scripts SQL para criar e popular um banco de dados de cartas de Pokemon Trading Card Game (TCG).

## Estrutura do Banco de Dados

O banco de dados é composto por quatro tabelas principais:

### 1. tbl_collections
Armazena informações sobre os conjuntos de cartas (collections) do Pokemon TCG.

```sql
CREATE TABLE tbl_collections (
    id SERIAL PRIMARY KEY,
    collection_set_name VARCHAR(255) NOT NULL,
    release_date DATE,
    total_cards_in_collection INTEGER
);
```

### 2. tbl_pokemon_types
Armazena os tipos de Pokemon (ex: Fire, Water, Grass, etc.).

```sql
CREATE TABLE tbl_pokemon_types (
    id SERIAL PRIMARY KEY,
    type_name VARCHAR(100) UNIQUE NOT NULL
);
```

### 3. tbl_stages
Armazena os estágios de evolução dos Pokemons (Basic, Stage 1, Stage 2).

```sql
CREATE TABLE tbl_stages (
    id SERIAL PRIMARY KEY,
    stage_name VARCHAR(100) UNIQUE NOT NULL
);
```

### 4. tbl_cards
Armazena informações detalhadas sobre as cartas individuais.

```sql
CREATE TABLE tbl_cards (
    id SERIAL PRIMARY KEY,
    card_name VARCHAR(255) NOT NULL,
    hp INTEGER,
    attack_info TEXT,
    attack_damage VARCHAR(20),
    weakness VARCHAR(100),
    resistance VARCHAR(100),
    retreat_cost INTEGER,
    card_number_in_collection VARCHAR(20),
    
    collection_id INTEGER,
    stage_id INTEGER,
    pokemon_type_id INTEGER,

    CONSTRAINT fk_collection
      FOREIGN KEY(collection_id) 
      REFERENCES tbl_collections(id)
      ON DELETE SET NULL,
      
    CONSTRAINT fk_stage
      FOREIGN KEY(stage_id)
      REFERENCES tbl_stages(id)
      ON DELETE SET NULL,

    CONSTRAINT fk_pokemon_type
      FOREIGN KEY(pokemon_type_id)
      REFERENCES tbl_pokemon_types(id)
      ON DELETE SET NULL
);
```

## Relacionamentos

- `tbl_cards` se relaciona com `tbl_collections` através da chave estrangeira `collection_id`
- `tbl_cards` se relaciona com `tbl_stages` através da chave estrangeira `stage_id`
- `tbl_cards` se relaciona com `tbl_pokemon_types` através da chave estrangeira `pokemon_type_id`

## Scripts Disponíveis

### Criação de Tabelas
O arquivo `db_scripts/tables/create_tables.sql` contém os comandos para criar todas as tabelas necessárias.

### Seeds (Dados de Exemplo)
O projeto inclui dados de exemplo em três arquivos de seeds:

1. `db_scripts/seeds/seeds.sql` - Contém dados para as tabelas de tipos, estágios, coleções e algumas cartas principais
2. `db_scripts/seeds/seeds_02.sql` - Contém dados adicionais para a coleção Jungle e mais cartas
3. `db_scripts/seeds/seeds_03.sql` - Contém dados para 50 cartas adicionais de diferentes Pokemons

## Prompts Utilizados

### Prompt para Criação de Tabelas
O arquivo `prompts/tcg-cards.txt` contém o prompt inicial usado para gerar o script de criação das tabelas:

```
[action]
create a script to create a database for trading card game cards, in postgree sql

[context]
-the first table is a table to save a pokemon tcg cards
- the secnd table is a table is a table to save collection set

connect the two tables using a foreign key relationship


[informação]
first table: tbl_cards
-id
-hp
-name
- stage
- type stage
-informaçãoatttack
-damage
-weak
-ressis
-retreat
- cardNumberInCollection


second table: tbl_collections
-id
-coolectionSetName
-releasedata
-totalCardsInCollection
```

### Prompt para Criação de Seeds
O arquivo `prompts/create_seeds.txt` contém o prompt usado para gerar os dados de exemplo:

```
[action]
create intial seeds with tcg pokemon cards

[context]
generate sql inserts 

[information]
with my sql generatade before
```

## Como Usar

1. Execute o script `db_scripts/tables/create_tables.sql` para criar as tabelas
2. Execute os scripts de seeds na ordem:
   - `db_scripts/seeds/seeds.sql`
   - `db_scripts/seeds/seeds_02.sql`
   - `db_scripts/seeds/seeds_03.sql`

## Exemplos de Consultas

Para obter informações das cartas juntamente com seus conjuntos:

```sql
SELECT c.card_name, c.hp, c.attack_info, col.collection_set_name
FROM tbl_cards c
JOIN tbl_collections col ON c.collection_id = col.id;
```