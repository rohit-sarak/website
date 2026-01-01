/**
 * Smooth Scroll Implementation
 * Custom smooth scrolling without libraries
 */

class SmoothScroll {
    constructor() {
        this.scrollToLinks = document.querySelectorAll('a[href^="#"]:not([href="#"])');
        this.scrollDuration = 800;
        this.easing = this.easeInOutCubic;
        this.isScrolling = false;
        this.scrollPosition = 0;
        
        this.init();
    }
    
    init() {
        this.setupEventListeners();
        this.setupScrollProgress();
        this.setupKeyboardNavigation();
    }
    
    setupEventListeners() {
        // Handle anchor link clicks
        this.scrollToLinks.forEach(link => {
            link.addEventListener('click', (e) => {
                e.preventDefault();
                const targetId = link.getAttribute('href');
                this.scrollTo(targetId);
            });
        });
        
        // Handle window hash changes
        window.addEventListener('hashchange', () => {
            if (window.location.hash) {
                this.scrollTo(window.location.hash, false);
            }
        });
        
        // Handle initial hash
        if (window.location.hash) {
            setTimeout(() => {
                this.scrollTo(window.location.hash, false);
            }, 100);
        }
    }
    
    scrollTo(target, updateHash = true) {
        if (this.isScrolling) return;
        
        const targetElement = document.querySelector(target);
        if (!targetElement) return;
        
        const targetPosition = this.getTargetPosition(targetElement);
        const startPosition = window.pageYOffset;
        const distance = targetPosition - startPosition;
        const startTime = performance.now();
        
        if (updateHash) {
            history.pushState(null, null, target);
        }
        
        this.isScrolling = true;
        
        const scrollAnimation = (currentTime) => {
            const timeElapsed = currentTime - startTime;
            const progress = Math.min(timeElapsed / this.scrollDuration, 1);
            const easeProgress = this.easing(progress);
            
            window.scrollTo(0, startPosition + (distance * easeProgress));
            
            if (timeElapsed < this.scrollDuration) {
                requestAnimationFrame(scrollAnimation);
            } else {
                this.isScrolling = false;
                this.scrollComplete(targetElement);
            }
        };
        
        requestAnimationFrame(scrollAnimation);
    }
    
    getTargetPosition(element) {
        const elementRect = element.getBoundingClientRect();
        const elementPosition = elementRect.top + window.pageYOffset;
        const offset = this.calculateOffset(element);
        
        return elementPosition - offset;
    }
    
    calculateOffset(element) {
        const header = document.querySelector('.header');
        let offset = 80; // Default offset
        
        if (header) {
            const headerHeight = header.offsetHeight;
            offset = header.classList.contains('scrolled') ? headerHeight + 20 : headerHeight + 40;
        }
        
        // Additional offset for specific sections
        if (element.classList.contains('has-offset')) {
            offset += 40;
        }
        
        return offset;
    }
    
    scrollComplete(targetElement) {
        // Focus the target element for accessibility
        targetElement.setAttribute('tabindex', '-1');
        targetElement.focus();
        
        // Remove focus after a delay
        setTimeout(() => {
            targetElement.removeAttribute('tabindex');
        }, 1000);
        
        // Trigger custom event
        const event = new CustomEvent('scrollComplete', {
            detail: { target: targetElement }
        });
        window.dispatchEvent(event);
    }
    
    setupScrollProgress() {
        // Create scroll progress indicator
        const progressContainer = document.createElement('div');
        progressContainer.className = 'scroll-progress';
        progressContainer.innerHTML = `
            <div class="scroll-progress-bar"></div>
            <div class="scroll-progress-text">0%</div>
        `;
        
        document.body.appendChild(progressContainer);
        
        // Update progress on scroll
        window.addEventListener('scroll', () => {
            this.updateScrollProgress();
        });
        
        // Hide progress on mobile
        if (window.innerWidth < 768) {
            progressContainer.style.display = 'none';
        }
    }
    
    updateScrollProgress() {
        const progressContainer = document.querySelector('.scroll-progress');
        if (!progressContainer) return;
        
        const winScroll = document.body.scrollTop || document.documentElement.scrollTop;
        const height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
        const scrolled = (winScroll / height) * 100;
        
        const progressBar = progressContainer.querySelector('.scroll-progress-bar');
        const progressText = progressContainer.querySelector('.scroll-progress-text');
        
        if (progressBar) {
            progressBar.style.width = `${scrolled}%`;
        }
        
        if (progressText) {
            progressText.textContent = `${Math.round(scrolled)}%`;
            
            // Hide text when near top/bottom
            if (scrolled < 5 || scrolled > 95) {
                progressText.style.opacity = '0';
            } else {
                progressText.style.opacity = '1';
            }
        }
        
        // Hide container when at top
        if (winScroll < 100) {
            progressContainer.style.opacity = '0';
        } else {
            progressContainer.style.opacity = '1';
        }
    }
    
