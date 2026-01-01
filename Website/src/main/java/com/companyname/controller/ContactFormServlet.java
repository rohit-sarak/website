package com.companyname.controller;

import com.companyname.service.EmailService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/submit-contact")
@MultipartConfig
public class ContactFormServlet extends HttpServlet {
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
        response.setHeader("X-Content-Type-Options", "nosniff");
        
        PrintWriter out = response.getWriter();
        
        try {
            // Get and sanitize parameters
            String name = sanitize(request.getParameter("name"));
            String email = sanitize(request.getParameter("email"));
            String phone = sanitize(request.getParameter("phone"));
            String subject = sanitize(request.getParameter("subject"));
            String message = sanitize(request.getParameter("message"));
            String department = sanitize(request.getParameter("department"));
            
            // Validate input
            if (name.isEmpty() || email.isEmpty() || message.isEmpty()) {
                out.write("{\"success\": false, \"message\": \"Name, email, and message are required.\"}");
                return;
            }
            
            if (!emailService.isValidEmail(email)) {
                out.write("{\"success\": false, \"message\": \"Please provide a valid email address.\"}");
                return;
            }
            
            // Determine recipient based on department
            String recipient = determineRecipient(department);
            String emailSubject = subject.isEmpty() ? "Contact Form Submission from " + name : subject;
            
            // Build HTML email
            StringBuilder emailBody = new StringBuilder();
            emailBody.append("<html><body style=\"font-family: Arial, sans-serif; line-height: 1.6; color: #333;\">");
            emailBody.append("<div style=\"max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #e0e0e0; border-radius: 10px;\">");
            emailBody.append("<h2 style=\"color: #004080; border-bottom: 2px solid #20C997; padding-bottom: 10px;\">");
            emailBody.append("New Contact Form Submission</h2>");
            
            emailBody.append("<table style=\"width: 100%; border-collapse: collapse; margin: 20px 0;\">");
            emailBody.append("<tr><td style=\"padding: 10px; border: 1px solid #ddd; background: #f8f9fa; width: 30%;\"><strong>Name:</strong></td>");
            emailBody.append("<td style=\"padding: 10px; border: 1px solid #ddd;\">").append(name).append("</td></tr>");
            
            emailBody.append("<tr><td style=\"padding: 10px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Email:</strong></td>");
            emailBody.append("<td style=\"padding: 10px; border: 1px solid #ddd;\">").append(email).append("</td></tr>");
            
            if (!phone.isEmpty()) {
                emailBody.append("<tr><td style=\"padding: 10px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Phone:</strong></td>");
                emailBody.append("<td style=\"padding: 10px; border: 1px solid #ddd;\">").append(phone).append("</td></tr>");
            }
            
            if (!department.isEmpty()) {
                emailBody.append("<tr><td style=\"padding: 10px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Department:</strong></td>");
                emailBody.append("<td style=\"padding: 10px; border: 1px solid #ddd;\">").append(department).append("</td></tr>");
            }
            
            emailBody.append("<tr><td style=\"padding: 10px; border: 1px solid #ddd; background: #f8f9fa; vertical-align: top;\"><strong>Message:</strong></td>");
            emailBody.append("<td style=\"padding: 10px; border: 1px solid #ddd;\">").append(message.replace("\n", "<br>")).append("</td></tr>");
            emailBody.append("</table>");
            
            emailBody.append("<div style=\"margin-top: 30px; padding: 15px; background: #f8f9fa; border-radius: 5px; font-size: 0.9em; color: #666;\">");
            emailBody.append("<p><strong>Submission Details:</strong></p>");
            emailBody.append("<p>Time: ").append(new java.util.Date()).append("</p>");
            emailBody.append("<p>IP Address: ").append(request.getRemoteAddr()).append("</p>");
            emailBody.append("</div>");
            
            emailBody.append("</div></body></html>");
            
            // Send email to company
            emailService.sendEmail(recipient, emailSubject, emailBody.toString(), email);
            
            // Send confirmation to user
            sendConfirmationEmail(name, email);
            
            // Log the submission
            logSubmission(name, email, request.getRemoteAddr());
            
            // Return success response
            out.write("{\"success\": true, \"message\": \"Thank you for your message. We'll get back to you soon.\"}");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.write("{\"success\": false, \"message\": \"An error occurred while processing your request. Please try again later.\"}");
        }
    }
    
    private String sanitize(String input) {
        if (input == null) return "";
        return input.trim()
                   .replaceAll("<", "&lt;")
                   .replaceAll(">", "&gt;")
                   .replaceAll("\"", "&quot;")
                   .replaceAll("'", "&#39;")
                   .replaceAll("\r\n|\n", "<br>");
    }
    
    private String determineRecipient(String department) {
        switch (department) {
            case "sales":
                return "sales@precisiontech.com";
            case "technical":
                return "support@precisiontech.com";
            case "parts":
                return "parts@precisiontech.com";
            case "hr":
                return "hr@precisiontech.com";
            default:
                return "info@precisiontech.com";
        }
    }
    
    private void sendConfirmationEmail(String name, String email) throws Exception {
        String subject = "Thank you for contacting Precision Tech";
        String body = buildConfirmationEmail(name);
        emailService.sendEmailAsync(email, subject, body, "no-reply@precisiontech.com");
    }
    
    private String buildConfirmationEmail(String name) {
        return "<html><body style=\"font-family: Arial, sans-serif; line-height: 1.6; color: #333;\">" +
               "<div style=\"max-width: 600px; margin: 0 auto; padding: 20px;\">" +
               "<h2 style=\"color: #004080;\">Thank You for Contacting Us</h2>" +
               "<p>Dear " + name + ",</p>" +
               "<p>We have received your message and will respond within 24-48 hours during business days.</p>" +
               "<div style=\"background: #f8f9fa; padding: 20px; border-radius: 5px; margin: 20px 0;\">" +
               "<p><strong>What to expect next:</strong></p>" +
               "<ul>" +
               "<li>A team member will review your inquiry</li>" +
               "<li>We may contact you for additional information</li>" +
               "<li>You'll receive a detailed response to your questions</li>" +
               "</ul>" +
               "</div>" +
               "<p>For urgent matters, please call us at <strong>+1 (555) 123-4567</strong>.</p>" +
               "<p>Best regards,<br>The Precision Tech Team</p>" +
               "<hr style=\"border: none; border-top: 1px solid #e0e0e0; margin: 30px 0;\">" +
               "<p style=\"font-size: 0.8em; color: #666;\">" +
               "Precision Tech Industries<br>123 Precision Avenue, Tech Park, CA 94000<br>" +
               "Phone: +1 (555) 123-4567 | Email: info@precisiontech.com" +
               "</p>" +
               "</div></body></html>";
    }
    
    private void logSubmission(String name, String email, String ipAddress) {
        String logEntry = String.format(
            "[%s] Contact Form: %s <%s> from %s",
            new java.util.Date(),
            name,
            email,
            ipAddress
        );
        System.out.println(logEntry);
        // Could also log to file or database
    }
    
    @Override
    public void destroy() {
        if (emailService != null) {
            emailService.shutdown();
        }
        super.destroy();
    }
}