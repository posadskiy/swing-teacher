package com.posadskiy.swingteacherdesktop.domain.model;

import java.io.Serializable;

/**
 * Immutable completed task entity.
 */
public record CompletedTask(
    Integer id,
    Integer userId,
    Integer taskId
) implements Serializable {
    
    private static final long serialVersionUID = -5527566248002596042L;
    
    public static CompletedTask of(Integer id, Integer userId, Integer taskId) {
        return new CompletedTask(id, userId, taskId);
    }
    
    public static CompletedTask forUser(Integer userId, Integer taskId) {
        return new CompletedTask(null, userId, taskId);
    }
}

