package com.posadskiy.swingteacherdesktop.domain.model;

import java.io.Serializable;

/**
 * Immutable keyword entity for code completion.
 */
public record Keyword(
    Integer id,
    String keywordText
) implements Serializable {
    
    private static final long serialVersionUID = -5527566248002896042L;
    
    public static Keyword of(Integer id, String keywordText) {
        return new Keyword(id, keywordText);
    }
}


