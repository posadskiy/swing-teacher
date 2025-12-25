package com.posadskiy.swingteacherdesktop.presentation.model;

import javax.swing.*;
import java.util.List;

/**
 * Generic combo box model for domain objects.
 */
public class ComboBoxModel<T> extends DefaultComboBoxModel<T> {
    
    public ComboBoxModel(List<T> items) {
        super();
        items.forEach(this::addElement);
    }
    
    public void setItems(List<T> items) {
        removeAllElements();
        items.forEach(this::addElement);
    }
}

