DROP TABLE IF EXISTS tbl_cards;
DROP TABLE IF EXISTS tbl_pokemon_types;
DROP TABLE IF EXISTS tbl_stages;
DROP TABLE IF EXISTS tbl_collections;

CREATE TABLE tbl_collections (
    id SERIAL PRIMARY KEY,
    collection_set_name VARCHAR(255) NOT NULL,
    release_date DATE,
    total_cards_in_collection INTEGER
);

CREATE TABLE tbl_pokemon_types (
    id SERIAL PRIMARY KEY,
    type_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE tbl_stages (
    id SERIAL PRIMARY KEY,
    stage_name VARCHAR(100) UNIQUE NOT NULL
);

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