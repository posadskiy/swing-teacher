package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;

/**
 * Difficulty badge component showing task difficulty level.
 */
public class DifficultyBadge extends JLabel {
    private final double difficulty;

    public DifficultyBadge(double difficulty) {
        this.difficulty = difficulty;
        setOpaque(false);
        setBorder(new EmptyBorder(2, 8, 2, 8));
        setFont(UITheme.getFont(Font.BOLD, 10));
        updateText();
    }

    private void updateText() {
        if (difficulty < 15) {
            setText("● Easy");
            setForeground(new Color(74, 222, 128)); // Green
        } else if (difficulty < 25) {
            setText("● Medium");
            setForeground(new Color(251, 191, 36)); // Yellow
        } else {
            setText("● Hard");
            setForeground(new Color(239, 68, 68)); // Red
        }
    }

    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2d = (Graphics2D) g.create();
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        // Semi-transparent background
        Color bgColor = new Color(getForeground().getRed(), getForeground().getGreen(), getForeground().getBlue(), 20);
        g2d.setColor(bgColor);
        g2d.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 4, 4));

        g2d.dispose();
        super.paintComponent(g);
    }
}

