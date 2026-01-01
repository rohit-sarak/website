<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/components/header.jsp" %>

<div class="loading-bar"></div>

<!-- Products Hero -->
<section class="products-hero parallax-section" data-rate="0.4">
    <div class="container">
        <div class="hero-content">
            <h1 class="fade-in">Precision Products</h1>
            <p class="subtitle slide-in">Engineered for excellence across medical, industrial, and aerospace applications</p>
        </div>
    </div>
</section>

<!-- Product Categories -->
<section class="section categories-section">
    <div class="container">
        <div class="section-header text-center">
            <h2 class="fade-in">Product Categories</h2>
            <p class="section-subtitle slide-in">Browse our comprehensive range of precision-engineered solutions</p>
        </div>
        
        <div class="categories-grid">
            <a href="<%= contextPath %>/products/articulated-arms" class="category-card card-3d">
                <div class="category-icon">
                    <svg viewBox="0 0 24 24">
                        <path d="M16 18l2.29-2.29-4.88-4.88-4 4L2 7.41 3.41 6l6 6 4-4 6.3 6.29L22 12v6h-6z"/>
                    </svg>
                </div>
                <h3>Articulated Arms</h3>
                <p>Multi-axis positioning systems with micron-level precision</p>
                <span class="category-link">Explore →</span>
            </a>
            
            <a href="<%= contextPath %>/products/focusing-handpieces" class="category-card card-3d">
                <div class="category-icon">
                    <svg viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="3.2"/>
                        <path d="M9 2L7.17 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2h-3.17L15 2H9zm3 15c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5z"/>
                    </svg>
                </div>
                <h3>Focusing Handpieces</h3>
                <p>Ergonomic surgical tools with precise focal control</p>
                <span class="category-link">Explore →</span>
            </a>
            
            <a href="<%= contextPath %>/products/laparoscope-coupler" class="category-card card-3d">
                <div class="category-icon">
                    <svg viewBox="0 0 24 24">
                        <path d="M17 7l-1.41 1.41L18.17 11H8v2h10.17l-2.58 2.58L17 17l5-5zM4 5h8V3H4c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h8v-2H4V5z"/>
                    </svg>
                </div>
                <h3>Laparoscope Coupler</h3>
                <p>High-resolution optical coupling systems</p>
                <span class="category-link">Explore →</span>
            </a>
            
            <a href="<%= contextPath %>/products/micromanipulators" class="category-card card-3d">
                <div class="category-icon">
                    <svg viewBox="0 0 24 24">
                        <path d="M7 19c-1.1 0-2 .9-2 2h14c0-1.1-.9-2-2-2h-4v-2h3c1.1 0 2-.9 2-2h-8c-1.66 0-3-1.34-3-3 0-1.09.59-2.04 1.46-2.56C8.17 9.03 8 8.54 8 8c0-.21.04-.42.09-.62C6.28 8.13 5 9.92 5 12c0 2.76 2.24 5 5 5v2H7z"/>
                        <path d="M10.56 5.51C11.91 5.54 13 6.64 13 8c0 .75-.33 1.41-.85 1.87l.59 1.62.94-.34.34.94 1.88-.68-.34-.94.94-.34-2.74-7.53-.94.34-.34-.94-1.88.68.34.94-.94.35.56 1.54z"/>
                        <circle cx="10.5" cy="8" r="1.5"/>
                    </svg>
                </div>
                <h3>Micromanipulators</h3>
                <p>Sub-micron precision positioning systems</p>
                <span class="category-link">Explore →</span>
            </a>
            
            <a href="<%= contextPath %>/products/scanners" class="category-card card-3d">
                <div class="category-icon">
                    <svg viewBox="0 0 24 24">
                        <path d="M19.35 10.04C18.67 6.59 15.64 4 12 4 9.11 4 6.6 5.64 5.35 8.04 2.34 8.36 0 10.91 0 14c0 3.31 2.69 6 6 6h13c2.76 0 5-2.24 5-5 0-2.64-2.05-4.78-4.65-4.96zM19 18H6c-2.21 0-4-1.79-4-4s1.79-4 4-4h.71C7.37 7.69 9.48 6 12 6c3.04 0 5.5 2.46 5.5 5.5v.5H19c1.66 0 3 1.34 3 3s-1.34 3-3 3z"/>
                    </svg>
                </div>
                <h3>3D Scanners</h3>
                <p>High-precision non-contact measurement systems</p>
                <span class="category-link">Explore →</span>
            </a>
        </div>
    </div>
