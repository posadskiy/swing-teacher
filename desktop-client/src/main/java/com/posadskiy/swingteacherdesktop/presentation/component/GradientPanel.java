package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import java.awt.*;

/**
 * Panel with gradient background and decorative blob effects.
 */
public class GradientPanel extends JPanel {

    public GradientPanel() {
        setLayout(new GridBagLayout());
    }

    public GradientPanel(LayoutManager layout) {
        setLayout(layout);
    }

    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2d = (Graphics2D) g.create();
        g2d.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        
        // Gradient background
        GradientPaint gradient = new GradientPaint(
            0, 0, UITheme.BACKGROUND_START,
            getWidth(), getHeight(), UITheme.BACKGROUND_END
        );
        g2d.setPaint(gradient);
        g2d.fillRect(0, 0, getWidth(), getHeight());
        
        // Decorative blobs
        drawDecorations(g2d);
        
        g2d.dispose();
    }

    private void drawDecorations(Graphics2D g2d) {
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        
        // Top-left indigo blob
        g2d.setColor(new Color(99, 102, 241, 30));
        g2d.fillOval(-100, -100, 400, 400);
        
        // Bottom-right purple blob
        g2d.setColor(new Color(168, 85, 247, 20));
        g2d.fillOval(getWidth() - 200, getHeight() - 300, 350, 350);
        
        // Top-center pink blob
        g2d.setColor(new Color(236, 72, 153, 15));
        g2d.fillOval(getWidth() / 2 - 150, -150, 300, 300);
    }
}


