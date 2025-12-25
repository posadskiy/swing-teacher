package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import java.awt.geom.RoundRectangle2D;

/**
 * Modern styled password field with rounded corners, focus highlight, and placeholder support.
 */
public class ModernPasswordField extends JPasswordField {
    
    private final String placeholder;
    private boolean focused = false;

    public ModernPasswordField(String placeholder) {
        this.placeholder = placeholder;
        setupStyle();
        setupListeners();
    }

    private void setupStyle() {
        setOpaque(false);
        setFont(UITheme.getFont(Font.PLAIN, 14));
        setForeground(UITheme.TEXT_PRIMARY);
        setCaretColor(UITheme.TEXT_PRIMARY);
        setBorder(new EmptyBorder(12, 14, 12, 14));
        setEchoChar('●');
    }

    private void setupListeners() {
        addFocusListener(new FocusAdapter() {
            @Override
            public void focusGained(FocusEvent e) {
                focused = true;
                repaint();
            }

            @Override
            public void focusLost(FocusEvent e) {
                focused = false;
                repaint();
            }
        });
    }

    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2d = (Graphics2D) g.create();
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        // Background
        g2d.setColor(UITheme.INPUT_BACKGROUND);
        g2d.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 12, 12));

        // Border
        g2d.setColor(focused ? UITheme.INPUT_FOCUS : UITheme.INPUT_BORDER);
        g2d.setStroke(new BasicStroke(focused ? 2f : 1f));
        g2d.draw(new RoundRectangle2D.Float(0.5f, 0.5f, getWidth() - 1, getHeight() - 1, 12, 12));

        g2d.dispose();
        super.paintComponent(g);

        // Placeholder
        if (getPassword().length == 0 && !focused) {
            drawPlaceholder(g);
        }
    }

    private void drawPlaceholder(Graphics g) {
        Graphics2D g2d = (Graphics2D) g.create();
        g2d.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
        g2d.setColor(UITheme.TEXT_PLACEHOLDER);
        g2d.setFont(getFont());
        FontMetrics fm = g2d.getFontMetrics();
        g2d.drawString(placeholder, 14, (getHeight() + fm.getAscent() - fm.getDescent()) / 2);
        g2d.dispose();
    }
}


