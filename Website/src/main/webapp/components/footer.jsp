<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>

<footer class="footer">
    <div class="footer-wave"></div>
    
    <div class="footer-content">
        <div class="container">
            <div class="footer-grid">
                <!-- Company Info -->
                <div class="footer-section">
                    <div class="footer-logo">
                        <div class="logo-3d">
                            <span class="logo-text">PRECISION</span>
                            <span class="logo-subtext">TECH</span>
                        </div>
                    </div>
                    <p class="footer-description">
                        World-class precision engineering solutions for medical, industrial, and aerospace applications.
                    </p>
                    <div class="footer-social">
                        <a href="#" class="social-icon" aria-label="LinkedIn">
                            <svg class="social-svg" viewBox="0 0 24 24">
                                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
                            </svg>
                        </a>
                        <a href="#" class="social-icon" aria-label="Twitter">
                            <svg class="social-svg" viewBox="0 0 24 24">
                                <path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.213c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z"/>
                            </svg>
                        </a>
                        <a href="#" class="social-icon" aria-label="YouTube">
                            <svg class="social-svg" viewBox="0 0 24 24">
                                <path d="M23.498 6.186a3.016 3.016 0 00-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 00.502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 002.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 002.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>
                            </svg>
                        </a>
                    </div>
                </div>
                
                <!-- Quick Links -->
                <div class="footer-section">
                    <h4 class="footer-heading">Quick Links</h4>
                    <ul class="footer-links">
                        <li><a href="<%= contextPath %>/home">Home</a></li>
                        <li><a href="<%= contextPath %>/products">Products</a></li>
                        <li><a href="<%= contextPath %>/compliance/conflict-minerals">Compliance</a></li>
                        <li><a href="<%= contextPath %>/library">Library</a></li>
                        <li><a href="<%= contextPath %>/requests">Requests</a></li>
                        <li><a href="<%= contextPath %>/contact">Contact</a></li>
                    </ul>
                </div>
                
                <!-- Products -->
                <div class="footer-section">
                    <h4 class="footer-heading">Products</h4>
                    <ul class="footer-links">
                        <li><a href="<%= contextPath %>/products/articulated-arms">Articulated Arms</a></li>
                        <li><a href="<%= contextPath %>/products/focusing-handpieces">Focusing Handpieces</a></li>
                        <li><a href="<%= contextPath %>/products/laparoscope-coupler">Laparoscope Coupler</a></li>
                        <li><a href="<%= contextPath %>/products/micromanipulators">Micromanipulators</a></li>
                        <li><a href="<%= contextPath %>/products/scanners">Scanners</a></li>
                    </ul>
                </div>
                
                <!-- Contact Info -->
                <div class="footer-section">
                    <h4 class="footer-heading">Contact Us</h4>
                    <div class="footer-contact">
                        <div class="contact-item">
                            <svg class="contact-icon" viewBox="0 0 24 24">
                                <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5a2.5 2.5 0 010-5 2.5 2.5 0 010 5z"/>
                            </svg>
                            <span>123 Precision Avenue<br>Tech Park, CA 94000</span>
                        </div>
                        <div class="contact-item">
                            <svg class="contact-icon" viewBox="0 0 24 24">
                                <path d="M6.62 10.79c1.44 2.83 3.76 5.14 6.59 6.59l2.2-2.2c.27-.27.67-.36 1.02-.24 1.12.37 2.33.57 3.57.57.55 0 1 .45 1 1V20c0 .55-.45 1-1 1-9.39 0-17-7.61-17-17 0-.55.45-1 1-1h3.5c.55 0 1 .45 1 1 0 1.25.2 2.45.57 3.57.11.35.03.74-.25 1.02l-2.2 2.2z"/>
                            </svg>
                            <span>+1 (555) 123-4567</span>
                        </div>
                        <div class="contact-item">
                            <svg class="contact-icon" viewBox="0 0 24 24">
                                <path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/>
                            </svg>
                            <span>info@precisiontech.com</span>
                        </div>
                    </div>
                    
                    <!-- Newsletter -->
                    <div class="newsletter">
                        <h5>Subscribe to Updates</h5>
                        <form class="newsletter-form" id="newsletterForm">
                            <input type="email" placeholder="Your email" required>
                            <button type="submit" class="btn-newsletter">
                                <svg viewBox="0 0 24 24" width="20" height="20">
                                    <path d="M2.01 21L23 12 2.01 3 2 10l15 2-15 2z" fill="white"/>
                                </svg>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            
            <!-- Footer Bottom -->
            <div class="footer-bottom">
                <div class="footer-legal">
                    <div class="legal-links">
                        <a href="<%= contextPath %>/legal/terms-and-conditions">Terms & Conditions</a>
                        <span class="separator">|</span>
                        <a href="<%= contextPath %>/legal/legal-notice">Legal Notice</a>
                        <span class="separator">|</span>
                        <a href="<%= contextPath %>/legal/privacy-policy">Privacy Policy</a>
                    </div>
                    <div class="copyright">
                        &copy; 2024 Precision Tech Industries. All rights reserved.
                    </div>
                </div>
                
                <div class="footer-certifications">
                    <div class="cert-badge">ISO 9001:2015</div>
                    <div class="cert-badge">ISO 13485:2016</div>
                    <div class="cert-badge">FDA Registered</div>
                </div>
            </div>
        </div>
    </div>
