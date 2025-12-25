package com.posadskiy.swingteacherdesktop.tables;

import java.io.Serializable;

/**
 * Immutable completed task entity.
 */
public record CompletedTask(
    Integer id,
    Integer userId,
    Integer taskId
) implements Serializable {
    
    private static final long serialVersionUID = -5527568542422296042L;
    
    // Compatibility getters
    public Integer getId() { return id; }
    public Integer getUserId() { return userId; }
    public Integer getTaskId() { return taskId; }
    
    public static CompletedTask of(Integer id, Integer userId, Integer taskId) {
        return new CompletedTask(id, userId, taskId);
    }
    
    public static CompletedTask forUser(Integer userId, Integer taskId) {
        return new CompletedTask(null, userId, taskId);
    }
}
