package com.posadskiy.swingteacherdesktop.presentation.component;

import com.posadskiy.swingteacherdesktop.infrastructure.i18n.I18nService;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;

/**
 * Difficulty badge component showing task difficulty level.
 */
public class DifficultyBadge extends JLabel {
    private final double difficulty;
    private I18nService i18n;

    public DifficultyBadge(double difficulty) {
        this.difficulty = difficulty;
        setOpaque(false);
        setBorder(new EmptyBorder(2, 8, 2, 8));
        setFont(UITheme.getFont(Font.BOLD, 10));
        updateText();
    }

    public DifficultyBadge(double difficulty, I18nService i18n) {
        this.difficulty = difficulty;
        this.i18n = i18n;
        setOpaque(false);
        setBorder(new EmptyBorder(2, 8, 2, 8));
        setFont(UITheme.getFont(Font.BOLD, 10));
        updateText();
    }

    public void setI18n(I18nService i18n) {
        this.i18n = i18n;
        updateText();
    }

    private void updateText() {
        String text;
        if (difficulty < 15) {
            text = i18n != null ? i18n.getString("difficulty.easy") : "● Easy";
            setForeground(new Color(74, 222, 128)); // Green
        } else if (difficulty < 25) {
            text = i18n != null ? i18n.getString("difficulty.medium") : "● Medium";
            setForeground(new Color(251, 191, 36)); // Yellow
        } else {
            text = i18n != null ? i18n.getString("difficulty.hard") : "● Hard";
            setForeground(new Color(239, 68, 68)); // Red
        }
        setText(text);
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



