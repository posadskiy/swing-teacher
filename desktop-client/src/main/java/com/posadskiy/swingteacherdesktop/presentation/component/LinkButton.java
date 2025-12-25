package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

/**
 * Text-style link button with hover underline effect.
 */
public class LinkButton extends JButton {
    
    private boolean hovered = false;

    public LinkButton(String text) {
        super(text);
        setupStyle();
        setupListeners();
    }

    private void setupStyle() {
        setOpaque(false);
        setContentAreaFilled(false);
        setBorderPainted(false);
        setFocusPainted(false);
        setFont(UITheme.getFont(Font.PLAIN, 13));
        setForeground(UITheme.TEXT_SECONDARY);
        setCursor(new Cursor(Cursor.HAND_CURSOR));
        setHorizontalAlignment(SwingConstants.CENTER);
    }

    private void setupListeners() {
        addMouseListener(new MouseAdapter() {
            @Override
            public void mouseEntered(MouseEvent e) {
                hovered = true;
                setForeground(UITheme.PRIMARY_ACCENT);
                repaint();
            }

            @Override
            public void mouseExited(MouseEvent e) {
                hovered = false;
                setForeground(UITheme.TEXT_SECONDARY);
                repaint();
            }
        });
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        
        if (hovered) {
            Graphics2D g2d = (Graphics2D) g.create();
            g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2d.setColor(getForeground());
            FontMetrics fm = g2d.getFontMetrics(getFont());
            int textWidth = fm.stringWidth(getText());
            int x = (getWidth() - textWidth) / 2;
            int y = getHeight() - 4;
            g2d.drawLine(x, y, x + textWidth, y);
            g2d.dispose();
        }
    }
}


