# Yu-Gi-Oh | Jo-ken-po Edition

Jogo de jokenpo que criei para explicar conceitos de lógica de programação aplicados a jogos

conceitos abordados:

- Armazenamento e gerenciamento de estado manual
- Funções limpas
- Organização de código

## Estrutura do Projeto

```
yugioh-dio/
├── index.html              # Página principal do jogo
├── readme.md               # Este arquivo
└── src/
    ├── assets/             # Recursos visuais e de mídia
    │   ├── audios/         # Arquivos de áudio (atualmente vazio)
    │   ├── cursor/         # Arquivos de cursor personalizados
    │   ├── favicon/        # Ícone do site (favicon)
    │   ├── icons/          # Ícones do jogo (cartas, etc.)
    │   ├── rpg/            # Recursos para interface RPG
    │   └── video/          # Vídeos de fundo
    ├── scripts/           # Arquivos JavaScript
    │   └── engine.js       # Lógica principal do jogo
    └── styles/             # Arquivos CSS
        ├── buttons.css     # Estilos para botões
        ├── containers_and_frames.css  # Estilos para contêineres e molduras
        ├── main.css        # Estilos principais do layout
        └── reset.css       # Reset de estilos padrão dos navegadores
```

## Descrição dos Arquivos

### index.html
Página principal do jogo Yu-Gi-Oh Jo-ken-po. Contém:
- Estrutura básica do jogo com layout dividido em áreas do jogador e computador
- Vídeo de fundo temático
- Área de exibição da pontuação
- Seção para exibição dos detalhes da carta selecionada
- Área de campo para cartas em jogo
- Botão para próxima rodada

### src/scripts/engine.js
Arquivo principal que contém toda a lógica do jogo:
- Gerenciamento do estado do jogo (pontuação, cartas em campo, etc.)
- Definição das cartas com suas propriedades (nome, tipo, imagem, condições de vitória/derrota)
- Funções para criar e exibir cartas
- Lógica para determinar o vencedor de cada rodada
- Funções para inicializar o jogo e reiniciar duelos

### src/styles/main.css
Estilos principais que definem o layout do jogo:
- Estilização do vídeo de fundo
- Layout responsivo usando flexbox
- Estilização das áreas do jogador e computador
- Estilização da área de exibição das cartas
- Estilização da seção "versus" onde as cartas são comparadas

### src/styles/buttons.css
Estilos específicos para botões do jogo:
- Botão "GANHOU" (next-duel) com tema RPG
- Efeitos visuais para hover e click
- Estilos para diferentes tipos de botões (normal e dourado)

### src/styles/containers_and_frames.css
Estilos para contêineres e molduras:
- Estilização das áreas do jogo com bordas temáticas
- Estilos para frames que envolvem elementos do jogo
- Estilização das caixas de cartas

### src/styles/reset.css
Reset de estilos padrão dos navegadores para garantir consistência visual entre diferentes browsers.

### src/assets/
Pasta que contém todos os recursos visuais e de mídia do jogo:
- `audios/`: Pasta reservada para efeitos sonoros (atualmente vazia)
- `cursor/`: Cursores personalizados para o jogo
- `favicon/`: Ícone do site
- `icons/`: Imagens das cartas e outros ícones do jogo
- `rpg/`: Recursos gráficos para a interface RPG
- `video/`: Vídeos de fundo temáticos

## Como Jogar

1. Abra o arquivo `index.html` em um navegador web
2. Selecione uma carta clicando nela
3. O jogo comparará sua carta com uma carta aleatória do computador
4. O resultado será exibido e a pontuação atualizada
5. Clique no botão "GANHOU" para iniciar uma nova rodada

## Conceitos de Programação Abordados

### Gerenciamento de Estado
O jogo utiliza um objeto `state` para gerenciar todas as informações dinâmicas:
- Pontuação do jogador e computador
- Referências aos elementos DOM das cartas em campo
- Referências aos sprites de exibição de cartas
- Controle do botão de próxima rodada

### Funções Puras
A maioria das funções do jogo são funções puras que:
- Recebem parâmetros específicos
- Retornam resultados previsíveis
- Não causam efeitos colaterais inesperados

### Organização de Código
O código está organizado em:
- Separação clara entre estrutura (HTML), estilo (CSS) e lógica (JavaScript)
- Funções com responsabilidades únicas
- Estrutura de dados bem definida para as cartas do jogo