package com.posadskiy.swingteacherdesktop.domain.model;

import java.io.Serializable;

/**
 * Immutable error entity.
 */
public record Error(
    Integer id,
    String errorText
) implements Serializable {
    
    private static final long serialVersionUID = -5527566248002796042L;
    
    public static Error of(Integer id, String errorText) {
        return new Error(id, errorText);
    }
}