    setupKeyboardNavigation() {
        // Enable keyboard navigation for smooth scrolling
        document.addEventListener('keydown', (e) => {
            if (e.key === 'ArrowUp' || e.key === 'ArrowDown') {
                e.preventDefault();
                
                const scrollAmount = 100;
                const targetPosition = window.pageYOffset + (e.key === 'ArrowUp' ? -scrollAmount : scrollAmount);
                
                this.scrollToPosition(targetPosition);
            }
            
            if (e.key === 'Home' || e.key === 'End') {
                e.preventDefault();
                
                const targetPosition = e.key === 'Home' ? 0 : document.documentElement.scrollHeight;
                this.scrollToPosition(targetPosition);
            }
        });
    }
    
    scrollToPosition(targetPosition) {
        const startPosition = window.pageYOffset;
        const distance = targetPosition - startPosition;
        const startTime = performance.now();
        
        const scrollAnimation = (currentTime) => {
            const timeElapsed = currentTime - startTime;
            const progress = Math.min(timeElapsed / 500, 1);
            const easeProgress = this.easing(progress);
            
            window.scrollTo(0, startPosition + (distance * easeProgress));
            
            if (timeElapsed < 500) {
                requestAnimationFrame(scrollAnimation);
            }
        };
        
        requestAnimationFrame(scrollAnimation);
    }
    
    // Easing functions
    easeInOutCubic(t) {
        return t < 0.5 ? 4 * t * t * t : 1 - Math.pow(-2 * t + 2, 3) / 2;
    }
    
    easeOutCubic(t) {
        return 1 - Math.pow(1 - t, 3);
    }
    
    easeInOutQuad(t) {
        return t < 0.5 ? 2 * t * t : 1 - Math.pow(-2 * t + 2, 2) / 2;
    }
    
    // Public API
    static scrollToElement(element, options = {}) {
        const instance = new SmoothScroll();
        const defaultOptions = {
            offset: 80,
            duration: 800,
            easing: 'easeInOutCubic'
        };
        
        const config = { ...defaultOptions, ...options };
        instance.scrollDuration = config.duration;
        instance.easing = instance[config.easing];
        
        instance.scrollTo(`#${element.id}`, false);
    }
    
    static scrollToTop(options = {}) {
        const instance = new SmoothScroll();
        const defaultOptions = {
            duration: 600,
            easing: 'easeOutCubic'
        };
        
        const config = { ...defaultOptions, ...options };
        instance.scrollDuration = config.duration;
        instance.easing = instance[config.easing];
        
        instance.scrollToPosition(0);
    }
    
    static scrollToBottom(options = {}) {
        const instance = new SmoothScroll();
        const defaultOptions = {
            duration: 600,
            easing: 'easeOutCubic'
        };
        
        const config = { ...defaultOptions, ...options };
        instance.scrollDuration = config.duration;
        instance.easing = instance[config.easing];
        
        const bottomPosition = document.documentElement.scrollHeight;
        instance.scrollToPosition(bottomPosition);
    }
}

// Initialize smooth scroll
document.addEventListener('DOMContentLoaded', () => {
    window.SmoothScroll = new SmoothScroll();
    
    // Add CSS for scroll progress
    const style = document.createElement('style');
    style.textContent = `
        .scroll-progress {
            position: fixed;
            right: 30px;
            top: 50%;
            transform: translateY(-50%);
            width: 4px;
            height: 200px;
            background: rgba(0, 64, 128, 0.1);
            border-radius: 2px;
            z-index: 1000;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        
        .scroll-progress-bar {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 0%;
            background: linear-gradient(to bottom, var(--primary-blue), var(--accent-teal));
            border-radius: 2px;
            transition: height 0.1s linear;
        }
        
        .scroll-progress-text {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 0.8rem;
            font-weight: 600;
            color: var(--primary-blue);
            white-space: nowrap;
            transition: opacity 0.3s ease;
        }
        
        @media (max-width: 768px) {
            .scroll-progress {
                display: none;
            }
        }
        
        /* Focus styles for accessibility */
        :focus {
            outline: 2px solid var(--accent-teal);
            outline-offset: 2px;
        }
        
        :focus:not(:focus-visible) {
            outline: none;
        }
        
        :focus-visible {
            outline: 2px solid var(--accent-teal);
            outline-offset: 2px;
        }
    `;
    document.head.appendChild(style);
});

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = SmoothScroll;
}