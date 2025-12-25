package com.posadskiy.swingteacherdesktop.tables;

import java.io.Serializable;

/**
 * Immutable task category entity.
 */
public record TaskCategory(
    Integer id,
    String name
) implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    // Compatibility getters
    public Integer getId() { return id; }
    public String getName() { return name; }
    
    public static TaskCategory of(Integer id, String name) {
        return new TaskCategory(id, name);
    }
    
    @Override
    public String toString() {
        return name != null ? name : "Unknown Category";
    }
}
