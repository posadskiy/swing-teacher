package com.posadskiy.swingteacherdesktop.presentation.component;

import org.fife.ui.rtextarea.RTextScrollPane;

import javax.swing.*;
import java.awt.*;

/**
 * Code editor panel with line numbers and status bar.
 */
public class CodeEditorPanel extends JPanel {
    private final ModernTextArea textArea;
    private final RTextScrollPane scrollPane;
    private final StatusBar statusBar;

    public CodeEditorPanel() {
        this("");
    }

    public CodeEditorPanel(String text) {
        setLayout(new BorderLayout());
        setOpaque(false);

        textArea = new ModernTextArea(text);
        textArea.setCodeFoldingEnabled(true);
        
        // Create scroll pane with line numbers
        scrollPane = new RTextScrollPane(textArea);
        scrollPane.setLineNumbersEnabled(true);
        scrollPane.setFoldIndicatorEnabled(true);
        scrollPane.setViewportBorder(null);
        scrollPane.setBorder(null);
        scrollPane.setOpaque(false);
        scrollPane.getGutter().setBackground(new Color(30, 30, 46));
        scrollPane.getGutter().setBorderColor(UITheme.CARD_BORDER);
        scrollPane.getGutter().setLineNumberColor(UITheme.TEXT_SECONDARY);
        scrollPane.getGutter().setLineNumberFont(UITheme.getFont(Font.PLAIN, 11));
        
        statusBar = new StatusBar();
        textArea.setStatusBar(statusBar);
        
        add(scrollPane, BorderLayout.CENTER);
        add(statusBar, BorderLayout.SOUTH);
    }

    public ModernTextArea getTextArea() {
        return textArea;
    }

    public String getText() {
        return textArea.getText();
    }

    public void setText(String text) {
        textArea.setText(text);
    }
}

