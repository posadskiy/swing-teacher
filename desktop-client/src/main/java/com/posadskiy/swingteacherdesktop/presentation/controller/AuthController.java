package com.posadskiy.swingteacherdesktop.presentation.controller;

import com.posadskiy.swingteacherdesktop.application.service.UserService;
import org.springframework.stereotype.Component;

/**
 * Controller for authentication view.
 */
@Component
public class AuthController {

    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    /**
     * Authenticates user with provided credentials.
     */
    public boolean authenticate(String login, String password) {
        return userService.authenticate(login, password);
    }
    
    /**
     * Checks if user is currently authenticated.
     */
    public boolean isAuthenticated() {
        return userService.isAuthenticated();
    }
}


