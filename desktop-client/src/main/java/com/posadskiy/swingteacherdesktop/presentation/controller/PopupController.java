package com.posadskiy.swingteacherdesktop.presentation.controller;

import com.posadskiy.swingteacherdesktop.infrastructure.i18n.I18nService;
import org.springframework.stereotype.Component;

import javax.swing.*;

/**
 * Controller for popup dialogs.
 */
@Component
public class PopupController {

    private final I18nService i18n;

    public PopupController(I18nService i18n) {
        this.i18n = i18n;
    }

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
        showMessage(message, i18n.getString("error.title"));
    }
    
    public void showSuccess(String message) {
        showMessage(message, i18n.getString("error.success"));
    }
}




