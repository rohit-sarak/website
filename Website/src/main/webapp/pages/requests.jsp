<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/components/header.jsp" %>

<div class="loading-bar"></div>

<section class="section request-section">
    <div class="container">
        <div class="request-header fade-in">
            <h1>Product & Service Requests</h1>
            <p class="lead">Complete this form to request quotes, technical information, or schedule consultations.</p>
        </div>
        
        <div class="request-container">
            <form id="requestForm" action="<%= contextPath %>/submit-request" method="POST" 
                  data-ajax="true" class="request-form">
                
                <div class="form-section">
                    <h3>Personal Information</h3>
                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="firstName">First Name *</label>
                            <input type="text" id="firstName" name="firstName" required 
                                   placeholder="Enter your first name">
                            <div class="error-message"></div>
                        </div>
                        <div class="form-group">
                            <label for="lastName">Last Name *</label>
                            <input type="text" id="lastName" name="lastName" required 
                                   placeholder="Enter your last name">
                            <div class="error-message"></div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" id="title" name="title" 
                               placeholder="Your position/title">
                    </div>
                </div>
                
                <div class="form-section">
                    <h3>Company Information</h3>
                    <div class="form-group">
                        <label for="company">Company Name *</label>
                        <input type="text" id="company" name="company" required 
                               placeholder="Your company/organization">
                    </div>
                    
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" id="address" name="address" 
                               placeholder="Street address">
                    </div>
                    
                    <div class="form-grid-3">
                        <div class="form-group">
                            <label for="city">City</label>
                            <input type="text" id="city" name="city" 
                                   placeholder="City">
                        </div>
                        <div class="form-group">
                            <label for="state">State/Province</label>
                            <input type="text" id="state" name="state" 
                                   placeholder="State">
                        </div>
                        <div class="form-group">
                            <label for="zipCode">Zip/Postal Code</label>
                            <input type="text" id="zipCode" name="zipCode" 
                                   placeholder="Postal code">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="country">Country</label>
                        <select id="country" name="country">
                            <option value="">Select Country</option>
                            <option value="US">United States</option>
                            <option value="CA">Canada</option>
                            <option value="GB">United Kingdom</option>
                            <option value="DE">Germany</option>
                            <option value="JP">Japan</option>
                            <option value="CN">China</option>
                            <!-- Add more countries as needed -->
                        </select>
                    </div>
                </div>
                
                <div class="form-section">
                    <h3>Contact Information</h3>
                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="email">Email Address *</label>
                            <input type="email" id="email" name="email" required 
                                   placeholder="you@company.com">
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="phone" 
                                   placeholder="(123) 456-7890">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="fax">Fax Number</label>
                        <input type="tel" id="fax" name="fax" 
                               placeholder="Fax number (optional)">
                    </div>
                </div>
                
                <div class="form-section">
                    <h3>Request Details</h3>
                    
                    <div class="form-group">
                        <label>Action Required *</label>
                        <div class="radio-group">
                            <label class="radio-label">
                                <input type="radio" name="actionRequired" value="Sales Contact" required>
                                <span class="radio-custom"></span>
                                Sales Contact
                            </label>
                            <label class="radio-label">
                                <input type="radio" name="actionRequired" value="Sales Information">
                                <span class="radio-custom"></span>
                                Sales Information
                            </label>
                            <label class="radio-label">
                                <input type="radio" name="actionRequired" value="Technical Support">
                                <span class="radio-custom"></span>
                                Technical Support
                            </label>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label>Type of Business *</label>
                        <div class="checkbox-group">
                            <label class="checkbox-label">
                                <input type="checkbox" name="businessType" value="OEM">
                                <span class="checkbox-custom"></span>
                                OEM (Original Equipment Manufacturer)
                            </label>
                            <label class="checkbox-label">
                                <input type="checkbox" name="businessType" value="R&D">
                                <span class="checkbox-custom"></span>
                                R&D (Research & Development)
                            </label>
                            <label class="checkbox-label">
                                <input type="checkbox" name="businessType" value="3rd Party Repair">
                                <span class="checkbox-custom"></span>
                                3rd Party Repair
                            </label>
                            <label class="checkbox-label">
                                <input type="checkbox" name="businessType" value="End User">
                                <span class="checkbox-custom"></span>
                                End User
                            </label>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="additionalInfo">Additional Information</label>
                        <textarea id="additionalInfo" name="additionalInfo" 
                                  rows="4" maxlength="1000"
                                  placeholder="Please provide any additional details about your request..."></textarea>
                        <div class="char-counter">0/1000</div>
                    </div>
                </div>
                
                <div class="form-section verification-section">
                    <h3>Human Verification</h3>
                    <div id="verificationContainer" class="verification-box">
                        <div class="verification-display"></div>
                        <div class="form-group">
                            <label for="verification">Enter the result:</label>
                            <input type="text" id="verification" name="verification" required 
                                   placeholder="e.g., 5+3=8">
                        </div>
                    </div>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn btn-submit">
                        <span>Submit Request</span>
                        <div class="submit-spinner" style="display: none;"></div>
                    </button>
                    <button type="reset" class="btn btn-reset">Clear Form</button>
                </div>
                
                <div class="form-footer">
                    <p><small>* Required fields</small></p>
                    <p><small>Your information is secure and will only be used to process your request.</small></p>
                </div>
            </form>
        </div>
    </div>
</section>

