# Wikipedia Melhorada 🌐

## Descrição
Projeto de reimplementação da interface da Wikipedia com foco em acessibilidade, semântica HTML5 e metodologias ágeis de desenvolvimento.

## 🎯 Objetivos
- Melhorar a acessibilidade (WCAG 2.1 AA)
- Implementar HTML5 semântico
- Criar experiência de usuário moderna
- Aplicar boas práticas de engenharia de software ágil

## 🚀 Funcionalidades
### Implementadas
- HTML5 semântico com landmarks ARIA
- CSS Grid e Flexbox responsivo
- Navegação por teclado completa
- Skip links para acessibilidade
- Indicador de progresso de leitura
- Modo escuro automático
- Service Worker para cache offline
- PWA ready



## 🛠️ Tecnologias
- HTML5 semântico
- CSS3 (Grid, Flexbox, Custom Properties)
- JavaScript ES6+

## 📁 Estrutura do Projeto
```
wikipedia-melhorada/
├── index.html
├── assets/
│   ├── css/
│   │   └── style.css
│   ├── js/
│   │   ├── accessibility.js
│   │   └── reading-progress.js
│   └── images/
│       └── wikipedia-logo-transparent.png
├── tests/
│   ├── accessibility.test.js
│   └── performance.test.js
├── sw.js
├── manifest.json
└── README.md
```

## 🔧 Instalação e Uso
### Pré-requisitos
- Navegador moderno
- Servidor HTTP local (opcional)

### Instalação
```bash
git clone https://github.com/seu-usuario/wikipedia-melhorada.git
cd wikipedia-melhorada
```

### Executar localmente
```bash
# Com Python
python -m http.server 8000

# Com Node.js
npx serve .

# Com PHP
php -S localhost:8000
```

Acesse: http://localhost:8000



## 🎨 Design System
### Cores
- Primary: #0645ad (Azul Wikipedia)
- Secondary: #0b7ec8
- Text: #222
- Background: #ffffff
- Sidebar: #f8f9fa

### Typography
- Font Family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto
- Base Size: 16px
- Line Height: 1.6

## ♿ Acessibilidade
### Recursos Implementados
- Skip links para navegação rápida
- Landmarks ARIA apropriados
- Navegação por teclado completa
- Contraste WCAG AA
- Screen reader friendly
- Focus management inteligente




## 🤝 Contribuição
### Como Contribuir
1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

### Padrões de Código
- Seguir padrões de acessibilidade WCAG 2.1
- Usar HTML5 semântico
- CSS com metodologia BEM
- JavaScript ES6+ com JSDoc
- Testes obrigatórios para novas features

## 📝 Licença
Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👥 Autores
- **Guilherme Araújo** - *Desenvolvimento inicial* - [@seu-github](https://github.com/seu-usuario)

## 🙏 Agradecimentos
- Wikipedia Foundation pela inspiração



⭐ **Se este projeto foi útil para você, considere dar uma estrela!**