package com.posadskiy.swingteacherdesktop.domain.model;

import lombok.Builder;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;

/**
 * Immutable lesson entity using Java record with Lombok @Builder.
 */
@Builder(toBuilder = true)
public record Lesson(
    Integer id,
    Integer lessonNumber,
    String lessonName,
    Integer idTaskCategory,
    List<Task> tasks
) implements Serializable {
    
    private static final long serialVersionUID = -5527566248002396042L;
    
    public List<Task> tasks() {
        return Optional.ofNullable(tasks).orElse(List.of());
    }
    
    @Override
    public String toString() {
        return Optional.ofNullable(lessonName).orElse("Untitled Lesson");
    }
}

