package com.posadskiy.swingteacherdesktop.models;

import javax.swing.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DPosadsky
 */
public class ComboBoxModel<T> extends DefaultComboBoxModel<T> {

    public ComboBoxModel(List<T> components) {
        // Convert to ArrayList to ensure mutable list and avoid casting issues with immutable lists
        super(new ArrayList<>(components).toArray((T[]) new Object[components.size()]));
    }

    @Override
    public T getSelectedItem() {
        T selectedComponent = (T) super.getSelectedItem();
        return selectedComponent;
    }

}
