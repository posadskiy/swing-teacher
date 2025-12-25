package com.posadskiy.swingteacherdesktop.presentation.component;

import org.fife.ui.rsyntaxtextarea.RSyntaxTextArea;
import org.fife.ui.rsyntaxtextarea.SyntaxConstants;
import org.fife.ui.rsyntaxtextarea.Theme;

import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.io.IOException;

/**
 * Modern styled syntax text area for code editing with line numbers.
 */
public class ModernTextArea extends RSyntaxTextArea {
    private StatusBar statusBar;

    public ModernTextArea() {
        this("");
    }

    public ModernTextArea(String text) {
        super(text);
        setupStyle();
        setupCaretListener();
    }

    public void setStatusBar(StatusBar statusBar) {
        this.statusBar = statusBar;
    }

    private void setupStyle() {
        setSyntaxEditingStyle(SyntaxConstants.SYNTAX_STYLE_JAVA);
        setCodeFoldingEnabled(true);
        setAntiAliasingEnabled(true);

        // Enable line numbers
        setPaintMatchedBracketPair(true);
        setPaintTabLines(true);
        
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

    private void setupCaretListener() {
        addCaretListener(e -> {
            if (statusBar != null) {
                try {
                    int caretPosition = getCaretPosition();
                    int line = getLineOfOffset(caretPosition);
                    int column = caretPosition - getLineStartOffset(line) + 1;
                    int charCount = getText().length();
                    statusBar.updateStatus(line + 1, column, charCount);
                } catch (Exception ex) {
                    // Ignore errors
                }
            }
        });
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

