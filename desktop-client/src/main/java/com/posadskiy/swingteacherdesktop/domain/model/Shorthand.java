package com.posadskiy.swingteacherdesktop.domain.model;

import java.io.Serializable;

/**
 * Immutable shorthand entity for code completion.
 */
public record Shorthand(
    Integer id,
    String shortText,
    String fullText
) implements Serializable {
    
    private static final long serialVersionUID = -5527566248002996042L;
    
    public static Shorthand of(Integer id, String shortText, String fullText) {
        return new Shorthand(id, shortText, fullText);
    }
}

