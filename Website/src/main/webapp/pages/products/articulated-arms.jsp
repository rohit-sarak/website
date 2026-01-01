<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/components/header.jsp" %>

<div class="loading-bar"></div>

<!-- Product Hero -->
<section class="product-hero" style="background: linear-gradient(135deg, #004080, #20C997);">
    <div class="container">
        <div class="hero-content">
            <nav class="breadcrumb">
                <a href="<%= contextPath %>/home">Home</a> /
                <a href="<%= contextPath %>/products">Products</a> /
                <span>Articulated Arms</span>
            </nav>
            <h1 class="fade-in">Articulated Arms</h1>
            <p class="subtitle slide-in">Multi-axis precision positioning systems with sub-millimeter accuracy</p>
        </div>
    </div>
</section>

<!-- Product Overview -->
<section class="section product-overview">
    <div class="container">
        <div class="grid-2">
            <div class="product-gallery fade-in">
                <div class="main-image">
                    <img src="<%= contextPath %>/assets/images/products/articulated-arms/main.jpg" 
                         alt="Articulated Arm Main Image" id="mainImage" loading="lazy">
                    <div class="image-badge">Patent Pending</div>
                </div>
                <div class="thumbnail-grid">
                    <img src="<%= contextPath %>/assets/images/products/articulated-arms/thumb1.jpg" 
                         alt="Side View" class="thumbnail active" data-image="main.jpg">
                    <img src="<%= contextPath %>/assets/images/products/articulated-arms/thumb2.jpg" 
                         alt="Close-up" class="thumbnail" data-image="detail.jpg">
                    <img src="<%= contextPath %>/assets/images/products/articulated-arms/thumb3.jpg" 
                         alt="In Use" class="thumbnail" data-image="use.jpg">
                    <img src="<%= contextPath %>/assets/images/products/articulated-arms/thumb4.jpg" 
                         alt="Technical Drawing" class="thumbnail" data-image="drawing.jpg">
                </div>
            </div>
            
            <div class="product-details slide-in" data-direction="right">
                <div class="product-header">
                    <h2>MA-Series Articulated Arms</h2>
                    <div class="product-rating">
                        <div class="stars">★★★★★</div>
                        <span class="rating-text">4.9/5 (47 reviews)</span>
                    </div>
                </div>
                
                <div class="product-description">
                    <p>Our MA-Series articulated arms represent the pinnacle of precision positioning technology. With 6 degrees of freedom and micron-level repeatability, these systems are engineered for the most demanding medical, industrial, and research applications.</p>
                </div>
                
                <div class="product-specs-summary">
                    <div class="spec-item">
                        <span class="spec-label">Accuracy:</span>
                        <span class="spec-value">±0.1mm</span>
                    </div>
                    <div class="spec-item">
                        <span class="spec-label">Repeatability:</span>
                        <span class="spec-value">±0.05mm</span>
                    </div>
                    <div class="spec-item">
                        <span class="spec-label">Payload Capacity:</span>
                        <span class="spec-value">Up to 10kg</span>
                    </div>
                    <div class="spec-item">
                        <span class="spec-label">Reach:</span>
                        <span class="spec-value">1.5 meters</span>
                    </div>
                </div>
                
                <div class="product-variants">
                    <h4>Available Models</h4>
                    <div class="variant-options">
                        <div class="variant active" data-model="MA-2000">
                            <h5>MA-2000</h5>
                            <p>Standard precision<br>±0.1mm accuracy</p>
                            <div class="variant-price">From $12,500</div>
                        </div>
                        <div class="variant" data-model="MA-3000">
                            <h5>MA-3000</h5>
                            <p>High precision<br>±0.05mm accuracy</p>
                            <div class="variant-price">From $18,500</div>
                        </div>
                        <div class="variant" data-model="MA-4000">
                            <h5>MA-4000</h5>
                            <p>Ultra precision<br>±0.02mm accuracy</p>
                            <div class="variant-price">From $25,000</div>
                        </div>
                    </div>
                </div>
                
                <div class="product-cta">
                    <button class="btn btn-primary" id="requestQuoteBtn">Request Quote</button>
                    <button class="btn btn-secondary" id="downloadDatasheet">Download Datasheet</button>
                    <button class="btn btn-outline" id="scheduleDemo">Schedule Demo</button>
                </div>
                
                <div class="product-features">
                    <div class="feature">
                        <svg viewBox="0 0 24 24">
                            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/>
                        </svg>
                        <span>ISO 13485 Certified</span>
                    </div>
                    <div class="feature">
                        <svg viewBox="0 0 24 24">
                            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/>
                        </svg>
                        <span>2-Year Warranty</span>
                    </div>
                    <div class="feature">
                        <svg viewBox="0 0 24 24">
                            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/>
                        </svg>
                        <span>24/7 Support</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Technical Specifications -->
