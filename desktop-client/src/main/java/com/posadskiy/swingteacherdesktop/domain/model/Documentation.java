package com.posadskiy.swingteacherdesktop.domain.model;

import java.io.Serializable;

/**
 * Immutable documentation entity.
 */
public record Documentation(
    Integer id,
    String text
) implements Serializable {
    
    private static final long serialVersionUID = -5527566248002696042L;
    
    public static Documentation of(Integer id, String text) {
        return new Documentation(id, text);
    }
}


