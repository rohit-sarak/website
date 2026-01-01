package com.companyname.service;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class EmailService {
    private final Properties emailProperties;
    private final ExecutorService emailExecutor;
    private final String username;
    private final String password;
    private final String fromEmail;
    
    public EmailService() {
        this.emailProperties = EmailConfig.getProperties();
        this.username = emailProperties.getProperty("mail.smtp.user");
        this.password = emailProperties.getProperty("mail.smtp.password");
        this.fromEmail = emailProperties.getProperty("mail.smtp.from");
        
        // Create thread pool for async email sending
        this.emailExecutor = Executors.newFixedThreadPool(5);
    }
    
    /**
     * Send HTML email synchronously
     */
    public void sendEmail(String to, String subject, String htmlContent, String replyTo) throws Exception {
        sendEmail(to, subject, htmlContent, replyTo, null);
    }
    
    /**
     * Send HTML email with attachment
     */
    public void sendEmail(String to, String subject, String htmlContent, String replyTo, String attachmentPath) throws Exception {
        Session session = Session.getInstance(emailProperties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail, "Precision Tech"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            
            // Set reply-to if provided
            if (replyTo != null && !replyTo.isEmpty()) {
                message.setReplyTo(new InternetAddress[] { new InternetAddress(replyTo) });
            }
            
            // Create multipart message
            MimeMultipart multipart = new MimeMultipart("related");
            
            // HTML content part
            BodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(htmlContent, "text/html; charset=utf-8");
            multipart.addBodyPart(messageBodyPart);
            
            // Add attachment if provided
            if (attachmentPath != null && !attachmentPath.isEmpty()) {
                MimeBodyPart attachmentPart = new MimeBodyPart();
                attachmentPart.attachFile(attachmentPath);
                multipart.addBodyPart(attachmentPart);
            }
            
            message.setContent(multipart);
            message.setSentDate(new java.util.Date());
            
            // Send message
            Transport.send(message);
            
            // Log successful send
            System.out.println("Email sent successfully to: " + to);
            
        } catch (Exception e) {
            System.err.println("Failed to send email to " + to + ": " + e.getMessage());
            throw new Exception("Failed to send email: " + e.getMessage(), e);
        }
    }
    
    /**
     * Send email asynchronously
     */
    public void sendEmailAsync(String to, String subject, String htmlContent, String replyTo) {
        emailExecutor.submit(() -> {
            try {
                sendEmail(to, subject, htmlContent, replyTo);
            } catch (Exception e) {
                System.err.println("Async email send failed: " + e.getMessage());
                // Optionally retry or log to database
            }
        });
    }
    
    /**
     * Send email to multiple recipients
     */
    public void sendBulkEmail(String[] recipients, String subject, String htmlContent) throws Exception {
        for (String recipient : recipients) {
            sendEmailAsync(recipient, subject, htmlContent, null);
        }
    }
    
    /**
     * Send plain text email
     */
    public void sendTextEmail(String to, String subject, String textContent) throws Exception {
        Session session = Session.getInstance(emailProperties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail, "Precision Tech"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(textContent);
            message.setSentDate(new java.util.Date());
            
            Transport.send(message);
            
        } catch (Exception e) {
            throw new Exception("Failed to send text email: " + e.getMessage(), e);
        }
    }
    
    /**
     * Validate email address format
     */
    public boolean isValidEmail(String email) {
        if (email == null || email.isEmpty()) return false;
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
        return email.matches(emailRegex);
    }
    
    /**
     * Cleanup resources
     */
    public void shutdown() {
        if (emailExecutor != null && !emailExecutor.isShutdown()) {
            emailExecutor.shutdown();
        }
    }
}