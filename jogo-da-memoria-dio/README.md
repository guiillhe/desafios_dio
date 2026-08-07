# Jogo da Memória

Um jogo divertido e interativo de correspondência de cartas da memória construído com HTML, CSS e JavaScript.

## 🎮 Como Jogar

1. Clique em qualquer carta para revelar seu emoji
2. Tente encontrar dois emojis correspondentes
3. Se as cartas combinarem, elas ficarão viradas para cima
4. Se não combinarem, elas se virarão novamente
5. Continue até combinar todos os pares
6. Clique em "RESETAR JOGO" para recomeçar

## 🧠 Tecnologias Utilizadas

- **HTML5**: Estrutura e conteúdo
- **CSS3**: Estilização e animações
- **JavaScript**: Lógica do jogo e interatividade
- **Flexbox**: Design de layout
- **Variáveis CSS**: Gerenciamento de cores
- **Manipulação do DOM**: Atualizações dinâmicas de conteúdo

## 🎨 Recursos

- Design responsivo que funciona em todos os dispositivos
- Efeitos de virada de cartas animados
- Fundos gradientes coloridos
- Interface de usuário intuitiva
- Funcionalidade de reinicialização

## 📁 Estrutura do Projeto

```
├── index.html
├── src/
│   ├── scripts/
│   │   └── engine.js
│   └── styles/
│       ├── main.css
│       └── reset.css
```

## 🚀 Começando

1. Clone ou baixe este repositório
2. Abra `index.html` no seu navegador web
3. Comece a jogar!

Nenhuma configuração adicional ou dependências necessárias!

## 🎯 Lógica do Jogo

O jogo usa JavaScript para:
- Embaralhar pares de emojis aleatoriamente no início
- Rastrear cartas abertas
- Verificar correspondências
- Lidar com condições de vitória
- Gerenciar o estado do jogo

### Componentes Principais:

1. **Array de Emojis**: Contém pares de emojis que são embaralhados no início do jogo
2. **Criação de Cartas**: JavaScript cria dinamicamente elementos de cartas
3. **Manipulação de Eventos**: Eventos de clique acionam animações de virada de cartas
4. **Detecção de Correspondência**: Compara cartas abertas para encontrar correspondências
5. **Condição de Vitória**: Verifica se todos os pares foram combinados

## 🎨 Estilização

A estilização usa:
- Variáveis CSS para fácil tema de cores
- Flexbox para layout responsivo
- Transformações 3D para animações de virada de cartas
- Fundos gradientes para apelo visual
- Transições CSS para animações suaves

## 🔄 Funcionalidade de Reinicialização

O botão de reinicialização simplesmente recarrega a página, o que:
- Reembaralha todas as cartas
- Redefine o estado do jogo
- Limpa cartas combinadas

## 🎨 Paleta de Cores

O jogo usa um esquema de cores vibrante:
- Fundo Primário: `#D81159` (Rosa/Vermelho)
- Cores Gradientes: 
  - `#006BA6` (Azul)
  - `#0496FF` (Azul Claro)
  - `#FFBC42` (Laranja)
  - `#8F2D56` (Rosa Escuro)

## 🤝 Contribuindo

Sinta-se à vontade para fazer um fork deste projeto e fazer melhorias:
1. Adicionar mais pares de cartas
2. Implementar níveis de dificuldade
3. Adicionar temporizador ou contador de movimentos
4. Criar temas diferentes

## 📄 Licença

Este projeto é de código aberto e está disponível sob a Licença MIT.