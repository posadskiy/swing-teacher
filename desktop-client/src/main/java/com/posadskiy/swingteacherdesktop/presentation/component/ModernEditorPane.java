package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.text.html.HTMLEditorKit;
import javax.swing.text.html.StyleSheet;
import java.awt.*;

/**
 * Modern styled editor pane for HTML content display.
 */
public class ModernEditorPane extends JEditorPane {

    public ModernEditorPane() {
        this("");
    }

    public ModernEditorPane(String text) {
        setupStyle();
        setText(text);
    }

    private void setupStyle() {
        setContentType("text/html");
        setEditable(false);
        setOpaque(false);
        setBackground(new Color(0, 0, 0, 0));
        setBorder(new EmptyBorder(8, 10, 8, 10));
        
        // Apply custom stylesheet for dark theme
        HTMLEditorKit kit = new HTMLEditorKit();
        StyleSheet styleSheet = kit.getStyleSheet();
        styleSheet.addRule("body { " +
            "font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Arial, sans-serif; " +
            "font-size: 12px; " +
            "color: #e2e8f0; " +
            "line-height: 1.5; " +
            "margin: 0; " +
            "padding: 0; " +
        "}");
        styleSheet.addRule("h1, h2, h3, h4 { color: #f8fafc; margin-top: 12px; margin-bottom: 6px; }");
        styleSheet.addRule("h1 { font-size: 20px; }");
        styleSheet.addRule("h2 { font-size: 16px; }");
        styleSheet.addRule("h3 { font-size: 14px; }");
        styleSheet.addRule("p { margin: 6px 0; }");
        styleSheet.addRule("code { " +
            "background-color: #334155; " +
            "padding: 2px 4px; " +
            "border-radius: 3px; " +
            "font-family: 'SF Mono', Consolas, monospace; " +
            "font-size: 11px; " +
        "}");
        styleSheet.addRule("pre { " +
            "background-color: #1e293b; " +
            "padding: 8px; " +
            "border-radius: 6px; " +
            "overflow-x: auto; " +
        "}");
        styleSheet.addRule("a { color: #818cf8; text-decoration: none; }");
        styleSheet.addRule("a:hover { text-decoration: underline; }");
        styleSheet.addRule("ul, ol { margin: 6px 0; padding-left: 20px; }");
        styleSheet.addRule("li { margin: 3px 0; }");
        styleSheet.addRule("hr { border: none; border-top: 1px solid #475569; margin: 12px 0; }");
        styleSheet.addRule("table { border-collapse: collapse; width: 100%; margin: 8px 0; }");
        styleSheet.addRule("th, td { border: 1px solid #475569; padding: 6px 10px; text-align: left; }");
        styleSheet.addRule("th { background-color: #334155; }");
        
        setEditorKit(kit);
    }
}

