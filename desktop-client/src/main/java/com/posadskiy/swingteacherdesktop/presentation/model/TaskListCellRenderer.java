package com.posadskiy.swingteacherdesktop.presentation.model;

import com.posadskiy.swingteacherdesktop.domain.model.Task;

import javax.swing.*;
import java.awt.*;
import java.util.Set;

/**
 * Custom renderer for task list that shows completed tasks with a checkmark.
 */
public class TaskListCellRenderer extends DefaultListCellRenderer {
    
    private final Set<Integer> completedTaskIds;
    
    public TaskListCellRenderer(Set<Integer> completedTaskIds) {
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
        
        if (value instanceof Task task) {
            var displayText = task.toString();
            if (task.id() != null && completedTaskIds.contains(task.id())) {
                displayText = "✓ " + displayText;
                if (!isSelected) {
                    setForeground(new Color(0, 128, 0)); // Green for completed
                }
            }
            setText(displayText);
        }
        
        return this;
    }
}


