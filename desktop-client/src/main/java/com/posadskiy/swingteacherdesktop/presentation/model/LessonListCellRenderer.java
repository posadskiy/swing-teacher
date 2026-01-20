package com.posadskiy.swingteacherdesktop.presentation.model;

import com.posadskiy.swingteacherdesktop.domain.model.Lesson;

import javax.swing.*;
import java.awt.*;
import java.util.Set;

/**
 * Custom renderer for lesson list that shows completed lessons with a checkmark.
 * A lesson is considered completed when all its tasks are completed.
 */
public class LessonListCellRenderer extends DefaultListCellRenderer {

    private final Set<Integer> completedTaskIds;

    public LessonListCellRenderer(Set<Integer> completedTaskIds) {
        this.completedTaskIds = completedTaskIds;
    }

    @Override
    public Component getListCellRendererComponent(
        JList<?> list,
        Object value,
        int index,
        boolean isSelected,
        boolean cellHasFocus
    ) {
        super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);

        if (value instanceof Lesson lesson) {
            var displayText = lesson.toString();
            if (isLessonCompleted(lesson)) {
                displayText = "✓ " + displayText;
                if (!isSelected) {
                    setForeground(new Color(0, 128, 0)); // Green for completed
                }
            }
            setText(displayText);
        }

        return this;
    }

    /**
     * Checks if all tasks in a lesson are completed.
     */
    private boolean isLessonCompleted(Lesson lesson) {
        if (lesson == null || lesson.tasks() == null || lesson.tasks().isEmpty()) {
            return false;
        }
        return lesson.tasks().stream()
            .allMatch(task -> task.id() != null && completedTaskIds.contains(task.id()));
    }
}
