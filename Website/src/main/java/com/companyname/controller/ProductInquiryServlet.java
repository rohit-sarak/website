package com.companyname.controller;

import com.companyname.service.EmailService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/submit-inquiry")
@MultipartConfig
public class ProductInquiryServlet extends HttpServlet {
    private EmailService emailService;
    
    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.emailService = new EmailService();
        } catch (Exception e) {
            throw new ServletException("Failed to initialize EmailService", e);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
        
        try {
            // Get parameters
            String productName = sanitize(request.getParameter("productName"));
            String name = sanitize(request.getParameter("name"));
            String email = sanitize(request.getParameter("email"));
            String company = sanitize(request.getParameter("company"));
            String phone = sanitize(request.getParameter("phone"));
            String quantity = sanitize(request.getParameter("quantity"));
            String application = sanitize(request.getParameter("application"));
            String timeline = sanitize(request.getParameter("timeline"));
            String additionalInfo = sanitize(request.getParameter("additionalInfo"));
            
            // Validate
            if (productName.isEmpty() || name.isEmpty() || email.isEmpty()) {
                out.write("{\"success\": false, \"message\": \"Product name, your name, and email are required.\"}");
                return;
            }
            
            if (!emailService.isValidEmail(email)) {
                out.write("{\"success\": false, \"message\": \"Please provide a valid email address.\"}");
                return;
            }
            
            // Build email
            String subject = "Product Inquiry: " + productName + " from " + (company.isEmpty() ? name : company);
            
            StringBuilder emailBody = new StringBuilder();
            emailBody.append("<html><body style=\"font-family: Arial, sans-serif;\">");
            emailBody.append("<h2 style=\"color: #004080;\">New Product Inquiry</h2>");
            
            emailBody.append("<table style=\"border-collapse: collapse; width: 100%; max-width: 600px;\">");
            emailBody.append("<tr><td style=\"padding: 10px; border: 1px solid #ddd; background: #f8f9fa; width: 30%;\"><strong>Product:</strong></td>");
            emailBody.append("<td style=\"padding: 10px; border: 1px solid #ddd;\"><strong>").append(productName).append("</strong></td></tr>");
            
            emailBody.append("<tr><td style=\"padding: 10px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Inquirer:</strong></td>");
            emailBody.append("<td style=\"padding: 10px; border: 1px solid #ddd;\">").append(name).append("</td></tr>");
            
            if (!company.isEmpty()) {
                emailBody.append("<tr><td style=\"padding: 10px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Company:</strong></td>");
                emailBody.append("<td style=\"padding: 10px; border: 1px solid #ddd;\">").append(company).append("</td></tr>");
            }
            
            emailBody.append("<tr><td style=\"padding: 10px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Email:</strong></td>");
            emailBody.append("<td style=\"padding: 10px; border: 1px solid #ddd;\">").append(email).append("</td></tr>");
            
            if (!phone.isEmpty()) {
                emailBody.append("<tr><td style=\"padding: 10px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Phone:</strong></td>");
                emailBody.append("<td style=\"padding: 10px; border: 1px solid #ddd;\">").append(phone).append("</td></tr>");
            }
            
            if (!quantity.isEmpty()) {
                emailBody.append("<tr><td style=\"padding: 10px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Quantity:</strong></td>");
                emailBody.append("<td style=\"padding: 10px; border: 1px solid #ddd;\">").append(quantity).append("</td></tr>");
            }
            
            if (!application.isEmpty()) {
                emailBody.append("<tr><td style=\"padding: 10px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Application:</strong></td>");
                emailBody.append("<td style=\"padding: 10px; border: 1px solid #ddd;\">").append(application).append("</td></tr>");
            }
            
            if (!timeline.isEmpty()) {
                emailBody.append("<tr><td style=\"padding: 10px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Timeline:</strong></td>");
                emailBody.append("<td style=\"padding: 10px; border: 1px solid #ddd;\">").append(timeline).append("</td></tr>");
            }
            
            if (!additionalInfo.isEmpty()) {
                emailBody.append("<tr><td style=\"padding: 10px; border: 1px solid #ddd; background: #f8f9fa; vertical-align: top;\"><strong>Additional Info:</strong></td>");
                emailBody.append("<td style=\"padding: 10px; border: 1px solid #ddd;\">").append(additionalInfo.replace("\n", "<br>")).append("</td></tr>");
            }
            
            emailBody.append("</table>");
            
            emailBody.append("<div style=\"margin-top: 20px; padding: 15px; background: #e8f4f8; border-radius: 5px;\">");
            emailBody.append("<p><strong>Action Required:</strong> This inquiry requires a quote and technical review.</p>");
            emailBody.append("</div>");
            
            emailBody.append("</body></html>");
            
            // Send email
            emailService.sendEmail("sales@precisiontech.com", subject, emailBody.toString(), email);
            
            // Send confirmation
            sendInquiryConfirmation(name, email, productName);
            
            // Return response
            out.write("{\"success\": true, \"message\": \"Your inquiry has been submitted. Our sales team will contact you shortly.\"}");
            
        } catch (Exception e) {
            e.printStackTrace();
            out.write("{\"success\": false, \"message\": \"An error occurred. Please try again later.\"}");
        }
    }
    
    private String sanitize(String input) {
        if (input == null) return "";
        return input.trim()
                   .replaceAll("<", "&lt;")
                   .replaceAll(">", "&gt;")
                   .replaceAll("\"", "&quot;")
                   .replaceAll("'", "&#39;");
    }
    
    private void sendInquiryConfirmation(String name, String email, String productName) throws Exception {
        String subject = "Thank you for your inquiry about " + productName;
        String body = buildInquiryConfirmation(name, productName);
        emailService.sendEmailAsync(email, subject, body, "no-reply@precisiontech.com");
    }
    
    private String buildInquiryConfirmation(String name, String productName) {
        return "<html><body style=\"font-family: Arial, sans-serif;\">" +
               "<div style=\"max-width: 600px; margin: 0 auto; padding: 20px;\">" +
               "<h2 style=\"color: #004080;\">Product Inquiry Received</h2>" +
               "<p>Dear " + name + ",</p>" +
               "<p>Thank you for your interest in <strong>" + productName + "</strong>.</p>" +
               "<div style=\"background: #f8f9fa; padding: 20px; border-radius: 5px; margin: 20px 0;\">" +
               "<p><strong>Next Steps:</strong></p>" +
               "<ol>" +
               "<li>Our technical team will review your requirements</li>" +
               "<li>We'll prepare a detailed quotation</li>" +
               "<li>A sales representative will contact you within 1-2 business days</li>" +
               "</ol>" +
               "</div>" +
               "<p>In the meantime, you can:</p>" +
               "<ul>" +
               "<li><a href=\"#\" style=\"color: #004080;\">Download the product datasheet</a></li>" +
               "<li><a href=\"#\" style=\"color: #004080;\">View technical specifications</a></li>" +
               "<li><a href=\"#\" style=\"color: #004080;\">Schedule a demo</a></li>" +
               "</ul>" +
               "<p>For immediate assistance, please call our sales team at <strong>+1 (555) 987-6543</strong>.</p>" +
               "<p>Best regards,<br>Precision Tech Sales Team</p>" +
               "</div></body></html>";
    }
}