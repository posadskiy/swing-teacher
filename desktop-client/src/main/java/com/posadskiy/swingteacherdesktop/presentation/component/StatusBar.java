package com.posadskiy.swingteacherdesktop.presentation.component;

import com.posadskiy.swingteacherdesktop.infrastructure.i18n.I18nService;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;

/**
 * Status bar component showing line/column information and other editor stats.
 */
public class StatusBar extends JPanel {
    private final JLabel lineLabel;
    private final JLabel columnLabel;
    private final JLabel charLabel;
    private I18nService i18n;

    public StatusBar() {
        setLayout(new FlowLayout(FlowLayout.LEFT, 8, 4));
        setOpaque(false);
        setBorder(new EmptyBorder(4, 12, 4, 12));

        lineLabel = createLabel("Line: 1");
        columnLabel = createLabel("Column: 1");
        charLabel = createLabel("Chars: 0");

        add(lineLabel);
        add(createSeparator());
        add(columnLabel);
        add(createSeparator());
        add(charLabel);
    }

    public StatusBar(I18nService i18n) {
        this();
        this.i18n = i18n;
    }

    public void setI18n(I18nService i18n) {
        this.i18n = i18n;
    }

    private JLabel createLabel(String text) {
        JLabel label = new JLabel(text);
        label.setFont(UITheme.getFont(Font.PLAIN, 11));
        label.setForeground(UITheme.TEXT_SECONDARY);
        return label;
    }

    private JLabel createSeparator() {
        JLabel separator = new JLabel("|");
        separator.setFont(UITheme.getFont(Font.PLAIN, 11));
        separator.setForeground(UITheme.TEXT_PLACEHOLDER);
        separator.setBorder(new EmptyBorder(0, 4, 0, 4));
        return separator;
    }

    public void updateStatus(int line, int column, int charCount) {
        if (i18n != null) {
            lineLabel.setText(i18n.getString("status.line", line));
            columnLabel.setText(i18n.getString("status.column", column));
            charLabel.setText(i18n.getString("status.chars", charCount));
        } else {
            lineLabel.setText("Line: " + line);
            columnLabel.setText("Column: " + column);
            charLabel.setText("Chars: " + charCount);
        }
    }
}



