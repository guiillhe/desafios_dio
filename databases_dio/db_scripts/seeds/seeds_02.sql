INSERT INTO tbl_collections (collection_set_name, release_date, total_cards_in_collection) VALUES
('Jungle', '1999-06-16', 64);

INSERT INTO tbl_cards 
(card_name, hp, attack_info, attack_damage, weakness, resistance, retreat_cost, card_number_in_collection, collection_id, stage_id, pokemon_type_id) 
VALUES
(
  'Blastoise', 100, 
  'Hydro Pump: Does 40 damage plus 10 more for each Water Energy attached.', '40+', 
  'Lightning', NULL, 3, '2/102',
  1, 3, 2
),
(
  'Venusaur', 100, 
  'Solar Beam', '60', 
  'Fire', NULL, 2, '15/102',
  1, 3, 3
),
(
  'Machamp', 100, 
  'Seismic Toss', '60', 
  'Psychic', NULL, 3, '8/102',
  1, 3, 6
),
(
  'Snorlax', 90, 
  'Body Slam: Flip a coin. If heads, the Defending Pokémon is now Paralyzed.', '30', 
  'Fighting', 'Psychic', 4, '11/64',
  3, 1, 7
),
(
  'Eevee', 50,
  'Tail Wag: Flip a coin. If tails, this attack does nothing.', '10',
  'Fighting', 'Psychic', 1, '51/64',
  3, 1, 7
);