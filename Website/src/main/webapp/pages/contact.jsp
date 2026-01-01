<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/components/header.jsp" %>

<div class="loading-bar"></div>

<!-- Contact Hero -->
<section class="contact-hero parallax-section" data-rate="0.3">
    <div class="container">
        <div class="hero-content">
            <h1 class="fade-in">Contact Us</h1>
            <p class="subtitle slide-in">Get in touch with our team of precision engineering experts</p>
        </div>
    </div>
</section>

<!-- Contact Grid -->
<section class="section contact-grid-section">
    <div class="container">
        <div class="grid-2">
            <!-- Contact Form -->
            <div class="contact-form-container fade-in">
                <h2>Send a Message</h2>
                <form id="contactForm" action="<%= contextPath %>/submit-contact" method="POST" data-ajax="true">
                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="contactName">Your Name *</label>
                            <input type="text" id="contactName" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="contactEmail">Email Address *</label>
                            <input type="email" id="contactEmail" name="email" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="contactPhone">Phone Number</label>
                        <input type="tel" id="contactPhone" name="phone">
                    </div>
                    
                    <div class="form-group">
                        <label for="contactSubject">Subject</label>
                        <input type="text" id="contactSubject" name="subject" placeholder="How can we help you?">
                    </div>
                    
                    <div class="form-group">
                        <label for="contactDepartment">Department</label>
                        <select id="contactDepartment" name="department">
                            <option value="">Select Department</option>
                            <option value="sales">Sales & Quotations</option>
                            <option value="technical">Technical Support</option>
                            <option value="parts">Parts & Service</option>
                            <option value="hr">Human Resources</option>
                            <option value="general">General Inquiry</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="contactMessage">Message *</label>
                        <textarea id="contactMessage" name="message" rows="6" required></textarea>
                        <div class="char-counter">0/2000</div>
                    </div>
                    
                    <div class="form-group consent">
                        <label class="checkbox-label">
                            <input type="checkbox" required>
                            <span class="checkbox-custom"></span>
                            I agree to the <a href="<%= contextPath %>/legal/privacy-policy">Privacy Policy</a> and consent to contact.
                        </label>
                    </div>
                    
                    <button type="submit" class="btn btn-submit">
                        <span>Send Message</span>
                        <div class="submit-spinner"></div>
                    </button>
                </form>
            </div>
            
            <!-- Contact Info -->
            <div class="contact-info-container slide-in" data-direction="right">
                <div class="contact-info-card card-3d">
                    <h2>Contact Information</h2>
                    
                    <div class="contact-details">
                        <div class="contact-item">
                            <div class="contact-icon">
                                <svg viewBox="0 0 24 24">
                                    <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5a2.5 2.5 0 010-5 2.5 2.5 0 010 5z"/>
                                </svg>
                            </div>
                            <div>
                                <h4>Address</h4>
                                <p>123 Precision Avenue<br>Tech Park, CA 94000<br>United States</p>
                            </div>
                        </div>
                        
                        <div class="contact-item">
                            <div class="contact-icon">
                                <svg viewBox="0 0 24 24">
                                    <path d="M6.62 10.79c1.44 2.83 3.76 5.14 6.59 6.59l2.2-2.2c.27-.27.67-.36 1.02-.24 1.12.37 2.33.57 3.57.57.55 0 1 .45 1 1V20c0 .55-.45 1-1 1-9.39 0-17-7.61-17-17 0-.55.45-1 1-1h3.5c.55 0 1 .45 1 1 0 1.25.2 2.45.57 3.57.11.35.03.74-.25 1.02l-2.2 2.2z"/>
                                </svg>
                            </div>
                            <div>
                                <h4>Phone</h4>
                                <p>+1 (555) 123-4567<br>Monday - Friday: 8AM - 5PM PST</p>
                            </div>
                        </div>
                        
                        <div class="contact-item">
                            <div class="contact-icon">
                                <svg viewBox="0 0 24 24">
                                    <path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/>
                                </svg>
                            </div>
                            <div>
                                <h4>Email</h4>
                                <p>info@precisiontech.com<br>response within 24 hours</p>
                            </div>
                        </div>
                        
                        <div class="contact-item">
                            <div class="contact-icon">
                                <svg viewBox="0 0 24 24">
                                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"/>
                                </svg>
                            </div>
                            <div>
                                <h4>Emergency Support</h4>
                                <p>+1 (555) 987-6543<br>24/7 technical support</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="contact-departments">
                        <h3>Department Contacts</h3>
                        <div class="department-list">
                            <div class="department">
                                <strong>Sales:</strong> sales@precisiontech.com
                            </div>
                            <div class="department">
                                <strong>Technical Support:</strong> support@precisiontech.com
                            </div>
                            <div class="department">
                                <strong>Parts & Service:</strong> parts@precisiontech.com
                            </div>
                            <div class="department">
                                <strong>Human Resources:</strong> hr@precisiontech.com
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Management Team -->
<section class="section team-section">
    <div class="container">
        <h2 class="text-center fade-in">Management Team</h2>
        <p class="section-subtitle text-center slide-in">Meet our leadership team</p>
        
        <div class="team-grid">
            <div class="team-member card-3d">
                <div class="member-photo">
                    <img src="<%= contextPath %>/assets/images/about/team1.jpg" alt="John Davis" loading="lazy">
                </div>
                <div class="member-info">
                    <h3>John Davis</h3>
                    <p class="position">Technical Director</p>
                    <p class="bio">25+ years in precision engineering. PhD in Mechanical Engineering.</p>
                    <div class="member-contact">
                        <span>jdavis@precisiontech.com</span>
                        <span>Ext. 101</span>
                    </div>
                </div>
            </div>
            
            <div class="team-member card-3d">
                <div class="member-photo">
                    <img src="<%= contextPath %>/assets/images/about/team2.jpg" alt="Sarah Roberts" loading="lazy">
                </div>
                <div class="member-info">
                    <h3>Sarah Roberts</h3>
                    <p class="position">Sales Manager</p>
                    <p class="bio">Expert in medical device sales with 15 years of experience.</p>
                    <div class="member-contact">
                        <span>sroberts@precisiontech.com</span>
                        <span>Ext. 102</span>
                    </div>
                </div>
            </div>
            
            <div class="team-member card-3d">
                <div class="member-photo">
                    <img src="<%= contextPath %>/assets/images/about/team3.jpg" alt="Michael Chen" loading="lazy">
                </div>
                <div class="member-info">
                    <h3>Michael Chen</h3>
                    <p class="position">Engineering Manager</p>
                    <p class="bio">Specializes in aerospace applications and composite materials.</p>
                    <div class="member-contact">
                        <span>mchen@precisiontech.com</span>
                        <span>Ext. 103</span>
                    </div>
                </div>
            </div>
            
            <div class="team-member card-3d">
                <div class="member-photo">
                    <img src="<%= contextPath %>/assets/images/about/team4.jpg" alt="Lisa Rodriguez" loading="lazy">
                </div>
                <div class="member-info">
                    <h3>Lisa Rodriguez</h3>
                    <p class="position">Quality Director</p>
                    <p class="bio">Ensures all products meet ISO 9001 and 13485 standards.</p>
                    <div class="member-contact">
                        <span>lrodriguez@precisiontech.com</span>
                        <span>Ext. 104</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Interactive Map -->
