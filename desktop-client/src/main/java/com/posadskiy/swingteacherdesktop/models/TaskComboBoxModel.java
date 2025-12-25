package com.posadskiy.swingteacherdesktop.models;

import com.posadskiy.swingteacherdesktop.tables.Task;

import javax.swing.*;
import javax.swing.ComboBoxModel;
import java.util.ArrayList;

/**
 *
 * @author DPosadsky
 */
public class TaskComboBoxModel extends AbstractListModel implements ComboBoxModel {

    ArrayList<Task> tasks = null;

    Task selection = null;

    public TaskComboBoxModel() {
        super();
    }

    public TaskComboBoxModel(ArrayList<Task> components) {
        super();
        tasks = components;
    }

    @Override
    public int getSize() {
        if (tasks == null)
            return 0;
        return tasks.size();
    }

    @Override
    public Object getElementAt(int i) {
        if (tasks == null)
            return null;
        return tasks.get(i);
    }

    @Override
    public Object getSelectedItem() {
        return selection;
    }

    @Override
    public void setSelectedItem(Object o) {
        selection = (Task) o;
    }

}
