package com.posadskiy.swingteacherdesktop.main.validation;

import java.util.regex.Pattern;

/**
 * Validators for user input (login, password, email).
 */
public final class UserInputValidators {
    
    private static final Pattern LOGIN_PATTERN = Pattern.compile("^[a-zA-Z0-9_]{3,20}$");
    private static final Pattern PASSWORD_PATTERN = Pattern.compile("^[\\S]{8,30}$");
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^.+@.+\\..+$");
    
    private UserInputValidators() {
        // Utility class - prevent instantiation
    }
    
    /**
     * Validates a login string.
     * Rules: 3-20 characters, alphanumeric and underscore only.
     */
    public static boolean isValidLogin(String login) {
        if (login == null) {
            return false;
        }
        return LOGIN_PATTERN.matcher(login).matches();
    }
    
    /**
     * Validates a password and checks if it matches the repeat.
     * Rules: 8-30 characters, no whitespace.
     */
    public static boolean isValidPassword(String password, String passwordRepeat) {
        if (password == null || passwordRepeat == null) {
            return false;
        }
        
        if (!PASSWORD_PATTERN.matcher(password).matches()) {
            return false;
        }
        
        return password.equals(passwordRepeat);
    }
    
    /**
     * Validates an email address.
     * Basic format: contains @ and at least one dot after @.
     */
    public static boolean isValidEmail(String email) {
        if (email == null) {
            return false;
        }
        return EMAIL_PATTERN.matcher(email).matches();
    }
}