</section>

<!-- Products Grid -->
<section class="section products-grid-section">
    <div class="container">
        <div class="section-header">
            <h2 class="fade-in">Featured Products</h2>
            <div class="product-filters slide-in">
                <button class="filter-btn active" data-filter="all">All</button>
                <button class="filter-btn" data-filter="medical">Medical</button>
                <button class="filter-btn" data-filter="industrial">Industrial</button>
                <button class="filter-btn" data-filter="aerospace">Aerospace</button>
            </div>
        </div>
        
        <div class="products-grid">
            <!-- Product 1 -->
            <div class="product-card card-3d" data-category="medical">
                <div class="product-image">
                    <img src="<%= contextPath %>/assets/images/products/articulated-arms/arm-medical.jpg" 
                         alt="Medical Articulated Arm" loading="lazy">
                    <div class="product-overlay">
                        <button class="quick-view" data-product="1">Quick View</button>
                    </div>
                </div>
                <div class="product-info">
                    <h3>Medical Articulated Arm MA-2000</h3>
                    <p class="product-description">Sterilizable 6-axis arm for surgical applications with 0.1mm precision.</p>
                    <div class="product-specs">
                        <span class="spec"><strong>Precision:</strong> ±0.1mm</span>
                        <span class="spec"><strong>Load:</strong> 5kg</span>
                        <span class="spec"><strong>Reach:</strong> 1.2m</span>
                    </div>
                    <div class="product-actions">
                        <button class="btn btn-inquiry" data-product="MA-2000">Request Quote</button>
                        <a href="<%= contextPath %>/products/articulated-arms" class="btn-details">Details →</a>
                    </div>
                </div>
            </div>
            
            <!-- Product 2 -->
            <div class="product-card card-3d" data-category="industrial">
                <div class="product-image">
                    <img src="<%= contextPath %>/assets/images/products/focusing-handpieces/fh-industrial.jpg" 
                         alt="Industrial Focusing Handpiece" loading="lazy">
                    <div class="product-overlay">
                        <button class="quick-view" data-product="2">Quick View</button>
                    </div>
                </div>
                <div class="product-info">
                    <h3>Industrial Focusing Handpiece FH-500</h3>
                    <p class="product-description">Heavy-duty focusing system for laser cutting and welding applications.</p>
                    <div class="product-specs">
                        <span class="spec"><strong>Power:</strong> 500W</span>
                        <span class="spec"><strong>Focal Range:</strong> 50-200mm</span>
                        <span class="spec"><strong>Cooling:</strong> Air/Water</span>
                    </div>
                    <div class="product-actions">
                        <button class="btn btn-inquiry" data-product="FH-500">Request Quote</button>
                        <a href="<%= contextPath %>/products/focusing-handpieces" class="btn-details">Details →</a>
                    </div>
                </div>
            </div>
            
            <!-- Product 3 -->
            <div class="product-card card-3d" data-category="aerospace">
                <div class="product-image">
                    <img src="<%= contextPath %>/assets/images/products/micromanipulators/mm-aerospace.jpg" 
                         alt="Aerospace Micromanipulator" loading="lazy">
                    <div class="product-overlay">
                        <button class="quick-view" data-product="3">Quick View</button>
                    </div>
                </div>
                <div class="product-info">
                    <h3>Aerospace Micromanipulator MM-8000</h3>
                    <p class="product-description">Vibration-damped system for satellite component assembly.</p>
                    <div class="product-specs">
                        <span class="spec"><strong>Resolution:</strong> 0.1μm</span>
                        <span class="spec"><strong>Travel:</strong> 100mm</span>
                        <span class="spec"><strong>Vibration:</strong> < 0.5g</span>
                    </div>
                    <div class="product-actions">
                        <button class="btn btn-inquiry" data-product="MM-8000">Request Quote</button>
                        <a href="<%= contextPath %>/products/micromanipulators" class="btn-details">Details →</a>
                    </div>
                </div>
            </div>
            
            <!-- Product 4 -->
            <div class="product-card card-3d" data-category="medical">
                <div class="product-image">
                    <img src="<%= contextPath %>/assets/images/products/scanners/scanner-medical.jpg" 
                         alt="Medical 3D Scanner" loading="lazy">
                    <div class="product-overlay">
                        <button class="quick-view" data-product="4">Quick View</button>
                    </div>
                </div>
                <div class="product-info">
                    <h3>Medical 3D Scanner MS-300</h3>
                    <p class="product-description">Non-contact scanner for prosthetics and orthotics with 0.05mm accuracy.</p>
                    <div class="product-specs">
                        <span class="spec"><strong>Accuracy:</strong> ±0.05mm</span>
                        <span class="spec"><strong>Speed:</strong> 1M points/sec</span>
                        <span class="spec"><strong>Safe Class:</strong> 1M Laser</span>
                    </div>
                    <div class="product-actions">
                        <button class="btn btn-inquiry" data-product="MS-300">Request Quote</button>
                        <a href="<%= contextPath %>/products/scanners" class="btn-details">Details →</a>
                    </div>
                </div>
            </div>
            
            <!-- Product 5 -->
            <div class="product-card card-3d" data-category="industrial">
                <div class="product-image">
                    <img src="<%= contextPath %>/assets/images/products/laparoscope-coupler/lc-industrial.jpg" 
                         alt="Industrial Optical Coupler" loading="lazy">
                    <div class="product-overlay">
                        <button class="quick-view" data-product="5">Quick View</button>
                    </div>
                </div>
                <div class="product-info">
                    <h3>Optical Coupler OC-1000</h3>
                    <p class="product-description">High-resolution coupling for industrial inspection systems.</p>
                    <div class="product-specs">
                        <span class="spec"><strong>Resolution:</strong> 4K</span>
                        <span class="spec"><strong>Interface:</strong> HDMI/USB3</span>
                        <span class="spec"><strong>Magnification:</strong> 10-100x</span>
                    </div>
                    <div class="product-actions">
                        <button class="btn btn-inquiry" data-product="OC-1000">Request Quote</button>
                        <a href="<%= contextPath %>/products/laparoscope-coupler" class="btn-details">Details →</a>
                    </div>
                </div>
            </div>
            
            <!-- Product 6 -->
            <div class="product-card card-3d" data-category="aerospace">
                <div class="product-image">
                    <img src="<%= contextPath %>/assets/images/products/articulated-arms/arm-aerospace.jpg" 
                         alt="Aerospace Articulated Arm" loading="lazy">
                    <div class="product-overlay">
                        <button class="quick-view" data-product="6">Quick View</button>
                    </div>
                </div>
                <div class="product-info">
                    <h3>Aerospace Arm AA-6000</h3>
                    <p class="product-description">Carbon fiber arm for composite material inspection and assembly.</p>
                    <div class="product-specs">
                        <span class="spec"><strong>Material:</strong> Carbon Fiber</span>
                        <span class="spec"><strong>Weight:</strong> 8kg</span>
                        <span class="spec"><strong>IP Rating:</strong> IP65</span>
                    </div>
                    <div class="product-actions">
                        <button class="btn btn-inquiry" data-product="AA-6000">Request Quote</button>
                        <a href="<%= contextPath %>/products/articulated-arms" class="btn-details">Details →</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Quick View Modal -->
