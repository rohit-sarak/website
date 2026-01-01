/**
 * Custom Image Slider Implementation
 * No external libraries required
 */

class ImageSlider {
    constructor(container, options = {}) {
        this.container = typeof container === 'string' 
            ? document.querySelector(container) 
            : container;
        
        if (!this.container) {
            console.error('Slider container not found');
            return;
        }
        
        // Default options
        this.defaultOptions = {
            autoPlay: true,
            interval: 5000,
            transitionSpeed: 500,
            easing: 'ease-in-out',
            showDots: true,
            showArrows: true,
            infinite: true,
            pauseOnHover: true,
            draggable: true
        };
        
        this.options = { ...this.defaultOptions, ...options };
        this.slides = [];
        this.currentIndex = 0;
        this.isAnimating = false;
        this.isDragging = false;
        this.dragStartX = 0;
        this.dragCurrentX = 0;
        this.autoPlayInterval = null;
        
        this.init();
    }
    
    init() {
        this.setupSlides();
        this.setupContainer();
        this.setupControls();
        this.setupDots();
        this.setupArrows();
        this.setupDrag();
        
        if (this.options.autoPlay) {
            this.startAutoPlay();
        }
        
        // Update on window resize
        window.addEventListener('resize', () => this.handleResize());
    }
    
    setupSlides() {
        // Get all slide elements
        this.slides = Array.from(this.container.querySelectorAll('.slide'));
        
        if (this.slides.length === 0) {
            console.warn('No slides found in container');
            return;
        }
        
        // Add active class to first slide
        this.slides.forEach((slide, index) => {
            slide.style.transition = `transform ${this.options.transitionSpeed}ms ${this.options.easing}`;
            slide.dataset.index = index;
            
            if (index === 0) {
                slide.classList.add('active');
            }
        });
    }
    
    setupContainer() {
        // Set container styles
        this.container.style.position = 'relative';
        this.container.style.overflow = 'hidden';
        
        // Create track for slides
        this.track = document.createElement('div');
        this.track.className = 'slider-track';
        this.track.style.display = 'flex';
        this.track.style.transition = `transform ${this.options.transitionSpeed}ms ${this.options.easing}`;
        this.track.style.width = `${this.slides.length * 100}%`;
        
        // Move slides into track
        this.slides.forEach(slide => {
            slide.style.flex = `0 0 ${100 / this.slides.length}%`;
            this.track.appendChild(slide);
        });
        
        this.container.innerHTML = '';
        this.container.appendChild(this.track);
    }
    
    setupControls() {
        // Create controls container
        this.controls = document.createElement('div');
        this.controls.className = 'slider-controls';
        this.container.appendChild(this.controls);
    }
    
    setupDots() {
        if (!this.options.showDots || this.slides.length <= 1) return;
        
        this.dotsContainer = document.createElement('div');
        this.dotsContainer.className = 'slider-dots';
        
        this.slides.forEach((_, index) => {
            const dot = document.createElement('button');
            dot.className = 'slider-dot';
            dot.innerHTML = '<span></span>';
            dot.setAttribute('aria-label', `Go to slide ${index + 1}`);
            
            if (index === 0) {
                dot.classList.add('active');
            }
            
            dot.addEventListener('click', () => this.goToSlide(index));
            this.dotsContainer.appendChild(dot);
        });
        
        this.controls.appendChild(this.dotsContainer);
    }
    
    setupArrows() {
        if (!this.options.showArrows || this.slides.length <= 1) return;
        
        this.prevArrow = this.createArrow('prev', 'Previous slide');
        this.nextArrow = this.createArrow('next', 'Next slide');
        
        this.prevArrow.addEventListener('click', () => this.prev());
        this.nextArrow.addEventListener('click', () => this.next());
        
        this.controls.appendChild(this.prevArrow);
        this.controls.appendChild(this.nextArrow);
    }
    
    createArrow(direction, label) {
        const arrow = document.createElement('button');
        arrow.className = `slider-arrow slider-arrow-${direction}`;
        arrow.innerHTML = `
            <svg viewBox="0 0 24 24">
                <path d="${direction === 'prev' ? 'M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z' : 'M8.59 16.59L10 18l6-6-6-6-1.41 1.41L13.17 12z'}"/>
            </svg>
        `;
        arrow.setAttribute('aria-label', label);
        return arrow;
    }
    
