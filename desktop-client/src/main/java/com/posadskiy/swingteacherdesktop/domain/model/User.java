package com.posadskiy.swingteacherdesktop.domain.model;

import lombok.Builder;

import java.io.Serializable;
import java.util.Optional;

/**
 * Immutable user entity using Java record with Lombok @Builder.
 */
@Builder(toBuilder = true)
public record User(
    Integer id,
    String email,
    String login,
    String password,
    Integer logins,
    Integer lastLogin,
    Boolean completeTraining
) implements Serializable {
    
    private static final long serialVersionUID = -5527566248002496042L;
    
    /**
     * Creates an empty user (for compatibility with legacy code).
     */
    public User() {
        this(null, null, null, null, null, null, null);
    }
    
    public boolean hasCompletedTraining() {
        return Boolean.TRUE.equals(completeTraining);
    }
    
    public Optional<String> getEmailOptional() {
        return Optional.ofNullable(email).filter(s -> !s.isBlank());
    }
    
    public boolean isAuthenticated() {
        return id != null && login != null;
    }
}

