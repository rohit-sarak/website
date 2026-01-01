// Form Validation and AJAX Submission
class FormHandler {
    constructor() {
        this.forms = document.querySelectorAll('form[data-ajax="true"]');
        this.init();
    }
    
    init() {
        this.forms.forEach(form => {
            this.setupForm(form);
        });
        
        // Setup math verification
        this.setupVerification();
    }
    
    setupForm(form) {
        form.addEventListener('submit', (e) => {
            e.preventDefault();
            this.handleSubmit(form);
        });
        
        // Real-time validation
        form.querySelectorAll('input, textarea, select').forEach(input => {
            input.addEventListener('blur', () => this.validateField(input));
            input.addEventListener('input', () => this.clearError(input));
        });
    }
    
    validateField(field) {
        const value = field.value.trim();
        const type = field.type;
        const name = field.name;
        
        // Clear previous errors
        this.clearError(field);
        
        // Required validation
        if (field.hasAttribute('required') && !value) {
            this.showError(field, 'This field is required');
            return false;
        }
        
        // Email validation
        if (type === 'email' && value) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(value)) {
                this.showError(field, 'Please enter a valid email address');
                return false;
            }
        }
        
        // Phone validation
        if (name === 'phone' && value) {
            const phoneRegex = /^[\+]?[1-9][\d]{0,15}$/;
            if (!phoneRegex.test(value.replace(/[\s\-\(\)]/g, ''))) {
                this.showError(field, 'Please enter a valid phone number');
                return false;
            }
        }
        
        return true;
    }
    
    showError(field, message) {
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
    
    clearError(field) {
        field.classList.remove('error');
        const errorDiv = field.parentElement.querySelector('.error-message');
        if (errorDiv) {
            errorDiv.style.opacity = '0';
            setTimeout(() => errorDiv.remove(), 300);
        }
    }
    
    setupVerification() {
        const verificationContainer = document.getElementById('verificationContainer');
        if (!verificationContainer) return;
        
        // Generate random math problem
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * 10) + 1;
        const operators = ['+', '-'];
        const operator = operators[Math.floor(Math.random() * operators.length)];
        
        let answer;
        if (operator === '+') {
            answer = num1 + num2;
        } else {
            answer = num1 - num2;
        }
        
        // Store expected answer in data attribute
        verificationContainer.dataset.expected = answer;
        
        // Update display
        const display = verificationContainer.querySelector('.verification-display');
        if (display) {
            display.textContent = `What is ${num1} ${operator} ${num2}?`;
        }
    }
    
    async handleSubmit(form) {
        // Validate all fields
        let isValid = true;
        const fields = form.querySelectorAll('input, textarea, select');
        
        fields.forEach(field => {
            if (!this.validateField(field)) {
                isValid = false;
            }
        });
        
        if (!isValid) {
            this.showFormError(form, 'Please fix the errors above');
            return;
        }
        
        // Show loading state
        const submitBtn = form.querySelector('button[type="submit"]');
        const originalText = submitBtn.textContent;
        submitBtn.textContent = 'Sending...';
        submitBtn.disabled = true;
        
        try {
            const formData = new FormData(form);
            
            // Convert FormData to URLSearchParams for x-www-form-urlencoded
            const params = new URLSearchParams();
            for (const [key, value] of formData.entries()) {
                params.append(key, value);
            }
            
            const response = await fetch(form.action, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: params.toString()
            });
            
            const result = await response.json();
            
            if (result.success) {
                this.showSuccess(form, result.message);
                form.reset();
                // Regenerate verification
                this.setupVerification();
            } else {
                this.showFormError(form, result.message);
            }
            
        } catch (error) {
            console.error('Form submission error:', error);
            this.showFormError(form, 'Network error. Please try again.');
        } finally {
            // Reset button
            submitBtn.textContent = originalText;
            submitBtn.disabled = false;
        }
    }
    
    showSuccess(form, message) {
        this.clearFormMessages(form);
        
        const successDiv = document.createElement('div');
        successDiv.className = 'success-message';
        successDiv.innerHTML = `
            <div class="success-icon">✓</div>
            <div>${message}</div>
        `;
        
        form.insertBefore(successDiv, form.firstChild);
        
        // Auto-remove after 5 seconds
        setTimeout(() => {
            successDiv.style.opacity = '0';
            setTimeout(() => successDiv.remove(), 300);
        }, 5000);
    }
    
    showFormError(form, message) {
        this.clearFormMessages(form);
        
        const errorDiv = document.createElement('div');
        errorDiv.className = 'form-error-message';
        errorDiv.textContent = message;
        
        form.insertBefore(errorDiv, form.firstChild);
    }
    
    clearFormMessages(form) {
        const existingMessages = form.querySelectorAll('.success-message, .form-error-message');
        existingMessages.forEach(msg => msg.remove());
    }
}

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    new FormHandler();
});

// Additional form utilities
class FormUtilities {
    static initCharacterCounters() {
        document.querySelectorAll('textarea[maxlength]').forEach(textarea => {
            const maxLength = textarea.getAttribute('maxlength');
            const counter = document.createElement('div');
            counter.className = 'char-counter';
            counter.textContent = `0/${maxLength}`;
            textarea.parentElement.appendChild(counter);
            
            textarea.addEventListener('input', () => {
                const remaining = maxLength - textarea.value.length;
                counter.textContent = `${textarea.value.length}/${maxLength}`;
                counter.style.color = remaining < 20 ? '#ff6b6b' : '#4B4B4B';
            });
        });
    }
    
    static initAutoFormat() {
        // Phone number formatting
        document.querySelectorAll('input[name="phone"]').forEach(input => {
            input.addEventListener('input', (e) => {
                let value = e.target.value.replace(/\D/g, '');
                if (value.length > 3 && value.length <= 6) {
                    value = value.replace(/(\d{3})(\d+)/, '$1-$2');
                } else if (value.length > 6) {
                    value = value.replace(/(\d{3})(\d{3})(\d+)/, '$1-$2-$3');
                }
                e.target.value = value.substring(0, 14);
            });
        });
        
        // Zip code formatting
        document.querySelectorAll('input[name="zipCode"]').forEach(input => {
            input.addEventListener('input', (e) => {
                e.target.value = e.target.value.replace(/[^0-9\-]/g, '').substring(0, 10);
            });
        });
    }
}

// Initialize utilities
FormUtilities.initCharacterCounters();
FormUtilities.initAutoFormat();