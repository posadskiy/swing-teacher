package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import java.awt.*;

/**
 * Visual divider component for separating sections.
 */
public class Divider extends JComponent {
    private final boolean isVertical;

    public Divider(boolean isVertical) {
        this.isVertical = isVertical;
        setOpaque(false);
        if (isVertical) {
            setPreferredSize(new Dimension(1, 0));
        } else {
            setPreferredSize(new Dimension(0, 1));
        }
    }

    public Divider() {
        this(false);
    }

    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2d = (Graphics2D) g.create();
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        
        g2d.setColor(UITheme.CARD_BORDER);
        g2d.setStroke(new BasicStroke(1f));
        
        if (isVertical) {
            g2d.drawLine(getWidth() / 2, 0, getWidth() / 2, getHeight());
        } else {
            g2d.drawLine(0, getHeight() / 2, getWidth(), getHeight() / 2);
        }
        
        g2d.dispose();
    }
}

