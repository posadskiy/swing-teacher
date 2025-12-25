package com.posadskiy.swingteacherdesktop.presentation.controller;

import org.springframework.stereotype.Component;

import javax.swing.*;

/**
 * Controller for popup dialogs.
 */
@Component
public class PopupController {

    public void showMessage(JFrame parent, String message, String title, int option) {
        JOptionPane.showMessageDialog(parent, message, title, option);
    }

    public void showMessage(JFrame parent, String message, String title) {
        showMessage(parent, message, title, JOptionPane.DEFAULT_OPTION);
    }

    public void showMessage(String message, String title) {
        showMessage(new JFrame(), message, title, JOptionPane.DEFAULT_OPTION);
    }
    
    public void showError(String message) {
        showMessage(message, "Error!");
    }
    
    public void showSuccess(String message) {
        showMessage(message, "Success");
    }
}