<div class="modal" id="quickViewModal">
    <div class="modal-content">
        <button class="modal-close">&times;</button>
        <div class="modal-body" id="modalBody">
            <!-- Content loaded dynamically -->
        </div>
    </div>
</div>

<!-- Inquiry Form Modal -->
<div class="modal" id="inquiryModal">
    <div class="modal-content">
        <button class="modal-close">&times;</button>
        <div class="modal-header">
            <h3>Product Inquiry</h3>
            <p id="inquiryProductName"></p>
        </div>
        <div class="modal-body">
            <form id="productInquiryForm" action="<%= contextPath %>/submit-inquiry" method="POST" data-ajax="true">
                <input type="hidden" id="inquiryProduct" name="productName">
                
                <div class="form-group">
                    <label for="inquiryName">Your Name *</label>
                    <input type="text" id="inquiryName" name="name" required>
                </div>
                
                <div class="form-group">
                    <label for="inquiryEmail">Email Address *</label>
                    <input type="email" id="inquiryEmail" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="inquiryCompany">Company</label>
                    <input type="text" id="inquiryCompany" name="company">
                </div>
                
                <div class="form-group">
                    <label for="inquiryPhone">Phone</label>
                    <input type="tel" id="inquiryPhone" name="phone">
                </div>
                
                <div class="form-group">
                    <label for="inquiryQuantity">Estimated Quantity</label>
                    <select id="inquiryQuantity" name="quantity">
                        <option value="">Select</option>
                        <option value="1-10">1-10 units</option>
                        <option value="11-50">11-50 units</option>
                        <option value="51-100">51-100 units</option>
                        <option value="100+">100+ units</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="inquiryApplication">Application</label>
                    <textarea id="inquiryApplication" name="application" rows="3"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="inquiryTimeline">Project Timeline</label>
                    <select id="inquiryTimeline" name="timeline">
                        <option value="">Select</option>
                        <option value="ASAP">ASAP</option>
                        <option value="1-3 months">1-3 months</option>
                        <option value="3-6 months">3-6 months</option>
                        <option value="6+ months">6+ months</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="inquiryAdditional">Additional Information</label>
                    <textarea id="inquiryAdditional" name="additionalInfo" rows="4"></textarea>
                </div>
                
                <button type="submit" class="btn btn-submit">Submit Inquiry</button>
            </form>
        </div>
    </div>