<section class="section specs-section">
    <div class="container">
        <h2 class="text-center fade-in">Technical Specifications</h2>
        
        <div class="specs-tabs">
            <button class="specs-tab active" data-tab="mechanical">Mechanical</button>
            <button class="specs-tab" data-tab="electrical">Electrical</button>
            <button class="specs-tab" data-tab="performance">Performance</button>
            <button class="specs-tab" data-tab="environmental">Environmental</button>
        </div>
        
        <div class="specs-content">
            <div class="specs-pane active" id="mechanical">
                <div class="specs-table">
                    <div class="spec-row">
                        <div class="spec-name">Degrees of Freedom</div>
                        <div class="spec-value">6</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">Workspace Volume</div>
                        <div class="spec-value">2.5 m³</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">Reach</div>
                        <div class="spec-value">1.5 m</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">Payload Capacity</div>
                        <div class="spec-value">10 kg</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">Weight</div>
                        <div class="spec-value">25 kg</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">Material</div>
                        <div class="spec-value">Aerospace Aluminum</div>
                    </div>
                </div>
            </div>
            
            <div class="specs-pane" id="electrical">
                <div class="specs-table">
                    <div class="spec-row">
                        <div class="spec-name">Power Supply</div>
                        <div class="spec-value">24V DC, 10A</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">Motor Type</div>
                        <div class="spec-value">Brushless Servo</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">Encoder Resolution</div>
                        <div class="spec-value">20-bit</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">Communication</div>
                        <div class="spec-value">EtherCAT, RS-485</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">I/O Ports</div>
                        <div class="spec-value">8 Digital, 4 Analog</div>
                    </div>
                </div>
            </div>
            
            <div class="specs-pane" id="performance">
                <div class="specs-table">
                    <div class="spec-row">
                        <div class="spec-name">Position Accuracy</div>
                        <div class="spec-value">±0.1 mm</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">Repeatability</div>
                        <div class="spec-value">±0.05 mm</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">Resolution</div>
                        <div class="spec-value">0.01 mm</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">Max Speed</div>
                        <div class="spec-value">1 m/s</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">Settling Time</div>
                        <div class="spec-value">< 100 ms</div>
                    </div>
                </div>
            </div>
            
            <div class="specs-pane" id="environmental">
                <div class="specs-table">
                    <div class="spec-row">
                        <div class="spec-name">Operating Temperature</div>
                        <div class="spec-value">0°C to 40°C</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">Storage Temperature</div>
                        <div class="spec-value">-20°C to 60°C</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">Humidity</div>
                        <div class="spec-value">20% to 80% non-condensing</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">IP Rating</div>
                        <div class="spec-value">IP54</div>
                    </div>
                    <div class="spec-row">
                        <div class="spec-name">Vibration</div>
                        <div class="spec-value">0.5 G max</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Applications -->
<section class="section applications-section">
    <div class="container">
        <h2 class="text-center fade-in">Applications</h2>
        
        <div class="applications-grid">
            <div class="application-card card-3d">
                <div class="app-icon medical">M</div>
                <h3>Medical Robotics</h3>
                <ul>
                    <li>Surgical assistance</li>
                    <li>Radiotherapy positioning</li>
                    <li>Medical imaging</li>
                    <li>Laboratory automation</li>
                </ul>
            </div>
            
            <div class="application-card card-3d">
                <div class="app-icon industrial">I</div>
                <h3>Industrial Automation</h3>
                <ul>
                    <li>Precision assembly</li>
                    <li>Quality inspection</li>
                    <li>Laser processing</li>
                    <li>3D scanning</li>
                </ul>
            </div>
            
            <div class="application-card card-3d">
                <div class="app-icon aerospace">A</div>
                <h3>Aerospace & Defense</h3>
                <ul>
                    <li>Composite layup</li>
                    <li>NDT inspection</li>
                    <li>Satellite assembly</li>
                    <li>Targeting systems</li>
                </ul>
            </div>
        </div>
    </div>
