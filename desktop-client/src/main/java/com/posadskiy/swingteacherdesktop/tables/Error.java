package com.posadskiy.swingteacherdesktop.tables;

import java.io.Serializable;
import java.util.Optional;

/**
 * Immutable error entity.
 */
public record Error(
    Integer id,
    String errorText
) implements Serializable {
    
    private static final long serialVersionUID = -5527568543302296042L;
    
    public Optional<String> getErrorTextOptional() {
        return Optional.ofNullable(errorText);
    }
    
    // Compatibility getters
    public Integer getId() { return id; }
    public String getErrorText() { return errorText; }
    
    public static Error of(Integer id, String errorText) {
        return new Error(id, errorText);
    }
}