<style>
    .request-section {
        padding: 5rem 0;
        background: var(--background-light);
        min-height: 100vh;
        padding-top: 100px;
    }
    
    .request-header {
        text-align: center;
        margin-bottom: 3rem;
    }
    
    .lead {
        font-size: 1.2rem;
        color: var(--secondary-gray);
        max-width: 600px;
        margin: 0 auto;
    }
    
    .request-container {
        max-width: 800px;
        margin: 0 auto;
        background: var(--white);
        border-radius: 20px;
        padding: 3rem;
        box-shadow: var(--shadow-lg);
    }
    
    .form-section {
        margin-bottom: 3rem;
        padding-bottom: 2rem;
        border-bottom: 2px solid var(--background-light);
    }
    
    .form-section:last-of-type {
        border-bottom: none;
    }
    
    .form-group {
        margin-bottom: 1.5rem;
        position: relative;
    }
    
    label {
        display: block;
        margin-bottom: 0.5rem;
        font-weight: 600;
        color: var(--primary-blue);
    }
    
    input, select, textarea {
        width: 100%;
        padding: 1rem;
        border: 2px solid #e9ecef;
        border-radius: 10px;
        font-family: inherit;
        font-size: 1rem;
        transition: all 0.3s ease;
        background: var(--white);
    }
    
    input:focus, select:focus, textarea:focus {
        outline: none;
        border-color: var(--accent-teal);
        box-shadow: 0 0 0 3px rgba(32, 201, 151, 0.1);
    }
    
    input.error, select.error, textarea.error {
        border-color: #ff6b6b;
    }
    
    .error-message {
        color: #ff6b6b;
        font-size: 0.875rem;
        margin-top: 0.25rem;
        opacity: 0;
        transition: opacity 0.3s ease;
    }
    
    .form-grid-2 {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 1.5rem;
    }
    
    .form-grid-3 {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        gap: 1.5rem;
    }
    
    /* Radio & Checkbox Styling */
    .radio-group, .checkbox-group {
        display: grid;
        gap: 1rem;
    }
    
    .radio-label, .checkbox-label {
        display: flex;
        align-items: center;
        cursor: pointer;
        padding: 0.75rem;
        border-radius: 8px;
        transition: background 0.3s ease;
    }
    
    .radio-label:hover, .checkbox-label:hover {
        background: var(--background-light);
    }
    
    .radio-label input, .checkbox-label input {
        display: none;
    }
    
    .radio-custom, .checkbox-custom {
        width: 20px;
        height: 20px;
        border: 2px solid #ddd;
        border-radius: 50%;
        margin-right: 10px;
        position: relative;
        transition: all 0.3s ease;
    }
    
    .checkbox-custom {
        border-radius: 4px;
    }
    
    .radio-label input:checked + .radio-custom {
        border-color: var(--accent-teal);
    }
    
    .radio-label input:checked + .radio-custom::after {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 10px;
        height: 10px;
        background: var(--accent-teal);
        border-radius: 50%;
    }
    
    .checkbox-label input:checked + .checkbox-custom {
        background: var(--accent-teal);
        border-color: var(--accent-teal);
    }
    
    .checkbox-label input:checked + .checkbox-custom::after {
        content: '✓';
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: white;
        font-size: 12px;
    }
    
    /* Verification Section */
    .verification-box {
        background: var(--background-light);
        padding: 2rem;
        border-radius: 10px;
        border-left: 4px solid var(--accent-orange);
    }
    
    .verification-display {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--primary-blue);
        margin-bottom: 1rem;
        text-align: center;
    }
    
    /* Form Actions */
    .form-actions {
        display: flex;
        gap: 1rem;
        justify-content: center;
        margin: 3rem 0 2rem;
    }
    
    .btn-submit {
        min-width: 200px;
        position: relative;
    }
    
    .btn-reset {
        background: transparent;
        color: var(--secondary-gray);
        border: 2px solid #e9ecef;
    }
    
    .btn-reset:hover {
        background: #e9ecef;
        transform: none;
    }
    
    .submit-spinner {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 20px;
        height: 20px;
        border: 2px solid rgba(255, 255, 255, 0.3);
        border-radius: 50%;
        border-top-color: white;
        animation: spin 1s linear infinite;
    }
    
    @keyframes spin {
        to {
            transform: translate(-50%, -50%) rotate(360deg);
        }
    }
    
    /* Success/Error Messages */
    .success-message {
        background: linear-gradient(135deg, #20C997, #0CA678);
        color: white;
        padding: 1.5rem;
        border-radius: 10px;
        margin-bottom: 2rem;
        display: flex;
        align-items: center;
        gap: 1rem;
        animation: fadeIn 0.5s ease;
    }
    
    .success-icon {
        width: 30px;
        height: 30px;
        background: white;
        color: #20C997;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        font-size: 1.2rem;
    }
    
    .form-error-message {
        background: linear-gradient(135deg, #ff6b6b, #fa5252);
        color: white;
        padding: 1.5rem;
        border-radius: 10px;
        margin-bottom: 2rem;
        animation: fadeIn 0.5s ease;
    }
    
    .char-counter {
        text-align: right;
        font-size: 0.875rem;
        color: var(--secondary-gray);
        margin-top: 0.25rem;
    }
    
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(-10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    
    @media (max-width: 768px) {
        .request-container {
            padding: 2rem 1.5rem;
        }
        
        .form-grid-2, .form-grid-3 {
            grid-template-columns: 1fr;
        }
        
        .form-actions {
            flex-direction: column;
        }
        
        .btn-submit, .btn-reset {
            width: 100%;
        }
    }
</style>

<script src="<%= contextPath %>/assets/js/form-validation.js"></script>

<%@ include file="/components/footer.jsp" %>