</section>

<!-- Download Resources -->
<section class="section resources-section">
    <div class="container">
        <h2 class="text-center fade-in">Resources</h2>
        
        <div class="resources-grid">
            <a href="<%= contextPath %>/documents/articulated-arms-datasheet.pdf" 
               class="resource-card card-3d" target="_blank">
                <div class="resource-icon pdf">PDF</div>
                <h4>Technical Datasheet</h4>
                <p>Complete specifications and technical details</p>
                <span class="resource-size">2.4 MB</span>
            </a>
            
            <a href="<%= contextPath %>/documents/ma-series-manual.pdf" 
               class="resource-card card-3d" target="_blank">
                <div class="resource-icon manual">MAN</div>
                <h4>User Manual</h4>
                <p>Installation, operation, and maintenance guide</p>
                <span class="resource-size">5.1 MB</span>
            </a>
            
            <a href="<%= contextPath %>/documents/certificate-iso13485.pdf" 
               class="resource-card card-3d" target="_blank">
                <div class="resource-icon cert">CERT</div>
                <h4>Certificates</h4>
                <p>ISO 13485 and compliance documentation</p>
                <span class="resource-size">1.8 MB</span>
            </a>
            
            <a href="<%= contextPath %>/documents/3d-models.zip" 
               class="resource-card card-3d" target="_blank">
                <div class="resource-icon cad">CAD</div>
                <h4>3D Models</h4>
                <p>STEP, IGES, and SolidWorks files</p>
                <span class="resource-size">15.2 MB</span>
            </a>
        </div>
    </div>
</section>

<!-- Related Products -->
<section class="section related-products">
    <div class="container">
        <h2 class="text-center fade-in">Related Products</h2>
        
        <div class="related-grid">
            <a href="<%= contextPath %>/products/focusing-handpieces" class="related-card">
                <img src="<%= contextPath %>/assets/images/products/focusing-handpieces/thumb.jpg" alt="Focusing Handpieces">
                <h4>Focusing Handpieces</h4>
                <p>Precision optical focusing systems</p>
            </a>
            
            <a href="<%= contextPath %>/products/micromanipulators" class="related-card">
                <img src="<%= contextPath %>/assets/images/products/micromanipulators/thumb.jpg" alt="Micromanipulators">
                <h4>Micromanipulators</h4>
                <p>Sub-micron precision positioning</p>
            </a>
            
            <a href="<%= contextPath %>/products/scanners" class="related-card">
                <img src="<%= contextPath %>/assets/images/products/scanners/thumb.jpg" alt="3D Scanners">
                <h4>3D Scanners</h4>
                <p>High-precision measurement systems</p>
            </a>
        </div>
    </div>
</section>

<!-- Inquiry Form Modal -->
<div class="modal" id="productInquiryModal">
    <div class="modal-content">
        <button class="modal-close">&times;</button>
        <div class="modal-header">
            <h3>Request Quote: Articulated Arms</h3>
        </div>
        <div class="modal-body">
            <!-- Same form as in products.jsp -->
        </div>
    </div>
</div>

