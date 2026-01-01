<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/components/header.jsp" %>

<!-- Loading Progress Bar -->
<div class="loading-bar"></div>

<!-- Hero Section -->
<section class="hero-section parallax-section" data-rate="0.3">
    <div class="hero-slider">
        <div class="slide active">
            <div class="slide-content">
                <h1 class="fade-in">Precision Engineering for Tomorrow's World</h1>
                <p class="subtitle slide-in" data-direction="right">Advanced solutions for medical, industrial & aerospace applications</p>
                <a href="<%= contextPath %>/products" class="btn fade-in" style="animation-delay: 0.5s">View Products</a>
            </div>
        </div>
        <!-- Additional slides would go here -->
    </div>
    
    <div class="scroll-indicator">
        <div class="mouse">
            <div class="wheel"></div>
        </div>
        <div class="arrow">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
</section>

<!-- About Section -->
<section class="section about-section">
    <div class="container">
        <div class="grid-2">
            <div class="about-content fade-in">
                <h2>About Us</h2>
                <p class="lead">For over 25 years, we've been at the forefront of precision engineering, delivering mission-critical components to industries where accuracy is non-negotiable.</p>
                <p>Our commitment to excellence has made us the preferred partner for Fortune 500 companies, leading medical device manufacturers, and aerospace innovators worldwide.</p>
                <div class="stats">
                    <div class="stat">
                        <span class="number" data-count="25">0</span>
                        <span class="label">Years Experience</span>
                    </div>
                    <div class="stat">
                        <span class="number" data-count="500">0</span>
                        <span class="label">Projects Completed</span>
                    </div>
                    <div class="stat">
                        <span class="number" data-count="50">0</span>
                        <span class="label">Countries Served</span>
                    </div>
                </div>
            </div>
            <div class="about-image slide-in" data-direction="right">
                <div class="image-wrapper">
                    <div class="image-3d">
                        <img src="<%= contextPath %>/assets/images/about/precision-lab.jpg" alt="Precision Laboratory">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Markets Served -->
<section class="section markets-section">
    <div class="container">
        <h2 class="text-center fade-in">Markets Served</h2>
        <p class="section-subtitle text-center slide-in">Delivering precision solutions across industries</p>
        
        <div class="grid-3">
            <div class="market-card card-3d">
                <div class="card-icon">
                    <svg class="icon-medical" viewBox="0 0 24 24">
                        <!-- Medical icon SVG -->
                    </svg>
                </div>
                <h3>Medical</h3>
                <p>Surgical instruments, diagnostic equipment, and medical device components with micron-level precision.</p>
                <a href="#" class="card-link">Learn More →</a>
            </div>
            
            <div class="market-card card-3d">
                <div class="card-icon">
                    <svg class="icon-industrial" viewBox="0 0 24 24">
                        <!-- Industrial icon SVG -->
                    </svg>
                </div>
                <h3>Industrial</h3>
                <p>High-precision components for manufacturing, robotics, and automation systems.</p>
                <a href="#" class="card-link">Learn More →</a>
            </div>
            
            <div class="market-card card-3d">
                <div class="card-icon">
                    <svg class="icon-aerospace" viewBox="0 0 24 24">
                        <!-- Aerospace icon SVG -->
                    </svg>
                </div>
                <h3>Aerospace</h3>
                <p>Mission-critical components for aviation, space exploration, and defense applications.</p>
                <a href="#" class="card-link">Learn More →</a>
            </div>
        </div>
    </div>
</section>

<!-- Capabilities -->
<section class="section capabilities-section">
    <div class="container">
        <div class="grid-2">
            <div class="capabilities-image slide-in">
                <div class="image-stack">
                    <div class="stack-item item-1">
                        <img src="<%= contextPath %>/assets/images/capabilities/cnc.jpg" alt="CNC Machining">
                    </div>
                    <div class="stack-item item-2">
                        <img src="<%= contextPath %>/assets/images/capabilities/laser.jpg" alt="Laser Cutting">
                    </div>
                    <div class="stack-item item-3">
                        <img src="<%= contextPath %>/assets/images/capabilities/inspection.jpg" alt="Quality Inspection">
                    </div>
                </div>
            </div>
            <div class="capabilities-content fade-in">
                <h2>Our Capabilities</h2>
                <div class="capability-item">
                    <h4>Precision Machining</h4>
                    <div class="progress-bar">
                        <div class="progress" data-width="95"></div>
                        <span>95%</span>
                    </div>
                </div>
                <div class="capability-item">
                    <h4>Quality Assurance</h4>
                    <div class="progress-bar">
                        <div class="progress" data-width="99"></div>
                        <span>99.8%</span>
                    </div>
                </div>
                <div class="capability-item">
                    <h4>R&D Innovation</h4>
                    <div class="progress-bar">
                        <div class="progress" data-width="90"></div>
                        <span>90%</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ISO Certification -->
