# Pokedex

Uma aplicação web interativa que exibe informações detalhadas sobre Pokémon, consumindo dados da PokeAPI.

## 🚀 Visão Geral

Este projeto é uma Pokedex desenvolvida com tecnologias web modernas que permite aos usuários:
- Visualizar uma lista de Pokémon com paginação
- Ver detalhes específicos de cada Pokémon selecionado
- Navegar através de diferentes Pokémon com uma interface intuitiva

## 🛠️ Tecnologias Utilizadas

- **HTML5**: Estrutura semântica da aplicação
- **CSS3**: Estilização e layout responsivo
- **JavaScript (ES6+)**: Lógica da aplicação e interatividade
- **PokeAPI**: Fonte de dados para informações dos Pokémon
- **Fetch API**: Para requisições HTTP assíncronas
- **Promises**: Para tratamento de operações assíncronas

## 📁 Estrutura do Projeto

```
pokedex/
├── index.html
├── assets/
│   ├── css/
│   │   ├── global.css
│   │   └── pokedex.css
│   └── js/
│       ├── main.js
│       ├── poke-api.js
│       └── pokemon-model.js
└── README.md
```

## 📄 Arquivos Principais

### `index.html`
Página principal da aplicação contendo:
- Estrutura básica da Pokedex
- Container para a lista de Pokémon
- Área de detalhes do Pokémon selecionado
- Botão para carregar mais Pokémon

### `assets/css/global.css`
Estilos globais da aplicação:
- Reset de estilos padrão
- Tipografia
- Estilos base para elementos comuns

### `assets/css/pokedex.css`
Estilos específicos da Pokedex:
- Layout responsivo com grid e flexbox
- Design de cards para Pokémon
- Estilização por tipo de Pokémon (cores específicas)
- Animações e transições
- Media queries para diferentes tamanhos de tela

### `assets/js/pokemon-model.js`
Definição da classe `Pokemon`:
- Estrutura de dados para representar um Pokémon
- Propriedades: número, nome, tipo, tipos, foto, altura, peso, habilidades e estatísticas

### `assets/js/poke-api.js`
Integração com a PokeAPI:
- Funções para buscar dados de Pokémon
- Conversão de dados da API para objetos `Pokemon`
- Tratamento de paginação
- Manipulação de Promises para operações assíncronas

### `assets/js/main.js`
Lógica principal da aplicação:
- Renderização da lista de Pokémon
- Manipulação de eventos de clique
- Exibição de detalhes do Pokémon selecionado
- Controle de paginação

## 🎨 Funcionalidades

### Lista de Pokémon
- Exibição em formato de grid responsivo
- Cards com informações básicas (número, nome, tipo, imagem)
- Cores diferenciadas por tipo de Pokémon
- Efeitos de hover para melhor experiência do usuário

### Detalhes do Pokémon
- Visualização expandida ao selecionar um Pokémon
- Informações detalhadas:
  - Imagem em alta resolução
  - Tipo(s) e número
  - Altura e peso
  - Habilidades
  - Estatísticas (HP, Ataque, Defesa, etc.) com barras de progresso

### Paginação
- Carregamento progressivo de Pokémon
- Botão "Load More" para carregar mais itens
- Limite configurável de registros

## 📱 Responsividade

O layout é totalmente responsivo e se adapta a diferentes dispositivos:
- **Mobile**: Layout em coluna única
- **Tablet**: Grid com 2 colunas
- **Desktop**: Grid com múltiplas colunas e layout otimizado

## 🌐 Integração com PokeAPI

O projeto consome dados diretamente da [PokeAPI](https://pokeapi.co/), uma API RESTful gratuita com informações completas sobre Pokémon, incluindo:
- Dados básicos (nome, tipo, número)
- Imagens oficiais
- Estatísticas e habilidades
- Informações de altura e peso

## 🚀 Como Executar

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/pokedex.git
   ```

2. Navegue até o diretório do projeto:
   ```bash
   cd pokedex
   ```

3. Abra o arquivo `index.html` no seu navegador preferido

## 🤝 Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para:
1. Abrir issues para reportar bugs ou sugerir melhorias
2. Enviar pull requests com correções ou novas funcionalidades
3. Melhorar a documentação

## 📝 Licença

Este projeto é desenvolvido para fins educacionais e não possui licença específica.

## 💡 Aprendizado

Este projeto demonstra conhecimentos em:
- Desenvolvimento web front-end
- Integração com APIs REST
- Manipulação de DOM com JavaScript
- CSS Grid e Flexbox
- Design responsivo
- Padrões de projeto (Model, API integration)
- Tratamento de dados assíncronos

## 🙏 Agradecimentos

- [PokeAPI](https://pokeapi.co/) pela disponibilização gratuita dos dados
- [DIO](https://web.dio.me/) pelo programa de aceleração e conhecimento compartilhado