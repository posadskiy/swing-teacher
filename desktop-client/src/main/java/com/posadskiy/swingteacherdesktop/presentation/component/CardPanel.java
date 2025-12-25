package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;

/**
 * Glassmorphism-style card panel with rounded corners and subtle border.
 */
public class CardPanel extends JPanel {

    private final int cornerRadius;

    public CardPanel() {
        this(24);
    }

    public CardPanel(int cornerRadius) {
        this.cornerRadius = cornerRadius;
        setOpaque(false);
        setBorder(new EmptyBorder(40, 40, 40, 40));
    }

    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2d = (Graphics2D) g.create();
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        
        // Card background
        g2d.setColor(UITheme.CARD_BACKGROUND);
        g2d.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), cornerRadius, cornerRadius));
        
        // Subtle border
        g2d.setColor(UITheme.CARD_BORDER);
        g2d.setStroke(new BasicStroke(1f));
        g2d.draw(new RoundRectangle2D.Float(0.5f, 0.5f, getWidth() - 1, getHeight() - 1, cornerRadius, cornerRadius));
        
        g2d.dispose();
    }
}


