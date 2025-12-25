package com.posadskiy.swingteacherdesktop.views;

import org.springframework.stereotype.Component;

import javax.swing.*;

@Component
public class PopupWindowsView {

    public void createOptionPane(JFrame frame, String message, String title, int option) {
        JOptionPane.showMessageDialog(frame, message, title, option);
    }

    public void createOptionPane(JFrame frame, String message, String title) {
        JOptionPane.showMessageDialog(frame, message, title, JOptionPane.DEFAULT_OPTION);
    }

    public void createOptionPane(String message, String title) {
        JOptionPane.showMessageDialog(new JFrame(), message, title, JOptionPane.DEFAULT_OPTION);
    }

}
