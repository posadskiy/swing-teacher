package com.posadskiy.swingteacherdesktop.domain.checker.validation;

import java.util.regex.Pattern;

/**
 * Validators for user input (login, password, email).
 */
public final class UserInputValidators {
    
    private static final Pattern EMAIL_PATTERN = Pattern.compile(
        "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
    );
    
    private static final int MIN_LOGIN_LENGTH = 3;
    private static final int MIN_PASSWORD_LENGTH = 6;
    
    private UserInputValidators() {
        // Utility class - prevent instantiation
    }
    
    /**
     * Validates login string.
     * Login must be at least 3 characters and contain only alphanumeric characters.
     */
    public static boolean isValidLogin(String login) {
        if (login == null || login.length() < MIN_LOGIN_LENGTH) {
            return false;
        }
        return login.matches("^[a-zA-Z0-9_]+$");
    }
    
    /**
     * Validates password and password confirmation.
     * Password must be at least 6 characters and match the repeat.
     */
    public static boolean isValidPassword(String password, String passwordRepeat) {
        if (password == null || password.length() < MIN_PASSWORD_LENGTH) {
            return false;
        }
        return password.equals(passwordRepeat);
    }
    
    /**
     * Validates email address format.
     */
    public static boolean isValidEmail(String email) {
        if (email == null || email.isBlank()) {
            return false;
        }
        return EMAIL_PATTERN.matcher(email).matches();
    }
}


