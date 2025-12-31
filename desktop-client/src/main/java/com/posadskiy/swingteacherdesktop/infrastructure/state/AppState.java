package com.posadskiy.swingteacherdesktop.infrastructure.state;

import com.posadskiy.swingteacherdesktop.domain.model.User;
import org.springframework.stereotype.Component;

import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

/**
 * Application state holder using atomic references for thread safety.
 * Supports property change notifications for language changes.
 */
@Component
public class AppState {
    
    private static final User EMPTY_USER = new User();
    
    private final AtomicReference<User> currentUser = new AtomicReference<>(EMPTY_USER);
    private final AtomicReference<String> currentLanguage = new AtomicReference<>("en");
    private final PropertyChangeSupport propertyChangeSupport;

    public AppState() {
        this.propertyChangeSupport = new PropertyChangeSupport(this);
    }
    
    public User getCurrentUser() {
        return currentUser.get();
    }
    
    public Optional<User> getCurrentUserOptional() {
        var user = currentUser.get();
        return user.isAuthenticated() ? Optional.of(user) : Optional.empty();
    }
    
    public void setCurrentUser(User user) {
        currentUser.set(user != null ? user : EMPTY_USER);
        // Update language from user preference
        if (user != null && user.preferredLanguage() != null) {
            setCurrentLanguage(user.getPreferredLanguageOrDefault());
        }
    }
    
    public boolean isAuthenticated() {
        return currentUser.get().isAuthenticated();
    }
    
    public void clearUser() {
        currentUser.set(EMPTY_USER);
        setCurrentLanguage("en");
    }
    
    /**
     * Atomically updates user if current user matches expected.
     */
    public boolean compareAndSetUser(User expected, User newUser) {
        boolean result = currentUser.compareAndSet(expected, newUser != null ? newUser : EMPTY_USER);
        if (result && newUser != null && newUser.preferredLanguage() != null) {
            setCurrentLanguage(newUser.getPreferredLanguageOrDefault());
        }
        return result;
    }

    /**
     * Gets the current language preference.
     */
    public String getCurrentLanguage() {
        return currentLanguage.get();
    }

    /**
     * Sets the current language preference and notifies listeners.
     */
    public void setCurrentLanguage(String languageCode) {
        String oldLanguage = currentLanguage.get();
        String newLanguage = languageCode != null ? languageCode : "en";
        currentLanguage.set(newLanguage);

        // Notify listeners of language change
        if (!oldLanguage.equals(newLanguage)) {
            propertyChangeSupport.firePropertyChange("language", oldLanguage, newLanguage);
        }
    }

    /**
     * Adds a property change listener for language changes.
     */
    public void addPropertyChangeListener(PropertyChangeListener listener) {
        propertyChangeSupport.addPropertyChangeListener(listener);
    }

    /**
     * Removes a property change listener.
     */
    public void removePropertyChangeListener(PropertyChangeListener listener) {
        propertyChangeSupport.removePropertyChangeListener(listener);
    }
}




