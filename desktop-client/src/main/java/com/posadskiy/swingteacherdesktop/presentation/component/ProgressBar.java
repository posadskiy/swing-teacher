package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;

/**
 * Modern progress bar component.
 */
public class ProgressBar extends JComponent {
    private int progress = 0; // 0-100
    private final Color progressColor;
    private final Color backgroundColor;

    public ProgressBar() {
        this(UITheme.PRIMARY_ACCENT, UITheme.INPUT_BACKGROUND);
    }

    public ProgressBar(Color progressColor, Color backgroundColor) {
        this.progressColor = progressColor;
        this.backgroundColor = backgroundColor;
        setPreferredSize(new Dimension(0, 6));
        setOpaque(false);
    }

    public void setProgress(int progress) {
        this.progress = Math.max(0, Math.min(100, progress));
        repaint();
    }

    public int getProgress() {
        return progress;
    }

    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2d = (Graphics2D) g.create();
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        // Background
        g2d.setColor(backgroundColor);
        g2d.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 3, 3));

        // Progress
        if (progress > 0) {
            g2d.setColor(progressColor);
            int progressWidth = (int) (getWidth() * progress / 100.0);
            g2d.fill(new RoundRectangle2D.Float(0, 0, progressWidth, getHeight(), 3, 3));
        }

        g2d.dispose();
    }
}

