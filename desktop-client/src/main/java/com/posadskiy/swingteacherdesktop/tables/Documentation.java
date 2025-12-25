package com.posadskiy.swingteacherdesktop.tables;

import java.io.Serializable;
import java.util.Optional;

/**
 * Immutable documentation entity.
 */
public record Documentation(
    Integer id,
    String text
) implements Serializable {
    
    private static final long serialVersionUID = -5527568544502296042L;
    
    public Optional<String> getTextOptional() {
        return Optional.ofNullable(text).filter(s -> !s.isBlank());
    }
    
    public boolean hasContent() {
        return text != null && !text.isBlank();
    }
    
    // Compatibility getters
    public Integer getId() { return id; }
    public String getText() { return text; }
    
    public static Documentation of(Integer id, String text) {
        return new Documentation(id, text);
    }
}