<style>
    /* Product Hero */
    .product-hero {
        min-height: 40vh;
        padding: 100px 0 50px;
        color: white;
        position: relative;
        overflow: hidden;
    }
    
    .product-hero::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: radial-gradient(circle at 30% 50%, rgba(32, 201, 151, 0.3), transparent 70%);
    }
    
    .breadcrumb {
        margin-bottom: 2rem;
        font-size: 0.9rem;
    }
    
    .breadcrumb a {
        color: rgba(255, 255, 255, 0.8);
        text-decoration: none;
        transition: color 0.3s ease;
    }
    
    .breadcrumb a:hover {
        color: white;
    }
    
    .breadcrumb span {
        color: white;
        font-weight: 600;
    }
    
    .product-hero h1 {
        -webkit-text-fill-color: white;
        background: transparent;
        margin-bottom: 1rem;
    }
    
    /* Product Overview */
    .product-overview {
        padding: 5rem 0;
        background: var(--white);
    }
    
    .product-gallery {
        position: sticky;
        top: 100px;
    }
    
    .main-image {
        position: relative;
        border-radius: 20px;
        overflow: hidden;
        margin-bottom: 1rem;
        box-shadow: var(--shadow-lg);
    }
    
    .main-image img {
        width: 100%;
        height: 400px;
        object-fit: cover;
        transition: transform 0.5s ease;
    }
    
    .main-image:hover img {
        transform: scale(1.05);
    }
    
    .image-badge {
        position: absolute;
        top: 20px;
        right: 20px;
        background: var(--accent-orange);
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 20px;
        font-size: 0.8rem;
        font-weight: 600;
    }
    
    .thumbnail-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 1rem;
    }
    
    .thumbnail {
        height: 80px;
        border-radius: 10px;
        cursor: pointer;
        object-fit: cover;
        transition: all 0.3s ease;
        border: 2px solid transparent;
    }
    
    .thumbnail.active {
        border-color: var(--accent-teal);
        transform: scale(1.05);
    }
    
    .thumbnail:hover {
        border-color: var(--primary-blue);
    }
    
    .product-rating {
        display: flex;
        align-items: center;
        gap: 1rem;
        margin: 1rem 0;
    }
    
    .stars {
        color: #FFA500;
        font-size: 1.2rem;
    }
    
    .rating-text {
        color: var(--secondary-gray);
    }
    
    .product-specs-summary {
        background: var(--background-light);
        padding: 1.5rem;
        border-radius: 15px;
        margin: 1.5rem 0;
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 1rem;
    }
    
    .spec-item {
        display: flex;
        justify-content: space-between;
        padding-bottom: 0.5rem;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    }
    
    .spec-item:last-child {
        border-bottom: none;
    }
    
    .spec-label {
        color: var(--secondary-gray);
    }
    
    .spec-value {
        font-weight: 600;
        color: var(--primary-blue);
    }
    
    .product-variants {
        margin: 2rem 0;
    }
    
    .variant-options {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 1rem;
        margin-top: 1rem;
    }
    
    .variant {
        padding: 1.5rem;
        border: 2px solid #e9ecef;
        border-radius: 10px;
        cursor: pointer;
        transition: all 0.3s ease;
        text-align: center;
    }
    
    .variant.active {
        border-color: var(--accent-teal);
        background: rgba(32, 201, 151, 0.05);
        transform: translateY(-5px);
    }
    
    .variant:hover:not(.active) {
        border-color: var(--primary-blue);
    }
    
    .variant h5 {
        margin-bottom: 0.5rem;
        color: var(--primary-blue);
    }
    
    .variant p {
        font-size: 0.9rem;
        color: var(--secondary-gray);
        margin-bottom: 1rem;
    }
    
    .variant-price {
        font-weight: 600;
        color: var(--accent-teal);
        font-size: 1.1rem;
    }
    
    .product-cta {
        display: flex;
        gap: 1rem;
        margin: 2rem 0;
        flex-wrap: wrap;
    }
    
    .btn-primary {
        flex: 1;
        min-width: 150px;
    }
    
    .btn-secondary {
        background: linear-gradient(135deg, var(--accent-teal), #1ab082);
    }
    
    .btn-outline {
        background: transparent;
        border: 2px solid var(--primary-blue);
        color: var(--primary-blue);
    }
    
    .btn-outline:hover {
        background: var(--primary-blue);
        color: white;
    }
    
    .product-features {
        display: flex;
        gap: 1.5rem;
        flex-wrap: wrap;
        padding-top: 2rem;
        border-top: 1px solid #e9ecef;
    }
    
    .feature {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        color: var(--secondary-gray);
        font-size: 0.9rem;
    }
    
    .feature svg {
        width: 20px;
        height: 20px;
        fill: var(--accent-teal);
    }
    
    /* Specifications Section */
    .specs-section {
        padding: 5rem 0;
        background: var(--background-light);
    }
    
    .specs-tabs {
        display: flex;
        justify-content: center;
        gap: 1rem;
        margin: 3rem 0 2rem;
        flex-wrap: wrap;
    }
    
    .specs-tab {
        padding: 1rem 2rem;
        background: transparent;
        border: 2px solid var(--primary-blue);
        color: var(--primary-blue);
        border-radius: 50px;
        cursor: pointer;
        font-weight: 600;
        transition: all 0.3s ease;
    }
    
    .specs-tab.active {
        background: var(--primary-blue);
        color: white;
    }
    
    .specs-tab:hover:not(.active) {
        background: rgba(0, 64, 128, 0.1);
    }
    
    .specs-content {
        background: white;
        border-radius: 20px;
        padding: 2rem;
        box-shadow: var(--shadow-md);
    }
    
    .specs-pane {
        display: none;
    }
    
    .specs-pane.active {
        display: block;
        animation: fadeIn 0.5s ease;
    }
    
    .specs-table {
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
    }
    
    .spec-row {
        display: flex;
        justify-content: space-between;
        padding: 1rem;
        border-bottom: 1px solid #e9ecef;
    }
    
    .spec-row:last-child {
        border-bottom: none;
    }
    
    .spec-name {
        color: var(--secondary-gray);
        font-weight: 500;
    }
    
    .spec-value {
        color: var(--primary-blue);
        font-weight: 600;
    }
    
    /* Applications Section */
    .applications-section {
        padding: 5rem 0;
        background: var(--white);
    }
    
    .applications-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 2rem;
        margin-top: 3rem;
    }
    
    .app-icon {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
        font-weight: 700;
        margin-bottom: 1rem;
        color: white;
    }
    
    .app-icon.medical {
        background: linear-gradient(135deg, #20C997, #0CA678);
    }
    
    .app-icon.industrial {
        background: linear-gradient(135deg, #004080, #0059b3);
    }
    
    .app-icon.aerospace {
        background: linear-gradient(135deg, #6c757d, #4B4B4B);
    }
    
    .application-card ul {
        list-style: none;
        padding: 0;
        margin-top: 1rem;
    }
    
    .application-card li {
        padding: 0.5rem 0;
        border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        color: var(--secondary-gray);
    }
    
    .application-card li:last-child {
        border-bottom: none;
    }
    
    .application-card li::before {
        content: '✓';
        color: var(--accent-teal);
        margin-right: 0.5rem;
        font-weight: bold;
    }
    
    /* Resources Section */
    .resources-section {
        padding: 5rem 0;
        background: var(--background-light);
    }
    
    .resources-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 2rem;
        margin-top: 3rem;
    }
    
    .resource-card {
        text-align: center;
        padding: 2rem;
        text-decoration: none;
        color: inherit;
        transition: all 0.4s ease;
    }
    
    .resource-card:hover {
        transform: translateY(-10px);
    }
    
    .resource-icon {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 700;
        margin: 0 auto 1rem;
        color: white;
    }
    
    .resource-icon.pdf {
        background: linear-gradient(135deg, #ff6b6b, #fa5252);
    }
    
    .resource-icon.manual {
        background: linear-gradient(135deg, #4dabf7, #339af0);
    }
    
    .resource-icon.cert {
        background: linear-gradient(135deg, #20C997, #0CA678);
    }
    
    .resource-icon.cad {
        background: linear-gradient(135deg, #ff922b, #fd7e14);
    }
    
    .resource-card h4 {
        margin-bottom: 0.5rem;
        color: var(--primary-blue);
    }
    
    .resource-card p {
        color: var(--secondary-gray);
        font-size: 0.9rem;
        margin-bottom: 1rem;
    }
    
    .resource-size {
        font-size: 0.8rem;
        color: var(--accent-teal);
        font-weight: 600;
    }
    
    /* Related Products */
    .related-products {
        padding: 5rem 0;
        background: var(--white);
    }
    
    .related-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 2rem;
        margin-top: 3rem;
    }
    
    .related-card {
        text-decoration: none;
        color: inherit;
        transition: transform 0.3s ease;
    }
    
    .related-card:hover {
        transform: translateY(-5px);
    }
    
    .related-card img {
        width: 100%;
        height: 150px;
        object-fit: cover;
        border-radius: 10px;
        margin-bottom: 1rem;
    }
    
    .related-card h4 {
        color: var(--primary-blue);
        margin-bottom: 0.5rem;
    }
    
    .related-card p {
        color: var(--secondary-gray);
        font-size: 0.9rem;
    }
    
    @media (max-width: 768px) {
        .grid-2 {
            grid-template-columns: 1fr;
        }
        
        .product-gallery {
            position: static;
        }
        
        .variant-options {
            grid-template-columns: 1fr;
        }
        
        .product-cta {
            flex-direction: column;
        }
        
        .btn-primary, .btn-secondary, .btn-outline {
            width: 100%;
        }
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Thumbnail image switching
        const thumbnails = document.querySelectorAll('.thumbnail');
        const mainImage = document.getElementById('mainImage');
        
        thumbnails.forEach(thumb => {
            thumb.addEventListener('click', function() {
                // Remove active class from all thumbnails
                thumbnails.forEach(t => t.classList.remove('active'));
                
                // Add active class to clicked thumbnail
                this.classList.add('active');
                
                // Update main image
                const newImage = this.getAttribute('data-image');
                const imagePath = '<%= contextPath %>/assets/images/products/articulated-arms/';
                mainImage.src = imagePath + newImage;
                mainImage.alt = this.alt;
                
                // Add fade effect
                mainImage.style.opacity = '0';
                setTimeout(() => {
                    mainImage.style.opacity = '1';
                }, 200);
            });
        });
        
        // Model variant selection
        const variants = document.querySelectorAll('.variant');
        variants.forEach(variant => {
            variant.addEventListener('click', function() {
                variants.forEach(v => v.classList.remove('active'));
                this.classList.add('active');
                
                const model = this.getAttribute('data-model');
                console.log('Selected model:', model);
                // Update any model-specific content here
            });
        });
        
        // Specifications tabs
        const specTabs = document.querySelectorAll('.specs-tab');
        const specPanes = document.querySelectorAll('.specs-pane');
        
        specTabs.forEach(tab => {
            tab.addEventListener('click', function() {
                const tabId = this.getAttribute('data-tab');
                
                // Update active tab
                specTabs.forEach(t => t.classList.remove('active'));
                this.classList.add('active');
                
                // Show corresponding pane
                specPanes.forEach(pane => {
                    pane.classList.remove('active');
                    if (pane.id === tabId) {
                        pane.classList.add('active');
                    }
                });
            });
        });
        
        // Request quote button
        const requestQuoteBtn = document.getElementById('requestQuoteBtn');
        const inquiryModal = document.getElementById('productInquiryModal');
        const modalClose = inquiryModal.querySelector('.modal-close');
        
        requestQuoteBtn.addEventListener('click', () => {
            inquiryModal.style.display = 'flex';
            document.body.style.overflow = 'hidden';
        });
        
        modalClose.addEventListener('click', () => {
            inquiryModal.style.display = 'none';
            document.body.style.overflow = '';
        });
        
        // Close modal when clicking outside
        inquiryModal.addEventListener('click', (e) => {
            if (e.target === inquiryModal) {
                inquiryModal.style.display = 'none';
                document.body.style.overflow = '';
            }
        });
        
        // Download datasheet
        const downloadBtn = document.getElementById('downloadDatasheet');
        downloadBtn.addEventListener('click', () => {
            // Simulate download
            const link = document.createElement('a');
            link.href = '<%= contextPath %>/documents/articulated-arms-datasheet.pdf';
            link.download = 'Articulated-Arms-Datasheet.pdf';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
            
            // Show download notification
            showNotification('Download started...', 'success');
        });
        
        function showNotification(message, type) {
            const notification = document.createElement('div');
            notification.className = `notification notification-${type}`;
            notification.textContent = message;
            notification.style.cssText = `
                position: fixed;
                top: 20px;
                right: 20px;
                padding: 1rem 2rem;
                background: ${type === 'success' ? '#20C997' : '#ff6b6b'};
                color: white;
                border-radius: 10px;
                z-index: 10000;
                animation: slideInRight 0.3s ease, fadeOut 0.3s ease 2.7s forwards;
            `;
            
            document.body.appendChild(notification);
            
            setTimeout(() => {
                notification.remove();
            }, 3000);
        }
    });
</script>

<%@ include file="/components/footer.jsp" %>