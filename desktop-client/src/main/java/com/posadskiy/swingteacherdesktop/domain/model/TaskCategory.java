package com.posadskiy.swingteacherdesktop.domain.model;

import java.io.Serializable;

/**
 * Immutable task category entity.
 */
public record TaskCategory(
    Integer id,
    String name
) implements Serializable {
    
    private static final long serialVersionUID = -5527566248003096042L;
    
    public static TaskCategory of(Integer id, String name) {
        return new TaskCategory(id, name);
    }
}

