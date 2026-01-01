// Intersection Observer for scroll animations
class ScrollAnimations {
    constructor() {
        this.observerOptions = {
            root: null,
            rootMargin: '0px',
            threshold: 0.1
        };
        
        this.init();
    }
    
    init() {
        this.createObserver();
        this.setupScrollProgress();
        this.setupParallax();
    }
    
    createObserver() {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    this.animateElement(entry.target);
                    observer.unobserve(entry.target);
                }
            });
        }, this.observerOptions);
        
        // Observe all animatable elements
        document.querySelectorAll('.fade-in, .slide-in, .card-3d').forEach(el => {
            observer.observe(el);
        });
    }
    
    animateElement(element) {
        if (element.classList.contains('fade-in')) {
            element.style.animationDelay = (Math.random() * 0.5) + 's';
        } else if (element.classList.contains('slide-in')) {
            const direction = element.dataset.direction || 'left';
            element.style.animationDelay = (Math.random() * 0.3) + 's';
        }
        
        // Add specific class based on position
        const rect = element.getBoundingClientRect();
        if (rect.top < window.innerHeight / 2) {
            element.classList.add('animate-from-top');
        } else {
            element.classList.add('animate-from-bottom');
        }
    }
    
    setupScrollProgress() {
        const loadingBar = document.querySelector('.loading-bar');
        if (!loadingBar) return;
        
        window.addEventListener('scroll', () => {
            const winScroll = document.body.scrollTop || document.documentElement.scrollTop;
            const height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            const scrolled = (winScroll / height) * 100;
            loadingBar.style.width = scrolled + '%';
        });
    }
    
    setupParallax() {
        const parallaxElements = document.querySelectorAll('.parallax-section');
        
        window.addEventListener('scroll', () => {
            const scrolled = window.pageYOffset;
            
            parallaxElements.forEach(element => {
                const rate = element.dataset.rate || 0.5;
                const yPos = -(scrolled * rate);
                element.style.transform = `translate3d(0, ${yPos}px, 0)`;
            });
        });
    }
}

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    new ScrollAnimations();
});