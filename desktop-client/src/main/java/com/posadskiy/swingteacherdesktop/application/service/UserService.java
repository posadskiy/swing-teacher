package com.posadskiy.swingteacherdesktop.application.service;

import com.posadskiy.swingteacherdesktop.domain.model.User;
import com.posadskiy.swingteacherdesktop.domain.repository.UserRepository;
import com.posadskiy.swingteacherdesktop.infrastructure.state.AppState;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.Optional;

/**
 * Application service for user operations.
 */
@Slf4j
@Service
public class UserService {
    
    private final UserRepository userRepository;
    private final AppState appState;
    
    public UserService(UserRepository userRepository, AppState appState) {
        this.userRepository = userRepository;
        this.appState = appState;
    }
    
    /**
     * Authenticates user and updates app state.
     */
    public boolean authenticate(String login, String password) {
        try {
            Optional<User> user = userRepository.getUserByLoginAndPassword(login, password);
            if (user.isPresent()) {
                appState.setCurrentUser(user.get());
                log.debug("User {} authenticated successfully", login);
                return true;
            }
            log.debug("Authentication failed for user {}", login);
            return false;
        } catch (SQLException ex) {
            log.error("Failed to authenticate user {}", login, ex);
            return false;
        }
    }
    
    /**
     * Registers a new user.
     */
    public boolean registerUser(User user) {
        try {
            userRepository.addUser(user);
            log.debug("User {} registered successfully", user.login());
            return true;
        } catch (SQLException ex) {
            log.error("Failed to register user {}", user.login(), ex);
            return false;
        }
    }
    
    /**
     * Gets the current logged-in user.
     */
    public Optional<User> getCurrentUser() {
        return appState.getCurrentUserOptional();
    }
    
    /**
     * Logs out the current user.
     */
    public void logout() {
        appState.clearUser();
        log.debug("User logged out");
    }
    
    /**
     * Checks if a user is currently authenticated.
     */
    public boolean isAuthenticated() {
        return appState.isAuthenticated();
    }
}