    setupDrag() {
        if (!this.options.draggable || this.slides.length <= 1) return;
        
        this.container.addEventListener('mousedown', this.handleDragStart.bind(this));
        this.container.addEventListener('touchstart', this.handleDragStart.bind(this));
        
        document.addEventListener('mousemove', this.handleDragMove.bind(this));
        document.addEventListener('touchmove', this.handleDragMove.bind(this));
        
        document.addEventListener('mouseup', this.handleDragEnd.bind(this));
        document.addEventListener('touchend', this.handleDragEnd.bind(this));
        
        // Prevent default touch behavior
        this.container.addEventListener('touchmove', (e) => {
            if (this.isDragging) {
                e.preventDefault();
            }
        }, { passive: false });
    }
    
    handleDragStart(e) {
        if (this.isAnimating) return;
        
        this.isDragging = true;
        this.dragStartX = this.getDragX(e);
        this.track.style.transition = 'none';
        
        // Add dragging class
        this.container.classList.add('dragging');
    }
    
    handleDragMove(e) {
        if (!this.isDragging) return;
        
        e.preventDefault();
        this.dragCurrentX = this.getDragX(e);
        const dragDistance = this.dragCurrentX - this.dragStartX;
        
        if (Math.abs(dragDistance) > 10) {
            this.track.style.transform = `translateX(${-this.currentIndex * 100 + (dragDistance / this.container.offsetWidth) * 100}%)`;
        }
    }
    
    handleDragEnd() {
        if (!this.isDragging) return;
        
        this.isDragging = false;
        this.track.style.transition = `transform ${this.options.transitionSpeed}ms ${this.options.easing}`;
        this.container.classList.remove('dragging');
        
        const dragDistance = this.dragCurrentX - this.dragStartX;
        const threshold = this.container.offsetWidth * 0.3;
        
        if (dragDistance > threshold) {
            this.prev();
        } else if (dragDistance < -threshold) {
            this.next();
        } else {
            this.goToSlide(this.currentIndex);
        }
    }
    
    getDragX(e) {
        return e.type.includes('mouse') ? e.pageX : e.touches[0].pageX;
    }
    
    goToSlide(index) {
        if (this.isAnimating || index === this.currentIndex) return;
        
        this.isAnimating = true;
        const direction = index > this.currentIndex ? 'next' : 'prev';
        
        // Handle infinite looping
        if (this.options.infinite) {
            if (index < 0) index = this.slides.length - 1;
            if (index >= this.slides.length) index = 0;
        } else {
            index = Math.max(0, Math.min(index, this.slides.length - 1));
        }
        
        // Update track position
        this.track.style.transform = `translateX(${-index * (100 / this.slides.length)}%)`;
        
        // Update active classes
        this.updateActiveSlide(index);
        this.updateDots(index);
        
        // Reset animation flag after transition
        setTimeout(() => {
            this.isAnimating = false;
            this.currentIndex = index;
        }, this.options.transitionSpeed);
        
        // Trigger custom event
        this.triggerEvent('slideChange', { 
            index: this.currentIndex,
            direction: direction
        });
    }
    
    next() {
        let nextIndex = this.currentIndex + 1;
        
        if (this.options.infinite && nextIndex >= this.slides.length) {
            nextIndex = 0;
        } else if (!this.options.infinite) {
            nextIndex = Math.min(nextIndex, this.slides.length - 1);
        }
        
        this.goToSlide(nextIndex);
    }
    
    prev() {
        let prevIndex = this.currentIndex - 1;
        
        if (this.options.infinite && prevIndex < 0) {
            prevIndex = this.slides.length - 1;
        } else if (!this.options.infinite) {
            prevIndex = Math.max(prevIndex, 0);
        }
        
        this.goToSlide(prevIndex);
    }
    
    updateActiveSlide(index) {
        this.slides.forEach((slide, i) => {
            slide.classList.toggle('active', i === index);
        });
    }
    
    updateDots(index) {
        if (!this.dotsContainer) return;
        
        const dots = this.dotsContainer.querySelectorAll('.slider-dot');
        dots.forEach((dot, i) => {
            dot.classList.toggle('active', i === index);
        });
    }
    
