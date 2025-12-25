package com.posadskiy.swingteacherdesktop.tables;

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
    
    private static final long serialVersionUID = -5527568548002296042L;
    
    public Lesson {
        // Ensure immutable list
        tasks = tasks == null ? List.of() : List.copyOf(tasks);
    }
    
    public Optional<Task> findTaskByNumber(int number) {
        return tasks.stream()
            .filter(task -> task.taskNumber() != null && task.taskNumber() == number)
            .findFirst();
    }
    
    public int taskCount() {
        return tasks.size();
    }
    
    @Override
    public String toString() {
        return Optional.ofNullable(lessonName).orElse("Unnamed Lesson");
    }
}
