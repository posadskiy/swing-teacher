package com.posadskiy.swingteacherdesktop.tables;

import java.io.Serializable;

/**
 * Immutable keyword entity.
 */
public record Keyword(
    Integer id,
    String keywordText
) implements Serializable {
    
    private static final long serialVersionUID = -1L;
    
    // Compatibility getters
    public Integer getId() { return id; }
    public String getKeywordText() { return keywordText; }
    
    public static Keyword of(Integer id, String keywordText) {
        return new Keyword(id, keywordText);
    }
}