    startAutoPlay() {
        if (this.autoPlayInterval) {
            clearInterval(this.autoPlayInterval);
        }
        
        this.autoPlayInterval = setInterval(() => {
            if (!this.isAnimating && !this.isDragging) {
                this.next();
            }
        }, this.options.interval);
        
        // Pause on hover
        if (this.options.pauseOnHover) {
            this.container.addEventListener('mouseenter', () => {
                clearInterval(this.autoPlayInterval);
            });
            
            this.container.addEventListener('mouseleave', () => {
                this.startAutoPlay();
            });
        }
    }
    
    stopAutoPlay() {
        if (this.autoPlayInterval) {
            clearInterval(this.autoPlayInterval);
            this.autoPlayInterval = null;
        }
    }
    
    handleResize() {
        // Update track position on resize
        this.track.style.transform = `translateX(${-this.currentIndex * (100 / this.slides.length)}%)`;
    }
    
    triggerEvent(eventName, detail = {}) {
        const event = new CustomEvent(`slider:${eventName}`, {
            detail: { ...detail, slider: this }
        });
        this.container.dispatchEvent(event);
    }
    
    // Public API
    destroy() {
        this.stopAutoPlay();
        
        // Remove event listeners
        this.container.replaceWith(this.container.cloneNode(true));
    }
    
    updateOptions(newOptions) {
        this.options = { ...this.options, ...newOptions };
        
        if (this.options.autoPlay) {
            this.startAutoPlay();
        } else {
            this.stopAutoPlay();
        }
    }
}

// Initialize sliders on page load
document.addEventListener('DOMContentLoaded', () => {
    // Find all slider containers
    const sliderContainers = document.querySelectorAll('[data-slider]');
    
    sliderContainers.forEach(container => {
        const options = {
            autoPlay: container.dataset.autoplay !== 'false',
            interval: parseInt(container.dataset.interval) || 5000,
            transitionSpeed: parseInt(container.dataset.speed) || 500,
            showDots: container.dataset.dots !== 'false',
            showArrows: container.dataset.arrows !== 'false',
            infinite: container.dataset.infinite !== 'false'
        };
        
        new ImageSlider(container, options);
    });
    
    // Add CSS for slider
    const style = document.createElement('style');
    style.textContent = `
        .slider-track {
            will-change: transform;
        }
        
        .slider-controls {
            position: absolute;
            bottom: 20px;
            left: 0;
            right: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
            z-index: 10;
        }
        
        .slider-dots {
            display: flex;
            gap: 10px;
        }
        
        .slider-dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.5);
            border: none;
            padding: 0;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
        }
        
        .slider-dot span {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: white;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        
        .slider-dot.active {
            background: transparent;
            border: 2px solid white;
        }
        
        .slider-dot.active span {
            opacity: 1;
        }
        
        .slider-dot:hover:not(.active) {
            background: rgba(255, 255, 255, 0.8);
        }
        
        .slider-arrow {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.2);
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: white;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            z-index: 10;
        }
        
        .slider-arrow svg {
            width: 24px;
            height: 24px;
            fill: currentColor;
        }
        
        .slider-arrow-prev {
            left: 20px;
        }
        
        .slider-arrow-next {
            right: 20px;
        }
        
        .slider-arrow:hover {
            background: var(--accent-teal);
            border-color: var(--accent-teal);
            transform: translateY(-50%) scale(1.1);
        }
        
        .slider-arrow:active {
            transform: translateY(-50%) scale(0.95);
        }
        
        /* Slide animations */
        .slide {
            opacity: 0;
            transition: opacity 0.5s ease;
        }
        
        .slide.active {
            opacity: 1;
        }
        
        /* Dragging state */
        .dragging {
            cursor: grabbing;
        }
        
        .dragging .slide {
            pointer-events: none;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .slider-arrow {
                width: 40px;
                height: 40px;
            }
            
            .slider-arrow svg {
                width: 20px;
                height: 20px;
            }
            
            .slider-arrow-prev {
                left: 10px;
            }
            
            .slider-arrow-next {
                right: 10px;
            }
            
            .slider-controls {
                bottom: 10px;
            }
        }
    `;
    document.head.appendChild(style);
});

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = ImageSlider;
}