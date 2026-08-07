# Desafio 01: Criando sua primeira Landing Page com HTML e CSS

Bem-vindo(a) ao primeiro desafio da Trilha de CSS da DIO! 

![image](https://user-images.githubusercontent.com/55519539/183538055-6cce606c-7d1d-4d15-a4be-ffeb5b37c956.png)

## 🎯 Objetivo do Projeto

O objetivo deste projeto é criar uma landing page responsiva utilizando apenas HTML e CSS, aplicando os conhecimentos adquiridos na Trilha de CSS da DIO. A página apresenta informações sobre uma trilha de aprendizado de CSS com módulos do básico ao avançado.

## 📁 Estrutura do Projeto

```
trilha-css-desafio-01/
├── index.html
├── assets/
│   ├── css/
│   │   ├── reset.css
│   │   └── styles.css
│   └── images/
│       ├── banner.png
│       ├── dio-logo.png
│       ├── logo.png
│       ├── professional-challenges.png
│       └── woman-code.png
└── README.md
```

## 🧱 Estrutura HTML

A página é estruturada da seguinte forma:

1. **`<header class="banner">`**: Seção principal com logotipo, título, descrição e botão de call-to-action
2. **`<main>`**: Conteúdo principal com três seções:
   - **`#course-content`**: Informações sobre o conteúdo do curso com módulos
   - **`#transform-world`**: Seção de destaque com fundo fixo
   - **`#professional-challenges`**: Informações sobre oportunidades profissionais
3. **`<footer>`**: Rodapé com logotipo da DIO e link para o site

## 🎨 Estilização CSS

O projeto utiliza dois arquivos CSS:

### reset.css
- Importa a fonte 'Raleway' do Google Fonts
- Reseta estilos padrão do navegador
- Define a fonte padrão e o box-sizing

### styles.css
- Estilização completa da página com tema escuro
- Gradientes e efeitos visuais
- Layout responsivo com media queries para diferentes tamanhos de tela
- Estilização específica para cada seção:
  - Banner principal com gradiente e imagem de fundo
  - Cards dos módulos do curso
  - Seção com imagem de fundo fixa
  - Seção de desafios profissionais

## 📱 Responsividade

O projeto é totalmente responsivo com três breakpoints:
- **Mobile**: até 768px
- **Tablet**: de 769px a 1024px
- **Desktop**: acima de 1025px

Cada breakpoint ajusta tamanhos de fonte, espaçamentos e layout para melhor visualização em diferentes dispositivos.

## 🚀 Como Executar

1. Faça um fork deste repositório
2. Clone o repositório para sua máquina local
3. Abra o arquivo `index.html` no seu navegador

## 🛠️ Tecnologias Utilizadas

- HTML5
- CSS3 (sem frameworks)
- Google Fonts
- Unidades relativas e absolutas (rem, px, %)
- Flexbox
- Media Queries

## 📚 O que foi aprendido

- Estruturação de páginas semânticas com HTML
- Estilização avançada com CSS
- Trabalho com gradientes, sombras e transparências
- Técnicas de layout com CSS
- Criação de layouts responsivos
- Uso de unidades de medida relativas e absolutas
- Importação e uso de fontes externas