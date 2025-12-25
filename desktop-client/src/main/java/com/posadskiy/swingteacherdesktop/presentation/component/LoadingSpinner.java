package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import java.awt.*;
import java.awt.geom.Arc2D;

/**
 * Simple loading spinner component.
 */
public class LoadingSpinner extends JComponent {
    private double angle = 0;
    private Timer timer;

    public LoadingSpinner() {
        setPreferredSize(new Dimension(16, 16));
        setOpaque(false);
        startAnimation();
    }

    private void startAnimation() {
        timer = new Timer(16, e -> {
            angle += 10;
            if (angle >= 360) {
                angle = 0;
            }
            repaint();
        });
        timer.start();
    }

    public void stop() {
        if (timer != null) {
            timer.stop();
        }
    }

    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2d = (Graphics2D) g.create();
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        int size = Math.min(getWidth(), getHeight());
        int x = (getWidth() - size) / 2;
        int y = (getHeight() - size) / 2;

        g2d.setColor(UITheme.PRIMARY_ACCENT);
        g2d.setStroke(new BasicStroke(2f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
        
        Arc2D.Float arc = new Arc2D.Float(x, y, size, size, (float)angle, 270f, Arc2D.OPEN);
        g2d.draw(arc);

        g2d.dispose();
    }
}

