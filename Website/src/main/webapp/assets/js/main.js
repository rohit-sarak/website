/**
 * Main JavaScript File
 * Contains core functionality for the website
 */

class PrecisionTechApp {
    constructor() {
        this.init();
    }
    
    init() {
        this.setupEventListeners();
        this.setupIntersectionObserver();
        this.setupSmoothScroll();
        this.setup3DEffects();
        this.setupLazyLoading();
        this.setupFormHandlers();
        this.setupMobileMenu();
        this.setupParallax();
        this.setupAnimations();
        
        // Initial setup
        this.updateHeaderOnScroll();
        this.setupLoadingBar();
    }
    
    setupEventListeners() {
        // Window resize handling
        let resizeTimer;
        window.addEventListener('resize', () => {
            clearTimeout(resizeTimer);
            resizeTimer = setTimeout(() => {
                this.handleResize();
            }, 250);
        });
        
        // Window scroll handling
        let scrollTimer;
        window.addEventListener('scroll', () => {
            clearTimeout(scrollTimer);
            scrollTimer = setTimeout(() => {
                this.updateHeaderOnScroll();
                this.handleScrollAnimations();
            }, 10);
        });
        
        // Before unload - save scroll position
        window.addEventListener('beforeunload', () => {
            sessionStorage.setItem('scrollPosition', window.pageYOffset);
        });
        
        // Page load - restore scroll position
        window.addEventListener('load', () => {
            const savedPosition = sessionStorage.getItem('scrollPosition');
            if (savedPosition) {
                window.scrollTo(0, parseInt(savedPosition));
                sessionStorage.removeItem('scrollPosition');
            }
        });
    }
    