</div>

<style>
    /* Products Hero */
    .products-hero {
        min-height: 60vh;
        background: linear-gradient(135deg, rgba(0, 64, 128, 0.9) 0%, rgba(32, 201, 151, 0.7) 100%),
                    url('<%= contextPath %>/assets/images/products/hero.jpg');
        background-size: cover;
        background-position: center;
        display: flex;
        align-items: center;
        text-align: center;
        color: white;
        padding-top: 100px;
    }
    
    .hero-content h1 {
        -webkit-text-fill-color: white;
        background: transparent;
        margin-bottom: 1rem;
    }
    
    .subtitle {
        font-size: 1.2rem;
        opacity: 0.9;
        max-width: 600px;
        margin: 0 auto;
    }
    
    /* Categories */
    .categories-section {
        padding: 5rem 0;
        background: var(--white);
    }
    
    .section-header {
        margin-bottom: 3rem;
    }
    
    .text-center {
        text-align: center;
    }
    
    .categories-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 2rem;
    }
    
    .category-card {
        text-align: center;
        padding: 2rem 1.5rem;
        text-decoration: none;
        color: inherit;
        transition: all 0.4s ease;
    }
    
    .category-card:hover {
        transform: translateY(-10px) rotateY(5deg);
    }
    
    .category-icon {
        width: 70px;
        height: 70px;
        background: linear-gradient(135deg, var(--primary-blue), var(--accent-teal));
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 1.5rem;
    }
    
    .category-icon svg {
        width: 35px;
        height: 35px;
        fill: white;
    }
    
    .category-card h3 {
        margin-bottom: 0.5rem;
        font-size: 1.3rem;
    }
    
    .category-card p {
        color: var(--secondary-gray);
        font-size: 0.9rem;
        margin-bottom: 1rem;
    }
    
    .category-link {
        color: var(--accent-teal);
        font-weight: 600;
        display: inline-block;
        transition: transform 0.3s ease;
    }
    
    .category-card:hover .category-link {
        transform: translateX(5px);
    }
    
    /* Products Grid */
    .products-grid-section {
        padding: 5rem 0;
        background: var(--background-light);
    }
    
    .product-filters {
        display: flex;
        gap: 1rem;
        justify-content: center;
        flex-wrap: wrap;
        margin-top: 2rem;
    }
    
    .filter-btn {
        padding: 0.75rem 1.5rem;
        background: transparent;
        border: 2px solid var(--primary-blue);
        color: var(--primary-blue);
        border-radius: 50px;
        cursor: pointer;
        font-weight: 600;
        transition: all 0.3s ease;
    }
    
    .filter-btn.active {
        background: var(--primary-blue);
        color: white;
    }
    
    .filter-btn:hover:not(.active) {
        background: rgba(0, 64, 128, 0.1);
    }
    
    .products-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
        gap: 2rem;
        margin-top: 3rem;
    }
    
    .product-card {
        display: flex;
        flex-direction: column;
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    }
    
    .product-card:hover {
        transform: translateY(-10px) scale(1.02);
    }
    
    .product-image {
        position: relative;
        overflow: hidden;
        border-radius: 15px 15px 0 0;
        height: 200px;
    }
    
    .product-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.5s ease;
    }
    
    .product-card:hover .product-image img {
        transform: scale(1.1);
    }
    
    .product-overlay {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 64, 128, 0.8);
        display: flex;
        align-items: center;
        justify-content: center;
        opacity: 0;
        transition: opacity 0.3s ease;
    }
    
    .product-card:hover .product-overlay {
        opacity: 1;
    }
    
    .quick-view {
        padding: 0.75rem 1.5rem;
        background: white;
        color: var(--primary-blue);
        border: none;
        border-radius: 50px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    .quick-view:hover {
        background: var(--accent-teal);
        color: white;
        transform: scale(1.1);
    }
    
    .product-info {
        padding: 1.5rem;
        flex-grow: 1;
        display: flex;
        flex-direction: column;
    }
    
    .product-info h3 {
        margin-bottom: 0.5rem;
        font-size: 1.2rem;
    }
    
    .product-description {
        color: var(--secondary-gray);
        font-size: 0.9rem;
        margin-bottom: 1rem;
        flex-grow: 1;
    }
    
    .product-specs {
        display: flex;
        flex-wrap: wrap;
        gap: 1rem;
        margin-bottom: 1.5rem;
        padding: 1rem;
        background: var(--background-light);
        border-radius: 10px;
    }
    
    .spec {
        font-size: 0.8rem;
        color: var(--secondary-gray);
    }
    
    .spec strong {
        color: var(--primary-blue);
    }
    
    .product-actions {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: auto;
    }
    
    .btn-inquiry {
        padding: 0.75rem 1.5rem;
        font-size: 0.9rem;
    }
    
    .btn-details {
        color: var(--accent-teal);
        text-decoration: none;
        font-weight: 600;
        transition: transform 0.3s ease;
    }
    
    .btn-details:hover {
        transform: translateX(5px);
    }
    
    /* Modal Styles */
    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.8);
        z-index: 2000;
        align-items: center;
        justify-content: center;
        padding: 20px;
        backdrop-filter: blur(5px);
    }
    
    .modal-content {
        background: white;
        border-radius: 20px;
        max-width: 800px;
        width: 100%;
        max-height: 90vh;
        overflow-y: auto;
        position: relative;
        animation: modalSlideIn 0.3s ease;
    }
    
    @keyframes modalSlideIn {
        from {
            opacity: 0;
            transform: translateY(-50px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    
    .modal-close {
        position: absolute;
        top: 20px;
        right: 20px;
        background: none;
        border: none;
        font-size: 2rem;
        cursor: pointer;
        color: var(--secondary-gray);
        z-index: 10;
        transition: color 0.3s ease;
    }
    
    .modal-close:hover {
        color: var(--accent-teal);
    }
    
    .modal-header {
        padding: 2rem 2rem 1rem;
        border-bottom: 1px solid #e9ecef;
    }
    
    .modal-body {
        padding: 2rem;
    }
    
    @media (max-width: 768px) {
        .products-grid {
            grid-template-columns: 1fr;
        }
        
        .categories-grid {
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
        }
        
        .modal-content {
            max-height: 95vh;
        }
    }
</style>

<script src="<%= contextPath %>/assets/js/products.js"></script>

<%@ include file="/components/footer.jsp" %>