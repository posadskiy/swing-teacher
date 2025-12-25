package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;

/**
 * Section title with icon support.
 */
public class SectionTitle extends JPanel {
    private final JLabel iconLabel;
    private final JLabel textLabel;

    public SectionTitle(String text, String icon) {
        setLayout(new FlowLayout(FlowLayout.LEFT, 8, 0));
        setOpaque(false);
        setBorder(new EmptyBorder(4, 0, 12, 0));

        iconLabel = new JLabel(icon);
        iconLabel.setFont(UITheme.getFont(Font.PLAIN, 18));
        iconLabel.setForeground(UITheme.TEXT_PRIMARY);
        iconLabel.setBorder(new EmptyBorder(0, 0, 0, 4));

        textLabel = new JLabel(text);
        textLabel.setFont(UITheme.getFont(Font.BOLD, 18));
        textLabel.setForeground(UITheme.TEXT_PRIMARY);

        add(iconLabel);
        add(textLabel);
    }

    public SectionTitle(String text) {
        this(text, "");
    }

    public void setIcon(String icon) {
        iconLabel.setText(icon);
        iconLabel.setVisible(icon != null && !icon.isEmpty());
    }
}

