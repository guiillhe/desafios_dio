INSERT INTO tbl_pokemon_types (type_name) VALUES
('Fire'),
('Water'),
('Grass'),
('Lightning'),
('Psychic'),
('Fighting'),
('Colorless'),
('Metal');

INSERT INTO tbl_stages (stage_name) VALUES
('Basic'),
('Stage 1'),
('Stage 2');

INSERT INTO tbl_collections (collection_set_name, release_date, total_cards_in_collection) VALUES
('Base Set', '1999-01-09', 102),
('Sword & Shield', '2020-02-07', 202);

INSERT INTO tbl_cards 
(card_name, hp, attack_info, attack_damage, weakness, resistance, retreat_cost, card_number_in_collection, collection_id, stage_id, pokemon_type_id) 
VALUES
(
  'Charizard', 120, 
  'Fire Spin: Discard 2 Energy cards attached to Charizard.', '100', 
  'Water', 'Fighting', 3, '4/102',
  1, 3, 1
),
(
  'Pikachu', 40, 
  'Gnaw', '10', 
  'Fighting', NULL, 1, '58/102',
  1, 1, 4
),
(
  'Mewtwo', 60, 
  'Psychic: Does 10 more damage for each Energy card attached to the Defending Pokémon.', '10+', 
  'Psychic', NULL, 2, '10/102',
  1, 1, 5
),
(
  'Zacian V', 220, 
  'Brave Blade: During your next turn, this Pokémon can''t attack.', '230', 
  'Fire', 'Grass', 2, '138/202',
  2, 1, 8
);