<section class="section iso-section">
    <div class="container">
        <h2 class="text-center fade-in">Quality Certified</h2>
        <div class="certificates">
            <div class="certificate-card card-3d">
                <div class="certificate-image">
                    <img src="<%= contextPath %>/assets/images/certificates/iso-9001.jpg" alt="ISO 9001:2015">
                </div>
                <h4>ISO 9001:2015</h4>
                <p>Quality Management System Certified</p>
            </div>
            <div class="certificate-card card-3d">
                <div class="certificate-image">
                    <img src="<%= contextPath %>/assets/images/certificates/iso-13485.jpg" alt="ISO 13485:2016">
                </div>
                <h4>ISO 13485:2016</h4>
                <p>Medical Devices Quality Management</p>
            </div>
        </div>
    </div>
</section>

<!-- Contact Preview -->
<section class="section contact-preview">
    <div class="container">
        <h2 class="text-center fade-in">Get in Touch</h2>
        <div class="grid-2">
            <div class="contact-info slide-in">
                <h3>Contact Information</h3>
                <div class="contact-item">
                    <div class="icon">📍</div>
                    <div>
                        <strong>Address</strong>
                        <p>123 Precision Avenue<br>Tech Park, CA 94000</p>
                    </div>
                </div>
                <div class="contact-item">
                    <div class="icon">📞</div>
                    <div>
                        <strong>Phone</strong>
                        <p>+1 (555) 123-4567</p>
                    </div>
                </div>
                <div class="contact-item">
                    <div class="icon">✉️</div>
                    <div>
                        <strong>Email</strong>
                        <p>info@precisiontech.com</p>
                    </div>
                </div>
            </div>
            <div class="management-team fade-in">
                <h3>Key Contacts</h3>
                <div class="team-grid">
                    <div class="team-member">
                        <div class="member-avatar">JD</div>
                        <div>
                            <strong>John Davis</strong>
                            <p>Technical Director</p>
                        </div>
                    </div>
                    <div class="team-member">
                        <div class="member-avatar">SR</div>
                        <div>
                            <strong>Sarah Roberts</strong>
                            <p>Sales Manager</p>
                        </div>
                    </div>
                </div>
                <a href="<%= contextPath %>/contact" class="btn btn-outline">Full Contact Details →</a>
            </div>
        </div>
    </div>
</section>

