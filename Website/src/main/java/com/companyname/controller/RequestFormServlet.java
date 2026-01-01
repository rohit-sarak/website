package com.companyname.controller;

import com.companyname.service.EmailService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

@WebServlet("/submit-request")
@MultipartConfig
public class RequestFormServlet extends HttpServlet {
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
            // Get form parameters
            String firstName = sanitize(request.getParameter("firstName"));
            String lastName = sanitize(request.getParameter("lastName"));
            String title = sanitize(request.getParameter("title"));
            String company = sanitize(request.getParameter("company"));
            String address = sanitize(request.getParameter("address"));
            String city = sanitize(request.getParameter("city"));
            String state = sanitize(request.getParameter("state"));
            String country = sanitize(request.getParameter("country"));
            String zipCode = sanitize(request.getParameter("zipCode"));
            String email = sanitize(request.getParameter("email"));
            String phone = sanitize(request.getParameter("phone"));
            String fax = sanitize(request.getParameter("fax"));
            String additionalInfo = sanitize(request.getParameter("additionalInfo"));
            String actionRequired = sanitize(request.getParameter("actionRequired"));
            String businessType = sanitize(request.getParameter("businessType"));
            String verification = sanitize(request.getParameter("verification"));
            
            // Validate human verification (simple math)
            if (!isValidVerification(verification)) {
                out.write("{\"success\": false, \"message\": \"Verification failed. Please try again.\"}");
                return;
            }
            
            // Validate required fields
            if (firstName.isEmpty() || lastName.isEmpty() || email.isEmpty() || company.isEmpty()) {
                out.write("{\"success\": false, \"message\": \"Please fill in all required fields.\"}");
                return;
            }
            
            // Build email content
            String subject = "New Product/Service Request - " + company;
            
            StringBuilder emailBody = new StringBuilder();
            emailBody.append("<html><body style=\"font-family: Arial, sans-serif;\">");
            emailBody.append("<h2 style=\"color: #004080;\">New Request Form Submission</h2>");
            emailBody.append("<table style=\"border-collapse: collapse; width: 100%;\">");
            emailBody.append("<tr><td style=\"padding: 8px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Name:</strong></td><td style=\"padding: 8px; border: 1px solid #ddd;\">")
                     .append(firstName).append(" ").append(lastName).append("</td></tr>");
            emailBody.append("<tr><td style=\"padding: 8px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Title:</strong></td><td style=\"padding: 8px; border: 1px solid #ddd;\">")
                     .append(title).append("</td></tr>");
            emailBody.append("<tr><td style=\"padding: 8px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Company:</strong></td><td style=\"padding: 8px; border: 1px solid #ddd;\">")
                     .append(company).append("</td></tr>");
            emailBody.append("<tr><td style=\"padding: 8px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Email:</strong></td><td style=\"padding: 8px; border: 1px solid #ddd;\">")
                     .append(email).append("</td></tr>");
            emailBody.append("<tr><td style=\"padding: 8px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Phone:</strong></td><td style=\"padding: 8px; border: 1px solid #ddd;\">")
                     .append(phone).append("</td></tr>");
            emailBody.append("<tr><td style=\"padding: 8px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Address:</strong></td><td style=\"padding: 8px; border: 1px solid #ddd;\">")
                     .append(address).append(", ").append(city).append(", ").append(state).append(" ").append(zipCode).append("</td></tr>");
            emailBody.append("<tr><td style=\"padding: 8px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Country:</strong></td><td style=\"padding: 8px; border: 1px solid #ddd;\">")
                     .append(country).append("</td></tr>");
            emailBody.append("<tr><td style=\"padding: 8px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Action Required:</strong></td><td style=\"padding: 8px; border: 1px solid #ddd;\">")
                     .append(actionRequired).append("</td></tr>");
            emailBody.append("<tr><td style=\"padding: 8px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Business Type:</strong></td><td style=\"padding: 8px; border: 1px solid #ddd;\">")
                     .append(businessType).append("</td></tr>");
            emailBody.append("<tr><td style=\"padding: 8px; border: 1px solid #ddd; background: #f8f9fa;\"><strong>Additional Information:</strong></td><td style=\"padding: 8px; border: 1px solid #ddd;\">")
                     .append(additionalInfo).append("</td></tr>");
            emailBody.append("</table>");
            emailBody.append("<p style=\"margin-top: 20px; color: #4B4B4B;\">This request was submitted via the website contact form.</p>");
            emailBody.append("</body></html>");
            
            // Send email
            emailService.sendEmail(
                "sales@companyname.com", // Recipient
                subject,
                emailBody.toString(),
                email // Reply-to
            );
            
            // Send confirmation to user
            String userSubject = "Thank you for your request - " + company;
            String userBody = buildUserConfirmation(firstName, lastName, company);
            emailService.sendEmail(email, userSubject, userBody, "no-reply@companyname.com");
            
            // Return success response
            out.write("{\"success\": true, \"message\": \"Your request has been submitted successfully. We'll contact you shortly.\"}");
            
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
    
    private boolean isValidVerification(String verification) {
        try {
            // Simple math verification: "5+3=8"
            String[] parts = verification.split("=");
            if (parts.length != 2) return false;
            
            String expression = parts[0].trim();
            int expectedAnswer = Integer.parseInt(parts[1].trim());
            
            if (expression.contains("+")) {
                String[] numbers = expression.split("\\+");
                int num1 = Integer.parseInt(numbers[0].trim());
                int num2 = Integer.parseInt(numbers[1].trim());
                return (num1 + num2) == expectedAnswer;
            } else if (expression.contains("-")) {
                String[] numbers = expression.split("-");
                int num1 = Integer.parseInt(numbers[0].trim());
                int num2 = Integer.parseInt(numbers[1].trim());
                return (num1 - num2) == expectedAnswer;
            }
        } catch (Exception e) {
            return false;
        }
        return false;
    }
    
    private String buildUserConfirmation(String firstName, String lastName, String company) {
        return "<html><body style=\"font-family: Arial, sans-serif;\">" +
               "<h2 style=\"color: #004080;\">Thank You for Your Request</h2>" +
               "<p>Dear " + firstName + " " + lastName + ",</p>" +
               "<p>We have received your request on behalf of <strong>" + company + "</strong>.</p>" +
               "<p>Our sales team will review your inquiry and contact you within 24-48 hours.</p>" +
               "<p>For urgent matters, please call us at +1 (555) 123-4567.</p>" +
               "<br><p>Best regards,<br>Precision Tech Sales Team</p>" +
               "</body></html>";
    }
}