package com.posadskiy.swingteacherdesktop.tables;

import java.io.Serializable;

/**
 * Immutable shorthand entity for code completion.
 */
public record Shorthand(
    Integer id,
    String shortText,
    String fullText
) implements Serializable {
    
    private static final long serialVersionUID = -1L;
    
    // Compatibility getters
    public Integer getId() { return id; }
    public String getShortText() { return shortText; }
    public String getFullText() { return fullText; }
    
    public static Shorthand of(Integer id, String shortText, String fullText) {
        return new Shorthand(id, shortText, fullText);
    }
}