    setupIntersectionObserver() {
        // Create observer for scroll-triggered animations
        this.observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    this.animateElement(entry.target);
                    this.observer.unobserve(entry.target);
                }
            });
        }, {
            root: null,
            rootMargin: '0px',
            threshold: 0.1
        });
        
        // Observe all elements with animation classes
        document.querySelectorAll('.fade-in, .slide-in, .animate-on-scroll').forEach(el => {
            this.observer.observe(el);
        });
    }
    
    animateElement(element) {
        // Add appropriate animation class based on element type
        if (element.classList.contains('fade-in')) {
            element.style.animationDelay = `${Math.random() * 0.5}s`;
            element.classList.add('animated');
        } else if (element.classList.contains('slide-in')) {
            const direction = element.dataset.direction || 'left';
            element.classList.add(`slide-in-${direction}`);
        }
        
        // Trigger CSS animation
        element.style.opacity = '1';
        element.style.transform = 'translate(0, 0)';
    }
    
    setupSmoothScroll() {
        // Smooth scroll for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', (e) => {
                e.preventDefault();
                
                const targetId = anchor.getAttribute('href');
                if (targetId === '#') return;
                
                const targetElement = document.querySelector(targetId);
                if (targetElement) {
                    this.scrollToElement(targetElement);
                }
            });
        });
    }
    
    scrollToElement(element, offset = 80) {
        const elementPosition = element.getBoundingClientRect().top;
        const offsetPosition = elementPosition + window.pageYOffset - offset;
        
        window.scrollTo({
            top: offsetPosition,
            behavior: 'smooth'
        });
    }
    
    setup3DEffects() {
        // Add 3D hover effects to cards
        document.querySelectorAll('.card-3d').forEach(card => {
            card.addEventListener('mousemove', (e) => {
                const rect = card.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;
                
                const centerX = rect.width / 2;
                const centerY = rect.height / 2;
                
                const rotateY = (x - centerX) / 25;
                const rotateX = (centerY - y) / 25;
                
                card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) translateY(-10px)`;
                card.style.boxShadow = ` 
                    ${-rotateY * 2}px ${rotateX * 2}px 30px rgba(0, 0, 0, 0.1),
                    0 20px 40px rgba(0, 0, 0, 0.15)
                `;
            });
            
            card.addEventListener('mouseleave', () => {
                card.style.transform = 'perspective(1000px) rotateX(0) rotateY(0) translateY(0)';
                card.style.boxShadow = 'var(--shadow-md)';
            });
        });
        
        // Button hover effects
        document.querySelectorAll('.btn').forEach(button => {
            button.addEventListener('mousemove', (e) => {
                const rect = button.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;
                
                button.style.setProperty('--mouse-x', `${x}px`);
                button.style.setProperty('--mouse-y', `${y}px`);
            });
        });
    }
    
    setupLazyLoading() {
        // Lazy load images with Intersection Observer
        if ('IntersectionObserver' in window) {
            const imageObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        img.src = img.dataset.src || img.src;
                        img.classList.add('loaded');
                        imageObserver.unobserve(img);
                    }
                });
            }, {
                rootMargin: '50px 0px',
                threshold: 0.01
            });
            
            document.querySelectorAll('img[data-src]').forEach(img => {
                imageObserver.observe(img);
            });
        } else {
            // Fallback for older browsers
            document.querySelectorAll('img[data-src]').forEach(img => {
                img.src = img.dataset.src;
            });
        }
    }
    
    setupFormHandlers() {
        // Form validation and submission
        document.querySelectorAll('form').forEach(form => {
            // Real-time validation
            form.querySelectorAll('input, textarea, select').forEach(input => {
                input.addEventListener('blur', () => this.validateField(input));
                input.addEventListener('input', () => this.clearFieldError(input));
            });
            
            // Form submission
            form.addEventListener('submit', (e) => {
                if (!form.checkValidity()) {
                    e.preventDefault();
                    this.validateForm(form);
                }
            });
        });
    }
    
    validateField(field) {
        // Basic validation
        const value = field.value.trim();
        const type = field.type;
        const name = field.name;
        
        this.clearFieldError(field);
        
        // Required validation
        if (field.required && !value) {
            this.showFieldError(field, 'This field is required');
            return false;
        }
        
        // Email validation
        if (type === 'email' && value) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(value)) {
                this.showFieldError(field, 'Please enter a valid email address');
                return false;
            }
        }
        
        // Phone validation
        if (name === 'phone' && value) {
            const phoneRegex = /^[\+]?[1-9][\d]{0,15}$/;
            const cleanPhone = value.replace(/[\s\-\(\)]/g, '');
            if (!phoneRegex.test(cleanPhone)) {
                this.showFieldError(field, 'Please enter a valid phone number');
                return false;
            }
        }
        
        return true;
    }
    
    showFieldError(field, message) {
        field.classList.add('error');
        
        let errorDiv = field.parentElement.querySelector('.error-message');
        if (!errorDiv) {
            errorDiv = document.createElement('div');
            errorDiv.className = 'error-message';
            field.parentElement.appendChild(errorDiv);
        }
        errorDiv.textContent = message;
        errorDiv.style.opacity = '1';
    }
    
    clearFieldError(field) {
        field.classList.remove('error');
        const errorDiv = field.parentElement.querySelector('.error-message');
        if (errorDiv) {
            errorDiv.style.opacity = '0';
            setTimeout(() => errorDiv.remove(), 300);
        }
    }
    
    validateForm(form) {
        let isValid = true;
        form.querySelectorAll('input, textarea, select').forEach(field => {
            if (!this.validateField(field)) {
                isValid = false;
            }
        });
        return isValid;
    }
    
    setupMobileMenu() {
        const menuToggle = document.querySelector('.menu-toggle');
        const navMenu = document.querySelector('.nav-menu');
        const mobileBackdrop = document.querySelector('.mobile-backdrop');
        
        if (menuToggle && navMenu) {
            menuToggle.addEventListener('click', () => {
                menuToggle.classList.toggle('active');
                navMenu.classList.toggle('active');
                
                if (mobileBackdrop) {
                    mobileBackdrop.classList.toggle('active');
                }
                
                // Toggle body scroll
                document.body.style.overflow = navMenu.classList.contains('active') ? 'hidden' : '';
            });
            
            // Close menu when clicking backdrop
            if (mobileBackdrop) {
                mobileBackdrop.addEventListener('click', () => {
                    menuToggle.classList.remove('active');
                    navMenu.classList.remove('active');
                    mobileBackdrop.classList.remove('active');
                    document.body.style.overflow = '';
                });
            }
            
            // Close menu when clicking a link
            navMenu.querySelectorAll('a').forEach(link => {
                link.addEventListener('click', () => {
                    menuToggle.classList.remove('active');
                    navMenu.classList.remove('active');
                    if (mobileBackdrop) {
                        mobileBackdrop.classList.remove('active');
                    }
                    document.body.style.overflow = '';
                });
            });
        }
    }
    
    setupParallax() {
        // Parallax scrolling effect
        window.addEventListener('scroll', () => {
            const scrolled = window.pageYOffset;
            const parallaxElements = document.querySelectorAll('.parallax-section');
            
            parallaxElements.forEach(element => {
                const rate = element.dataset.rate || 0.5;
                const offset = scrolled * rate;
                element.style.transform = `translate3d(0, ${offset}px, 0)`;
            });
        });
    }
    
    setupAnimations() {
        // Initialize animation timelines
        this.setupScrollAnimations();
        this.setupHoverAnimations();
        this.setupPageTransitions();
    }
    
    setupScrollAnimations() {
        // Custom scroll animations
        const animatedElements = document.querySelectorAll('[data-animate]');
        
        animatedElements.forEach(element => {
            const animationType = element.dataset.animate;
            const delay = element.dataset.delay || 0;
            
            element.style.opacity = '0';
            element.style.transition = `all 0.8s cubic-bezier(0.4, 0, 0.2, 1) ${delay}s`;
            
            this.observer.observe(element);
        });
    }
    
    setupHoverAnimations() {
        // Add hover animations to interactive elements
        document.querySelectorAll('.hover-effect').forEach(element => {
            element.addEventListener('mouseenter', () => {
                element.classList.add('hovering');
            });
            
            element.addEventListener('mouseleave', () => {
                element.classList.remove('hovering');
            });
        });
    }
    
    setupPageTransitions() {
        // Smooth page transitions
        document.querySelectorAll('a:not([href^="#"])').forEach(link => {
            link.addEventListener('click', (e) => {
                if (link.target === '_blank' || link.hasAttribute('download')) {
                    return;
                }
                
                e.preventDefault();
                const href = link.href;
                
                // Add page transition
                document.body.classList.add('page-exit');
                
                setTimeout(() => {
                    window.location.href = href;
                }, 300);
            });
        });
    }
    
    updateHeaderOnScroll() {
        const header = document.querySelector('.header');
        const scrollTop = window.pageYOffset;
        
        if (header) {
            if (scrollTop > 100) {
                header.classList.add('scrolled');
                header.classList.remove('hidden');
            } else {
                header.classList.remove('scrolled');
            }
            
            // Hide header on scroll down, show on scroll up
            if (scrollTop > 200 && scrollTop > this.lastScrollTop) {
                header.classList.add('hidden');
            } else if (scrollTop < this.lastScrollTop) {
                header.classList.remove('hidden');
            }
            
            this.lastScrollTop = scrollTop;
        }
    }
    
    handleScrollAnimations() {
        // Handle progress bar
        const loadingBar = document.querySelector('.loading-bar');
        if (loadingBar) {
            const winScroll = document.body.scrollTop || document.documentElement.scrollTop;
            const height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            const scrolled = (winScroll / height) * 100;
            loadingBar.style.width = scrolled + '%';
        }
        
        // Handle section animations
        const sections = document.querySelectorAll('section');
        const scrollPosition = window.pageYOffset + window.innerHeight * 0.8;
        
        sections.forEach(section => {
            const sectionTop = section.offsetTop;
            const sectionHeight = section.offsetHeight;
            
            if (scrollPosition > sectionTop && scrollPosition < sectionTop + sectionHeight) {
                section.classList.add('active');
            }
        });
    }
    
    setupLoadingBar() {
        // Create loading bar if not exists
        if (!document.querySelector('.loading-bar')) {
            const loadingBar = document.createElement('div');
            loadingBar.className = 'loading-bar';
            document.body.appendChild(loadingBar);
        }
    }
    
    handleResize() {
        // Handle responsive adjustments
        this.updateMobileMenu();
        this.adjustAnimations();
    }
    
    updateMobileMenu() {
        const navMenu = document.querySelector('.nav-menu');
        const menuToggle = document.querySelector('.menu-toggle');
        
        if (window.innerWidth > 1024) {
            if (navMenu) navMenu.classList.remove('active');
            if (menuToggle) menuToggle.classList.remove('active');
            document.body.style.overflow = '';
        }
    }
    
    adjustAnimations() {
        // Adjust animation speeds for mobile
        if (window.innerWidth < 768) {
            document.documentElement.style.setProperty('--animation-speed', '0.5s');
        } else {
            document.documentElement.style.setProperty('--animation-speed', '0.8s');
        }
    }
    
    // Utility methods
    debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }
    
    throttle(func, limit) {
        let inThrottle;
        return function() {
            const args = arguments;
            const context = this;
            if (!inThrottle) {
                func.apply(context, args);
                inThrottle = true;
                setTimeout(() => inThrottle = false, limit);
            }
        };
    }
}

// Initialize the application
document.addEventListener('DOMContentLoaded', () => {
    window.PrecisionTechApp = new PrecisionTechApp();
    
    // Add CSS custom properties for animations
    const style = document.createElement('style');
    style.textContent = `
        :root {
            --animation-speed: 0.8s;
            --animation-timing: cubic-bezier(0.4, 0, 0.2, 1);
        }
        
        .loading-bar {
            position: fixed;
            top: 0;
            left: 0;
            width: 0%;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-blue), var(--accent-teal));
            z-index: 9999;
            transition: width 0.3s ease;
        }
        
        .page-transition {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: var(--primary-blue);
            z-index: 9998;
            transform: translateX(-100%);
            animation: pageEnter 0.6s var(--animation-timing) forwards;
        }
        
        @keyframes pageEnter {
            to {
                transform: translateX(100%);
            }
        }
    `;
    document.head.appendChild(style);
});

// Global error handling
window.addEventListener('error', (e) => {
    console.error('Application error:', e.error);
    // You could send this to a logging service
});

// Performance monitoring
if ('performance' in window) {
    window.addEventListener('load', () => {
        const perfData = window.performance.timing;
        const pageLoadTime = perfData.loadEventEnd - perfData.navigationStart;
        console.log(`Page loaded in ${pageLoadTime}ms`);
    });
}