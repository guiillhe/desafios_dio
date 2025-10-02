# Explicação do Projeto Pokedex

## Visão Geral

Este projeto é uma Pokedex interativa desenvolvida com tecnologias web fundamentais: HTML5, CSS3 e JavaScript ES6. A aplicação consome dados da PokeAPI, uma API RESTful pública que fornece informações completas sobre Pokémon. A interface apresenta uma lista de Pokémon em um layout responsivo com cards estilizados por tipo, e ao clicar em um Pokémon, o usuário pode visualizar detalhes completos como estatísticas, habilidades, altura e peso. O design utiliza CSS Grid e Flexbox para criar uma experiência adaptável a diferentes dispositivos, desde mobile até desktop.

## Arquitetura e Funcionalidades

O código é estruturado em módulos com responsabilidades separadas: o modelo `Pokemon` define a estrutura de dados, o módulo `poke-api` cuida da comunicação com a API e conversão de dados, enquanto `main.js` gerencia a lógica de interface e eventos. A paginação é implementada com botão "Load More" que carrega Pokémon sob demanda, melhorando a performance. O CSS utiliza variáveis para manter consistência nas cores por tipo de Pokémon e media queries para adaptar o layout conforme o tamanho da tela, proporcionando uma experiência otimizada em todos os dispositivos.