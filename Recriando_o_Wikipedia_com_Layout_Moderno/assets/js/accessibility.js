// Funcionalidades de acessibilidade
class AccessibilityEnhancer {
    constructor() {
        this.init();
    }

    init() {
        this.setupKeyboardNavigation();
        this.setupFocusManagement();
        this.setupARIALiveRegions();
        this.setupSkipLinks();
    }

    setupKeyboardNavigation() {
        // Navegação por teclado melhorada
        document.addEventListener('keydown', (e) => {
            // Alt + M para menu principal
            if (e.altKey && e.key === 'm') {
                e.preventDefault();
                const mainNav = document.querySelector('.main-nav a');
                if (mainNav) mainNav.focus();
            }

            // Alt + C para conteúdo principal
            if (e.altKey && e.key === 'c') {
                e.preventDefault();
                const mainContent = document.querySelector('#main-content');
                if (mainContent) mainContent.focus();
            }

            // Alt + S para sidebar
            if (e.altKey && e.key === 's') {
                e.preventDefault();
                const sidebar = document.querySelector('.sidebar a');
                if (sidebar) sidebar.focus();
            }
        });
    }

    setupFocusManagement() {
        // Gerenciamento de foco para links âncora
        const anchorLinks = document.querySelectorAll('a[href^="#"]');
        
        anchorLinks.forEach(link => {
            link.addEventListener('click', (e) => {
                const targetId = link.getAttribute('href').substring(1);
                const target = document.getElementById(targetId);
                
                if (target) {
                    // Torna o elemento focável temporariamente
                    target.setAttribute('tabindex', '-1');
                    target.focus();
                    
                    // Remove o tabindex após o foco
                    target.addEventListener('blur', () => {
                        target.removeAttribute('tabindex');
                    }, { once: true });
                }
            });
        });
    }

    setupARIALiveRegions() {
        // Cria região live para anúncios
        const liveRegion = document.createElement('div');
        liveRegion.setAttribute('aria-live', 'polite');
        liveRegion.setAttribute('aria-atomic', 'true');
        liveRegion.className = 'sr-only';
        liveRegion.style.cssText = `
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            white-space: nowrap;
            border: 0;
        `;
        document.body.appendChild(liveRegion);

        // Função global para anúncios
        window.announceToScreenReader = (message) => {
            liveRegion.textContent = message;
            setTimeout(() => {
                liveRegion.textContent = '';
            }, 1000);
        };
    }

    setupSkipLinks() {
        // Melhora os skip links
        const skipLinks = document.querySelectorAll('.skip-link');
        
        skipLinks.forEach(link => {
            link.addEventListener('click', (e) => {
                const targetId = link.getAttribute('href').substring(1);
                const target = document.getElementById(targetId);
                
                if (target) {
                    target.setAttribute('tabindex', '-1');
                    target.focus();
                    window.announceToScreenReader('Navegou para o conteúdo principal');
                }
            });
        });
    }
}

// Inicializa quando o DOM estiver pronto
document.addEventListener('DOMContentLoaded', () => {
    new AccessibilityEnhancer();
});