</footer>

<style>
    .footer {
        background: linear-gradient(135deg, #002855 0%, #004080 100%);
        color: white;
        position: relative;
        overflow: hidden;
    }
    
    .footer-wave {
        position: absolute;
        top: -50px;
        left: 0;
        width: 100%;
        height: 100px;
        background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23F8F9FA" fill-opacity="1" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,112C672,96,768,96,864,112C960,128,1056,160,1152,160C1248,160,1344,128,1392,112L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>');
        background-size: cover;
        background-position: center;
    }
    
    .footer-content {
        padding: 5rem 0 2rem;
        position: relative;
        z-index: 1;
    }
    
    .footer-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 3rem;
        margin-bottom: 3rem;
    }
    
    .footer-section {
        animation: fadeInUp 0.8s ease;
    }
    
    .footer-logo .logo-3d {
        background: linear-gradient(135deg, rgba(255, 255, 255, 0.1), rgba(32, 201, 151, 0.2));
        transform: perspective(500px) rotateX(5deg);
        margin-bottom: 1rem;
    }
    
    .footer-description {
        color: rgba(255, 255, 255, 0.8);
        line-height: 1.6;
        margin: 1rem 0;
    }
    
    .footer-social {
        display: flex;
        gap: 1rem;
        margin-top: 1.5rem;
    }
    
    .social-icon {
        width: 40px;
        height: 40px;
        background: rgba(255, 255, 255, 0.1);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.3s ease;
    }
    
    .social-icon:hover {
        background: var(--accent-teal);
        transform: translateY(-3px);
    }
    
    .social-svg {
        width: 20px;
        height: 20px;
        fill: white;
    }
    
    .footer-heading {
        color: white;
        font-size: 1.2rem;
        margin-bottom: 1.5rem;
        position: relative;
        padding-bottom: 0.5rem;
    }
    
    .footer-heading::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 40px;
        height: 3px;
        background: var(--accent-teal);
        border-radius: 2px;
    }
    
    .footer-links {
        list-style: none;
    }
    
    .footer-links li {
        margin-bottom: 0.8rem;
    }
    
    .footer-links a {
        color: rgba(255, 255, 255, 0.8);
        text-decoration: none;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
    }
    
    .footer-links a::before {
        content: '→';
        margin-right: 8px;
        opacity: 0;
        transform: translateX(-10px);
        transition: all 0.3s ease;
    }
    
    .footer-links a:hover {
        color: white;
        padding-left: 10px;
    }
    
    .footer-links a:hover::before {
        opacity: 1;
        transform: translateX(0);
    }
    
    .footer-contact {
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }
    
    .contact-item {
        display: flex;
        align-items: flex-start;
        gap: 1rem;
        color: rgba(255, 255, 255, 0.9);
    }
    
    .contact-icon {
        width: 20px;
        height: 20px;
        fill: var(--accent-teal);
        flex-shrink: 0;
        margin-top: 2px;
    }
    
    .newsletter {
        margin-top: 2rem;
    }
    
    .newsletter h5 {
        color: white;
        margin-bottom: 1rem;
        font-size: 1rem;
    }
    
    .newsletter-form {
        display: flex;
        gap: 0.5rem;
    }
    
    .newsletter-form input {
        flex: 1;
        padding: 0.75rem 1rem;
        border: none;
        border-radius: 50px;
        background: rgba(255, 255, 255, 0.1);
        color: white;
        font-size: 0.9rem;
    }
    
    .newsletter-form input::placeholder {
        color: rgba(255, 255, 255, 0.6);
    }
    
    .newsletter-form input:focus {
        outline: none;
        background: rgba(255, 255, 255, 0.2);
    }
    
    .btn-newsletter {
        width: 45px;
        height: 45px;
        background: var(--accent-teal);
        border: none;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    .btn-newsletter:hover {
        background: #1ab082;
        transform: scale(1.1);
    }
    
    .footer-bottom {
        border-top: 1px solid rgba(255, 255, 255, 0.1);
        padding-top: 2rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        gap: 2rem;
    }
    
    .footer-legal {
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }
    
    .legal-links {
        display: flex;
        flex-wrap: wrap;
        gap: 1rem;
        align-items: center;
    }
    
    .legal-links a {
        color: rgba(255, 255, 255, 0.7);
        text-decoration: none;
        font-size: 0.9rem;
        transition: color 0.3s ease;
    }
    
    .legal-links a:hover {
        color: var(--accent-teal);
    }
    
    .separator {
        color: rgba(255, 255, 255, 0.3);
    }
    
    .copyright {
        color: rgba(255, 255, 255, 0.5);
        font-size: 0.85rem;
    }
    
    .footer-certifications {
        display: flex;
        gap: 1rem;
        flex-wrap: wrap;
    }
    
    .cert-badge {
        background: rgba(255, 255, 255, 0.1);
        padding: 0.5rem 1rem;
        border-radius: 20px;
        font-size: 0.8rem;
        color: rgba(255, 255, 255, 0.9);
        border: 1px solid rgba(255, 255, 255, 0.2);
        transition: all 0.3s ease;
    }
    
    .cert-badge:hover {
        background: rgba(32, 201, 151, 0.2);
        border-color: var(--accent-teal);
    }
    
    @media (max-width: 768px) {
        .footer-grid {
            grid-template-columns: 1fr;
            gap: 2rem;
        }
        
        .footer-bottom {
            flex-direction: column;
            text-align: center;
        }
        
        .legal-links {
            justify-content: center;
        }
        
        .footer-certifications {
            justify-content: center;
        }
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Newsletter form submission
        const newsletterForm = document.getElementById('newsletterForm');
        if (newsletterForm) {
            newsletterForm.addEventListener('submit', function(e) {
                e.preventDefault();
                const email = this.querySelector('input[type="email"]').value;
                
                // Simple email validation
                if (!validateEmail(email)) {
                    showNewsletterMessage('Please enter a valid email address', 'error');
                    return;
                }
                
                // Simulate subscription
                showNewsletterMessage('Thank you for subscribing!', 'success');
                this.reset();
                
                // In production, you would make an AJAX call here
                console.log('Newsletter subscription:', email);
            });
        }
        
        function validateEmail(email) {
            const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return re.test(email);
        }
        
        function showNewsletterMessage(message, type) {
            // Remove existing messages
            const existingMsg = newsletterForm.querySelector('.newsletter-message');
            if (existingMsg) existingMsg.remove();
            
            // Create new message
            const msgDiv = document.createElement('div');
            msgDiv.className = `newsletter-message newsletter-${type}`;
            msgDiv.textContent = message;
            msgDiv.style.cssText = `
                margin-top: 10px;
                padding: 10px;
                border-radius: 5px;
                font-size: 0.9rem;
                background: ${type === 'success' ? 'rgba(32, 201, 151, 0.2)' : 'rgba(255, 107, 107, 0.2)'};
                color: ${type === 'success' ? '#20C997' : '#ff6b6b'};
                animation: fadeIn 0.3s ease;
            `;
            
            newsletterForm.appendChild(msgDiv);
            
            // Auto remove after 5 seconds
            setTimeout(() => {
                msgDiv.style.opacity = '0';
                setTimeout(() => msgDiv.remove(), 300);
            }, 5000);
        }
    });
</script>