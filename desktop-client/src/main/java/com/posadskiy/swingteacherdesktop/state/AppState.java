package com.posadskiy.swingteacherdesktop.state;

import com.posadskiy.swingteacherdesktop.tables.User;
import org.springframework.stereotype.Component;

import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

/**
 * Application state holder using atomic references for thread safety.
 */
@Component
public class AppState {
    
    private static final User EMPTY_USER = new User();
    
    private final AtomicReference<User> currentUser = new AtomicReference<>(EMPTY_USER);
    
    public User getCurrentUser() {
        return currentUser.get();
    }
    
    public Optional<User> getCurrentUserOptional() {
        var user = currentUser.get();
        return user.isAuthenticated() ? Optional.of(user) : Optional.empty();
    }
    
    public void setCurrentUser(User user) {
        currentUser.set(user != null ? user : EMPTY_USER);
    }
    
    public boolean isAuthenticated() {
        return currentUser.get().isAuthenticated();
    }
    
    public void clearUser() {
        currentUser.set(EMPTY_USER);
    }
    
    /**
     * Atomically updates user if current user matches expected.
     */
    public boolean compareAndSetUser(User expected, User newUser) {
        return currentUser.compareAndSet(expected, newUser != null ? newUser : EMPTY_USER);
    }
}
