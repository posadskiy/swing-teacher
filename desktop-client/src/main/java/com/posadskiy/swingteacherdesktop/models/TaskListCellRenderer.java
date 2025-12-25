package com.posadskiy.swingteacherdesktop.models;

import com.posadskiy.swingteacherdesktop.tables.Task;

import javax.swing.*;
import java.awt.*;
import java.util.Set;

/**
 * Custom renderer for task combo box that displays checkmarks for completed tasks.
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
            boolean cellHasFocus) {
        
        super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);
        
        if (value instanceof Task task) {
            var title = task.title();
            if (task.id() != null && completedTaskIds.contains(task.id())) {
                setText("☑ " + title);
                setForeground(isSelected ? list.getSelectionForeground() : new Color(0, 128, 0));
            } else {
                setText(title);
            }
        }
        
        return this;
    }
}

