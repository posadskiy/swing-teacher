package com.posadskiy.swingteacherdesktop.presentation.controller;

import com.posadskiy.swingteacherdesktop.application.service.TaskCheckingService;
import com.posadskiy.swingteacherdesktop.application.service.UserService;
import com.posadskiy.swingteacherdesktop.domain.model.User;
import com.posadskiy.swingteacherdesktop.presentation.navigation.AppNavigator;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.stereotype.Component;

/**
 * Controller for registration view.
 */
@Slf4j
@Component
public class RegistrationController {

    private final UserService userService;
    private final TaskCheckingService taskCheckingService;
    private final ObjectProvider<AppNavigator> navigatorProvider;

    public RegistrationController(
        UserService userService,
        TaskCheckingService taskCheckingService,
        ObjectProvider<AppNavigator> navigatorProvider
    ) {
        this.userService = userService;
        this.taskCheckingService = taskCheckingService;
        this.navigatorProvider = navigatorProvider;
    }

    /**
     * Validates and registers a new user.
     * 
     * @return ValidationResult with success status and field errors
     */
    public ValidationResult register(
        String login, 
        String password, 
        String passwordRepeat, 
        String email
    ) {
        var result = new ValidationResult();
        
        // Validate login
        if (!taskCheckingService.isValidLogin(login)) {
            result.addError("login", "Invalid login format");
        }

        // Validate password
        if (!taskCheckingService.isValidPassword(password, passwordRepeat)) {
            result.addError("password", "Invalid password or passwords don't match");
        }

        // Validate email
        if (!taskCheckingService.isValidEmail(email)) {
            result.addError("email", "Invalid email format");
        }

        if (result.hasErrors()) {
            return result;
        }

        // Create and register user
        var user = User.builder()
            .login(login)
            .password(password)
            .email(email)
            .build();
        
        boolean success = userService.registerUser(user);
        result.setSuccess(success);
        
        return result;
    }

    /**
     * Closes the registration view.
     */
    public void closeRegistration() {
        navigatorProvider.getObject().hideRegistration();
    }
    
    /**
     * Result of validation/registration attempt.
     */
    public static class ValidationResult {
        private boolean success = true;
        private final java.util.Map<String, String> fieldErrors = new java.util.HashMap<>();
        
        public void addError(String field, String message) {
            fieldErrors.put(field, message);
            success = false;
        }
        
        public boolean hasErrors() {
            return !fieldErrors.isEmpty();
        }
        
        public boolean hasError(String field) {
            return fieldErrors.containsKey(field);
        }
        
        public void setSuccess(boolean success) {
            this.success = success;
        }
        
        public boolean isSuccess() {
            return success && !hasErrors();
        }
    }
}

