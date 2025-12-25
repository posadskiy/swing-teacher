package com.posadskiy.swingteacherdesktop.presentation.component;

import org.fife.ui.rsyntaxtextarea.RSyntaxTextArea;
import org.fife.ui.rsyntaxtextarea.SyntaxConstants;
import org.fife.ui.rsyntaxtextarea.Theme;

import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.io.IOException;

/**
 * Modern styled syntax text area for code editing.
 */
public class ModernTextArea extends RSyntaxTextArea {

    public ModernTextArea() {
        this("");
    }

    public ModernTextArea(String text) {
        super(text);
        setupStyle();
    }

    private void setupStyle() {
        setSyntaxEditingStyle(SyntaxConstants.SYNTAX_STYLE_JAVA);
        setCodeFoldingEnabled(true);
        setAntiAliasingEnabled(true);
        
        // Apply dark theme
        applyDarkTheme();
        
        // Custom colors
        setBackground(new Color(30, 30, 46));
        setForeground(UITheme.TEXT_PRIMARY);
        setCaretColor(UITheme.TEXT_PRIMARY);
        setSelectionColor(new Color(99, 102, 241, 80));
        setCurrentLineHighlightColor(new Color(45, 45, 60));
        
        setFont(new Font(Font.MONOSPACED, Font.PLAIN, 12));
        setBorder(new EmptyBorder(8, 10, 8, 10));
        setTabSize(4);
    }

    private void applyDarkTheme() {
        try {
            var themeStream = getClass().getResourceAsStream("/org/fife/ui/rsyntaxtextarea/themes/dark.xml");
            if (themeStream != null) {
                Theme theme = Theme.load(themeStream);
                theme.apply(this);
            }
        } catch (IOException e) {
            // Use default styling if theme not available
        }
    }
}