<section class="section map-section">
    <div class="container">
        <h2 class="text-center fade-in">Our Location</h2>
        <div class="map-container slide-in">
            <!-- Custom SVG Map -->
            <div class="svg-map">
                <svg viewBox="0 0 800 400">
                    <!-- Map background -->
                    <rect width="800" height="400" fill="#f8f9fa" rx="20"/>
                    
                    <!-- Custom map illustration -->
                    <path d="M100,200 Q250,150 400,200 T700,180" stroke="#004080" stroke-width="3" fill="none"/>
                    <path d="M150,250 Q300,220 450,250 T650,230" stroke="#20C997" stroke-width="2" fill="none"/>
                    
                    <!-- Location marker -->
                    <g class="location-marker" transform="translate(400, 200)">
                        <circle cx="0" cy="0" r="15" fill="#004080" opacity="0.8">
                            <animate attributeName="r" values="15;20;15" dur="2s" repeatCount="indefinite"/>
                            <animate attributeName="opacity" values="0.8;0.4;0.8" dur="2s" repeatCount="indefinite"/>
                        </circle>
                        <circle cx="0" cy="0" r="8" fill="#FFA500"/>
                        <path d="M0,-12 L4,0 L0,4 L-4,0 Z" fill="#FFFFFF"/>
                    </g>
                    
                    <!-- Animated routes -->
                    <g class="route-animation">
                        <circle cx="100" cy="200" r="3" fill="#004080">
                            <animate attributeName="cy" values="200;150;200" dur="3s" repeatCount="indefinite"/>
                        </circle>
                        <circle cx="700" cy="180" r="3" fill="#20C997">
                            <animate attributeName="cy" values="180;160;180" dur="3s" repeatCount="indefinite"/>
                        </circle>
                    </g>
                </svg>
                
                <div class="map-overlay">
                    <div class="map-info">
                        <h3>Precision Tech Headquarters</h3>
                        <p>Located in the heart of Silicon Valley's tech corridor.</p>
                        <div class="map-stats">
                            <div class="stat">
                                <strong>20,000</strong>
                                <span>sq ft facility</span>
                            </div>
                            <div class="stat">
                                <strong>50+</strong>
                                <span>engineers on site</span>
                            </div>
                            <div class="stat">
                                <strong>24/7</strong>
                                <span>production capability</span>
                            </div>
                        </div>
                        <a href="https://maps.google.com/?q=123+Precision+Avenue+Tech+Park+CA+94000" 
                           target="_blank" class="btn btn-map">
                            Get Directions
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- FAQ Section -->
<section class="section faq-section">
    <div class="container">
        <h2 class="text-center fade-in">Frequently Asked Questions</h2>
        
        <div class="faq-grid">
            <div class="faq-item card-3d">
                <button class="faq-question">
                    What are your lead times?
                    <span class="faq-icon">+</span>
                </button>
                <div class="faq-answer">
                    <p>Standard lead times range from 4-8 weeks depending on product complexity and customization. Rush orders (50% premium) can reduce lead time to 2-3 weeks.</p>
                </div>
            </div>
            
            <div class="faq-item card-3d">
                <button class="faq-question">
                    Do you offer customization?
                    <span class="faq-icon">+</span>
                </button>
                <div class="faq-answer">
                    <p>Yes, we specialize in custom engineering solutions. Our team works closely with clients to develop tailored products meeting specific application requirements.</p>
                </div>
            </div>
            
            <div class="faq-item card-3d">
                <button class="faq-question">
                    What certifications do you hold?
                    <span class="faq-icon">+</span>
                </button>
                <div class="faq-answer">
                    <p>We are ISO 9001:2015 and ISO 13485:2016 certified. Our facility is FDA registered and we comply with RoHS, REACH, and Conflict Minerals regulations.</p>
                </div>
            </div>
            
            <div class="faq-item card-3d">
                <button class="faq-question">
                    Do you provide training and support?
                    <span class="faq-icon">+</span>
                </button>
                <div class="faq-answer">
                    <p>Comprehensive training and 24/7 technical support are included with all our products. We offer both on-site and remote training options.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<style>
    /* Contact Hero */
    .contact-hero {
        min-height: 40vh;
        background: linear-gradient(135deg, rgba(0, 64, 128, 0.9) 0%, rgba(255, 165, 0, 0.7) 100%),
                    url('<%= contextPath %>/assets/images/contact/hero.jpg');
        background-size: cover;
        background-position: center;
        display: flex;
        align-items: center;
        text-align: center;
        color: white;
        padding-top: 100px;
    }
    
    /* Contact Grid */
    .contact-grid-section {
        padding: 5rem 0;
        background: var(--white);
    }
    
    .contact-form-container {
        padding: 2rem;
    }
    
    .contact-form-container h2 {
        margin-bottom: 2rem;
    }
    
    .contact-info-card {
        padding: 2rem;
        height: 100%;
    }
    
    .contact-details {
        margin-bottom: 2rem;
    }
    
    .contact-item {
        display: flex;
        gap: 1rem;
        margin-bottom: 1.5rem;
        align-items: flex-start;
    }
    
    .contact-icon {
        width: 40px;
        height: 40px;
        background: linear-gradient(135deg, var(--primary-blue), var(--accent-teal));
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-shrink: 0;
    }
    
    .contact-icon svg {
        width: 20px;
        height: 20px;
        fill: white;
    }
    
    .contact-item h4 {
        margin-bottom: 0.25rem;
        color: var(--primary-blue);
    }
    
    .contact-departments {
        margin-top: 2rem;
        padding-top: 2rem;
        border-top: 1px solid #e9ecef;
    }
    
    .department-list {
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
        margin-top: 1rem;
    }
    
    .department {
        padding: 0.75rem;
        background: var(--background-light);
        border-radius: 8px;
        font-size: 0.9rem;
    }
    
    /* Team Section */
    .team-section {
        padding: 5rem 0;
        background: var(--background-light);
    }
    
    .team-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 2rem;
        margin-top: 3rem;
    }
    
    .team-member {
        text-align: center;
        transition: all 0.4s ease;
    }
    
    .team-member:hover {
        transform: translateY(-10px);
    }
    
    .member-photo {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        overflow: hidden;
        margin: 0 auto 1.5rem;
        border: 3px solid var(--accent-teal);
    }
    
    .member-photo img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.5s ease;
    }
    
    .team-member:hover .member-photo img {
        transform: scale(1.1);
    }
    
    .position {
        color: var(--accent-teal);
        font-weight: 600;
        margin-bottom: 1rem;
    }
    
    .bio {
        color: var(--secondary-gray);
        font-size: 0.9rem;
        margin-bottom: 1rem;
    }
    
    .member-contact {
        display: flex;
        flex-direction: column;
        gap: 0.25rem;
        font-size: 0.8rem;
        color: var(--secondary-gray);
    }
    
    /* Map Section */
    .map-section {
        padding: 5rem 0;
        background: var(--white);
    }
    
    .map-container {
        margin-top: 3rem;
        border-radius: 20px;
        overflow: hidden;
        box-shadow: var(--shadow-lg);
    }
    
    .svg-map {
        position: relative;
        background: white;
    }
    
    .map-overlay {
        position: absolute;
        top: 30px;
        right: 30px;
        background: rgba(255, 255, 255, 0.95);
        padding: 2rem;
        border-radius: 15px;
        max-width: 300px;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(0, 64, 128, 0.1);
    }
    
    .map-info h3 {
        margin-bottom: 1rem;
    }
    
    .map-stats {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 1rem;
        margin: 1.5rem 0;
    }
    
    .map-stats .stat {
        text-align: center;
    }
    
    .map-stats strong {
        display: block;
        font-size: 1.5rem;
        color: var(--primary-blue);
    }
    
    .map-stats span {
        font-size: 0.8rem;
        color: var(--secondary-gray);
    }
    
    .btn-map {
        width: 100%;
        text-align: center;
    }
    
    /* FAQ Section */
    .faq-section {
        padding: 5rem 0;
        background: var(--background-light);
    }
    
    .faq-grid {
        max-width: 800px;
        margin: 3rem auto 0;
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }
    
    .faq-item {
        border-radius: 15px;
        overflow: hidden;
    }
    
    .faq-question {
        width: 100%;
        padding: 1.5rem;
        background: none;
        border: none;
        text-align: left;
        font-size: 1.1rem;
        font-weight: 600;
        color: var(--primary-blue);
        cursor: pointer;
        display: flex;
        justify-content: space-between;
        align-items: center;
        transition: background 0.3s ease;
    }
    
    .faq-question:hover {
        background: rgba(0, 64, 128, 0.05);
    }
    
    .faq-icon {
        font-size: 1.5rem;
        transition: transform 0.3s ease;
    }
    
    .faq-item.active .faq-icon {
        transform: rotate(45deg);
    }
    
    .faq-answer {
        padding: 0 1.5rem;
        max-height: 0;
        overflow: hidden;
        transition: all 0.3s ease;
    }
    
    .faq-item.active .faq-answer {
        padding: 0 1.5rem 1.5rem;
        max-height: 500px;
    }
    
    /* Form Styles for Contact Page */
    .consent {
        margin: 1.5rem 0;
    }
    
    .consent a {
        color: var(--accent-teal);
        text-decoration: none;
    }
    
    .consent a:hover {
        text-decoration: underline;
    }
    
    @media (max-width: 768px) {
        .grid-2 {
            grid-template-columns: 1fr;
        }
        
        .map-overlay {
            position: static;
            max-width: none;
            margin-top: 2rem;
        }
        
        .map-stats {
            grid-template-columns: 1fr;
        }
        
        .team-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // FAQ Accordion
        const faqItems = document.querySelectorAll('.faq-item');
        faqItems.forEach(item => {
            const question = item.querySelector('.faq-question');
            question.addEventListener('click', () => {
                // Close other items
                faqItems.forEach(otherItem => {
                    if (otherItem !== item && otherItem.classList.contains('active')) {
                        otherItem.classList.remove('active');
                    }
                });
                
                // Toggle current item
                item.classList.toggle('active');
            });
        });
        
        // Form character counter
        const messageField = document.getElementById('contactMessage');
        const charCounter = document.querySelector('.char-counter');
        
        if (messageField && charCounter) {
            messageField.addEventListener('input', function() {
                const maxLength = 2000;
                const currentLength = this.value.length;
                charCounter.textContent = `${currentLength}/${maxLength}`;
                charCounter.style.color = currentLength > maxLength * 0.9 ? '#ff6b6b' : '#4B4B4B';
            });
        }
        
        // Form submission handling
        const contactForm = document.getElementById('contactForm');
        if (contactForm) {
            contactForm.addEventListener('submit', function(e) {
                const submitBtn = this.querySelector('.btn-submit');
                const spinner = this.querySelector('.submit-spinner');
                const btnText = submitBtn.querySelector('span');
                
                // Show loading state
                btnText.textContent = 'Sending...';
                spinner.style.display = 'block';
                submitBtn.disabled = true;
                
                // Reset button after 3 seconds (simulate AJAX)
                setTimeout(() => {
                    btnText.textContent = 'Send Message';
                    spinner.style.display = 'none';
                    submitBtn.disabled = false;
                }, 3000);
            });
        }
        
        // Animate map markers
        const marker = document.querySelector('.location-marker');
        if (marker) {
            setInterval(() => {
                marker.style.transform = `translate(400px, 200px) scale(${1 + Math.random() * 0.1})`;
                setTimeout(() => {
                    marker.style.transform = 'translate(400px, 200px) scale(1)';
                }, 100);
            }, 3000);
        }
    });
</script>

<%@ include file="/components/footer.jsp" %>