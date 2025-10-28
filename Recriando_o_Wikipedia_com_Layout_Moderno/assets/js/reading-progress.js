// Indicador de progresso de leitura
class ReadingProgress {
    constructor() {
        this.progressBar = document.querySelector('.progress-fill');
        this.progressText = document.querySelector('.progress-text');
        this.article = document.querySelector('article');
        
        if (this.progressBar && this.article) {
            this.init();
        }
    }

    init() {
        this.updateProgress();
        window.addEventListener('scroll', () => this.updateProgress());
        window.addEventListener('resize', () => this.updateProgress());
    }

    updateProgress() {
        const articleRect = this.article.getBoundingClientRect();
        const windowHeight = window.innerHeight;
        const articleHeight = this.article.offsetHeight;
        
        // Calcula o progresso baseado na posição do scroll
        const scrolled = Math.max(0, -articleRect.top);
        const maxScroll = Math.max(0, articleHeight - windowHeight);
        const progress = maxScroll > 0 ? Math.min(100, (scrolled / maxScroll) * 100) : 0;
        
        // Atualiza a barra de progresso
        this.progressBar.style.width = `${progress}%`;
        this.progressText.textContent = `${Math.round(progress)}% lido`;
        
        // Atualiza o atributo ARIA
        const progressBarContainer = this.progressBar.parentElement;
        progressBarContainer.setAttribute('aria-valuenow', Math.round(progress));
        
        // Anuncia marcos importantes
        if (progress === 100 && !this.completed) {
            this.completed = true;
            window.announceToScreenReader?.('Artigo completamente lido');
        } else if (progress >= 50 && !this.halfwayAnnounced) {
            this.halfwayAnnounced = true;
            window.announceToScreenReader?.('Metade do artigo lida');
        }
    }
}

// Smooth scroll para links âncora
class SmoothScroll {
    constructor() {
        this.init();
    }

    init() {
        const anchorLinks = document.querySelectorAll('a[href^="#"]');
        
        anchorLinks.forEach(link => {
            link.addEventListener('click', (e) => {
                const targetId = link.getAttribute('href').substring(1);
                const target = document.getElementById(targetId);
                
                if (target) {
                    e.preventDefault();
                    
                    // Smooth scroll com offset para header fixo
                    const offsetTop = target.offsetTop - 20;
                    
                    window.scrollTo({
                        top: offsetTop,
                        behavior: 'smooth'
                    });
                    
                    // Atualiza a URL
                    history.pushState(null, null, `#${targetId}`);
                }
            });
        });
    }
}

// Lazy loading para imagens (se houver)
class LazyImageLoader {
    constructor() {
        this.images = document.querySelectorAll('img[data-src]');
        this.init();
    }

    init() {
        if ('IntersectionObserver' in window) {
            this.observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        this.loadImage(entry.target);
                        this.observer.unobserve(entry.target);
                    }
                });
            });

            this.images.forEach(img => this.observer.observe(img));
        } else {
            // Fallback para navegadores sem suporte
            this.images.forEach(img => this.loadImage(img));
        }
    }

    loadImage(img) {
        img.src = img.dataset.src;
        img.removeAttribute('data-src');
        img.classList.add('loaded');
    }
}

// Inicialização
document.addEventListener('DOMContentLoaded', () => {
    new ReadingProgress();
    new SmoothScroll();
    new LazyImageLoader();
    
    // Melhoria de performance: preload de links importantes
    const importantLinks = document.querySelectorAll('a[href^="#"]');
    importantLinks.forEach(link => {
        link.addEventListener('mouseenter', () => {
            const targetId = link.getAttribute('href').substring(1);
            const target = document.getElementById(targetId);
            if (target) {
                // Preload do conteúdo da seção
                target.style.willChange = 'transform';
                setTimeout(() => {
                    target.style.willChange = 'auto';
                }, 1000);
            }
        });
    });
});

// Service Worker para cache (opcional)
if ('serviceWorker' in navigator) {
    window.addEventListener('load', () => {
        navigator.serviceWorker.register('/sw.js')
            .then(registration => {
                console.log('SW registrado com sucesso:', registration);
            })
            .catch(registrationError => {
                console.log('Falha no registro do SW:', registrationError);
            });
    });
}