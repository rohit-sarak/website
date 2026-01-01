package com.companyname.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class EmailConfig {
    private static final Properties properties = new Properties();
    private static final String CONFIG_FILE = "/email.properties";
    
    static {
        loadProperties();
    }
    
    private static void loadProperties() {
        try (InputStream input = EmailConfig.class.getResourceAsStream(CONFIG_FILE)) {
            if (input == null) {
                System.err.println("Email configuration file not found: " + CONFIG_FILE);
                loadDefaultProperties();
            } else {
                properties.load(input);
                validateProperties();
            }
        } catch (IOException e) {
            System.err.println("Failed to load email properties: " + e.getMessage());
            loadDefaultProperties();
        }
    }
    
    private static void loadDefaultProperties() {
        // Default development settings
        properties.setProperty("mail.smtp.host", "smtp.gmail.com");
        properties.setProperty("mail.smtp.port", "587");
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
        properties.setProperty("mail.smtp.connectiontimeout", "5000");
        properties.setProperty("mail.smtp.timeout", "5000");
        properties.setProperty("mail.smtp.writetimeout", "5000");
        properties.setProperty("mail.smtp.from", "no-reply@precisiontech.com");
        properties.setProperty("mail.smtp.user", "your-email@gmail.com");
        properties.setProperty("mail.smtp.password", "your-password");
        properties.setProperty("mail.debug", "false");
    }
    
    private static void validateProperties() {
        String[] requiredProps = {
            "mail.smtp.host",
            "mail.smtp.port",
            "mail.smtp.auth",
            "mail.smtp.starttls.enable",
            "mail.smtp.from"
        };
        
        for (String prop : requiredProps) {
            if (!properties.containsKey(prop) || properties.getProperty(prop).trim().isEmpty()) {
                System.err.println("Missing required email property: " + prop);
            }
        }
    }
    
    public static Properties getProperties() {
        return new Properties(properties); // Return copy to prevent modification
    }
    
    public static String getProperty(String key) {
        return properties.getProperty(key);
    }
    
    public static String getProperty(String key, String defaultValue) {
        return properties.getProperty(key, defaultValue);
    }
    
    public static boolean isDebugEnabled() {
        return Boolean.parseBoolean(properties.getProperty("mail.debug", "false"));
    }
    
    public static String getFromEmail() {
        return properties.getProperty("mail.smtp.from");
    }
    
    public static String getSmtpHost() {
        return properties.getProperty("mail.smtp.host");
    }
    
    public static int getSmtpPort() {
        return Integer.parseInt(properties.getProperty("mail.smtp.port", "587"));
    }
}