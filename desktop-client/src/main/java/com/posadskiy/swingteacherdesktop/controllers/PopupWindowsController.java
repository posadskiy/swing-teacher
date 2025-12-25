package com.posadskiy.swingteacherdesktop.controllers;

import com.posadskiy.swingteacherdesktop.views.PopupWindowsView;
import org.springframework.stereotype.Component;

import javax.swing.*;

@Component
public class PopupWindowsController {

    private final PopupWindowsView popupWindowsView;

    public PopupWindowsController(PopupWindowsView popupWindowsView) {
        this.popupWindowsView = popupWindowsView;
    }

    public void createPopupWindow(JFrame frame, String message, String title, int option) {
        popupWindowsView.createOptionPane(frame, message, title, option);
    }

    public void createPopupWindow(JFrame frame, String message, String title) {
        popupWindowsView.createOptionPane(frame, message, title);
    }

    public void createPopupWindow(String message, String title) {
        popupWindowsView.createOptionPane(message, title);
    }

}