<style>
    /* Hero Section */
    .hero-section {
        min-height: 100vh;
        background: linear-gradient(135deg, rgba(0, 64, 128, 0.9) 0%, rgba(32, 201, 151, 0.7) 100%),
                    url('<%= contextPath %>/assets/images/hero/hero-bg.jpg');
        background-size: cover;
        background-position: center;
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: center;
        color: white;
        padding-top: 80px;
    }
    
    .hero-slider {
        max-width: 800px;
        margin: 0 auto;
        padding: 2rem;
    }
    
    .slide-content h1 {
        margin-bottom: 1rem;
        -webkit-text-fill-color: white;
        background: transparent;
    }
    
    .subtitle {
        font-size: 1.2rem;
        margin-bottom: 2rem;
        opacity: 0.9;
    }
    
    /* Scroll Indicator */
    .scroll-indicator {
        position: absolute;
        bottom: 30px;
        left: 50%;
        transform: translateX(-50%);
    }
    
    .mouse {
        width: 26px;
        height: 40px;
        border: 2px solid white;
        border-radius: 13px;
        margin: 0 auto;
        position: relative;
    }
    
    .wheel {
        width: 3px;
        height: 8px;
        background: white;
        border-radius: 2px;
        position: absolute;
        top: 8px;
        left: 50%;
        transform: translateX(-50%);
        animation: scrollWheel 2s infinite;
    }
    
    @keyframes scrollWheel {
        0% {
            opacity: 1;
            transform: translateX(-50%) translateY(0);
        }
        100% {
            opacity: 0;
            transform: translateX(-50%) translateY(15px);
        }
    }
    
    /* About Section */
    .about-section {
        padding: 5rem 0;
        background: var(--white);
    }
    
    .grid-2 {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 4rem;
        align-items: center;
    }
    
    .stats {
        display: flex;
        gap: 2rem;
        margin-top: 2rem;
    }
    
    .stat {
        text-align: center;
    }
    
    .number {
        font-size: 2.5rem;
        font-weight: 700;
        color: var(--primary-blue);
        display: block;
    }
    
    .label {
        font-size: 0.9rem;
        color: var(--secondary-gray);
    }
    
    /* Market Cards */
    .markets-section {
        padding: 5rem 0;
        background: var(--background-light);
    }
    
    .text-center {
        text-align: center;
    }
    
    .section-subtitle {
        color: var(--secondary-gray);
        margin-bottom: 3rem;
    }
    
    .card-icon {
        width: 60px;
        height: 60px;
        background: linear-gradient(135deg, var(--primary-blue), var(--accent-teal));
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 1rem;
    }
    
    .card-icon svg {
        width: 30px;
        height: 30px;
        fill: white;
    }
    
    .card-link {
        color: var(--accent-teal);
        text-decoration: none;
        font-weight: 600;
        display: inline-block;
        margin-top: 1rem;
        transition: transform 0.3s ease;
    }
    
    .card-link:hover {
        transform: translateX(5px);
    }
    
    /* Progress Bars */
    .progress-bar {
        height: 8px;
        background: #e9ecef;
        border-radius: 4px;
        margin: 0.5rem 0;
        position: relative;
    }
    
    .progress {
        height: 100%;
        background: linear-gradient(90deg, var(--primary-blue), var(--accent-teal));
        border-radius: 4px;
        width: 0;
        transition: width 1.5s ease;
    }
    
    .progress-bar span {
        position: absolute;
        right: 0;
        top: -25px;
        font-weight: 600;
        color: var(--primary-blue);
    }
    
    /* Certificate Cards */
    .certificates {
        display: flex;
        justify-content: center;
        gap: 2rem;
        margin-top: 3rem;
    }
    
    .certificate-card {
        text-align: center;
        max-width: 200px;
    }
    
    .certificate-image {
        width: 100px;
        height: 100px;
        margin: 0 auto 1rem;
        border-radius: 50%;
        overflow: hidden;
        border: 3px solid var(--accent-teal);
    }
    
    .certificate-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.5s ease;
    }
    
    .certificate-card:hover .certificate-image img {
        transform: scale(1.1);
    }
    
    /* Contact Preview */
    .contact-preview {
        padding: 5rem 0;
        background: var(--white);
    }
    
    .contact-item {
        display: flex;
        gap: 1rem;
        margin-bottom: 1.5rem;
        align-items: flex-start;
    }
    
    .contact-item .icon {
        width: 40px;
        height: 40px;
        background: var(--background-light);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.2rem;
    }
    
    .team-member {
        display: flex;
        gap: 1rem;
        align-items: center;
        margin-bottom: 1rem;
    }
    
    .member-avatar {
        width: 50px;
        height: 50px;
        background: linear-gradient(135deg, var(--primary-blue), var(--accent-teal));
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-weight: 600;
    }
    
    @media (max-width: 768px) {
        .grid-2 {
            grid-template-columns: 1fr;
        }
        
        .stats {
            flex-direction: column;
            gap: 1rem;
        }
        
        .certificates {
            flex-direction: column;
            align-items: center;
        }
    }
</style>

<script>
    // Animated number counters
    document.addEventListener('DOMContentLoaded', function() {
        const counters = document.querySelectorAll('.number');
        
        counters.forEach(counter => {
            const target = parseInt(counter.getAttribute('data-count'));
            const increment = target / 100;
            let current = 0;
            
            const updateCounter = () => {
                if (current < target) {
                    current += increment;
                    counter.textContent = Math.ceil(current);
                    setTimeout(updateCounter, 20);
                } else {
                    counter.textContent = target;
                }
            };
            
            // Start counter when in view
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        updateCounter();
                        observer.unobserve(entry.target);
                    }
                });
            });
            
            observer.observe(counter);
        });
        
        // Progress bar animation
        const progressBars = document.querySelectorAll('.progress');
        progressBars.forEach(bar => {
            const width = bar.getAttribute('data-width');
            bar.style.width = width + '%';
        });
    });
</script>

<%@ include file="/components/footer.jsp" %>