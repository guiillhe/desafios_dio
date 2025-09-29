# Detona Ralph - Jogo em JavaScript

Bem-vindo ao **Detona Ralph**, um jogo divertido baseado em navegador no estilo Whack-a-Mole inspirado no filme popular. Este projeto demonstra técnicas fundamentais de desenvolvimento de jogos usando tecnologias web.

## 🎮 Visual do Jogo

Experimente a emoção de acertar o Ralph enquanto ele aparece aleatoriamente em diferentes buracos! Teste seus reflexos e busque a maior pontuação possível.

## 🛠️ Tecnologias Utilizadas

- **HTML5**: Para a estrutura e layout básico do jogo
- **CSS3**: Para estilização, animações e design responsivo
- **JavaScript**: Para lógica do jogo, interatividade e gerenciamento de estado
- **Flexbox**: Para design de layout responsivo
- **Manipulação de Eventos**: Para interações do usuário e controles do jogo

## 🎯 Recursos do Jogo

- **Gameplay Whack-a-Mole**: Clique no Ralph quando ele aparecer para marcar pontos
- **Acompanhamento de Pontuação**: Exibição de pontuação em tempo real
- **Contador Regressivo**: Temporizador de 60 segundos para desafio adicional
- **Movimento Dinâmico do Inimigo**: Ralph aparece aleatoriamente em diferentes quadrados
- **Efeitos Sonoros**: Feedback sonoro para acertos bem-sucedidos
- **Detecção de Fim de Jogo**: Fim automático do jogo quando o tempo acabar
- **Design Responsivo**: Funciona em diferentes tamanhos de tela

## 📁 Estrutura do Projeto

```
├── index.html              # Arquivo HTML principal
├── src/
│   ├── images/             # Recursos do jogo
│   │   ├── favicon.jpg     # Favicon
│   │   ├── player.png      # Imagem do jogador
│   │   ├── ralph.png       # Personagem inimigo
│   │   └── wall.png        # Imagem de fundo
│   ├── audios/             # Efeitos sonoros
│   │   └── hit.m4a         # Som de acerto
│   ├── styles/             # Arquivos CSS
│   │   ├── main.css        # Folha de estilo principal
│   │   └── reset.css       # Reset CSS
│   └── scripts/            # Arquivos JavaScript
│       └── engine.js       # Lógica do jogo
└── README.md
```

## ▶️ Como Jogar

1. Abra `index.html` no seu navegador preferido
2. O jogo inicia automaticamente com um temporizador regressivo de 60 segundos
3. Clique no Ralph quando ele aparecer em qualquer um dos quadrados 3x3
4. Cada acerto bem-sucedido vale 1 ponto
5. Tente marcar o máximo de pontos possível antes do tempo acabar
6. Quando o temporizador chegar a zero, o jogo termina e sua pontuação final é exibida

## 🎨 Componentes do Jogo

### Estrutura HTML
- Container principal com menu e painel do jogo
- Grade 3x3 de quadrados interativos (9 quadrados no total)
- Exibição de pontuação e temporizador na seção do menu
- Indicador de vidas com imagem do jogador

### Estilização CSS
- Tabuleiro do jogo com fundo de parede de tijolos
- Sprite do personagem Ralph usando imagens de fundo
- Layout responsivo usando Flexbox
- Fontes personalizadas para aparência retrô de jogo
- Estilização visual para elementos do jogo

### Funcionalidade JavaScript
- Gerenciamento de estado do jogo com abordagem orientada a objetos
- Lógica de movimento do inimigo com seleção aleatória de quadrados
- Cálculo de pontuação e atualizações em tempo real
- Sistema de contagem regressiva
- Listeners de eventos para interações do usuário
- Reprodução de áudio para feedback de acerto
- Funções de inicialização e reinício do jogo

## 🚀 Como Começar

1. Clone ou baixe este repositório
2. Abra `index.html` no seu navegador preferido
3. O jogo inicia automaticamente - nenhuma configuração adicional é necessária!

## 📱 Compatibilidade de Navegadores

- Chrome (recomendado)
- Firefox
- Safari
- Edge

## 🎮 Mecânicas do Jogo

1. **Movimento do Inimigo**: Ralph aparece aleatoriamente em diferentes quadrados a cada segundo
2. **Pontuação**: Clicar no Ralph quando ele está visível concede 1 ponto
3. **Tempo**: O jogo dura 60 segundos
4. **Fim do Jogo**: Quando o tempo acabar, um alerta mostra sua pontuação final

## 🤝 Contribuindo

Sinta-se à vontade para fazer um fork deste projeto e enviar pull requests com melhorias. Algumas ideias para aprimoramentos:
- Múltiplos níveis de dificuldade
- Acompanhamento de pontuação máxima com localStorage
- Personagens e temas adicionais
- Poderes e bônus
- Otimização para toque em dispositivos móveis
- Gráficos e animações aprimorados
- Opção de ativar/desativar som

## 📄 Licença

Este projeto é de código aberto e disponível sob a [Licença MIT](LICENSE).

## 👤 Autor

Jogo desenvolvido como parte do currículo de aprendizado de JavaScript.

---
**Divirta-se com o jogo e bons acertos no Ralph!** 🕹️