package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import java.awt.*;
import java.awt.datatransfer.StringSelection;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.geom.RoundRectangle2D;

/**
 * Small copy button for code snippets.
 */
public class CopyButton extends JComponent {
    private boolean hovered = false;
    private final String textToCopy;

    public CopyButton(String textToCopy) {
        this.textToCopy = textToCopy;
        setPreferredSize(new Dimension(24, 24));
        setCursor(new Cursor(Cursor.HAND_CURSOR));
        setToolTipText("Copy code");

        addMouseListener(new MouseAdapter() {
            @Override
            public void mouseEntered(MouseEvent e) {
                hovered = true;
                repaint();
            }

            @Override
            public void mouseExited(MouseEvent e) {
                hovered = false;
                repaint();
            }

            @Override
            public void mouseClicked(MouseEvent e) {
                copyToClipboard();
            }
        });
    }

    private void copyToClipboard() {
        Toolkit.getDefaultToolkit().getSystemClipboard().setContents(
            new StringSelection(textToCopy), null
        );
        
        // Show brief feedback
        JToolTip tooltip = createToolTip();
        tooltip.setTipText("Copied!");
        tooltip.setVisible(true);
        
        Timer timer = new Timer(1000, e -> {
            tooltip.setVisible(false);
        });
        timer.setRepeats(false);
        timer.start();
    }

    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2d = (Graphics2D) g.create();
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        Color bgColor = hovered ? UITheme.PRIMARY_HOVER : UITheme.INPUT_BACKGROUND;
        g2d.setColor(bgColor);
        g2d.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 4, 4));

        // Draw copy icon (simplified)
        g2d.setColor(UITheme.TEXT_PRIMARY);
        g2d.setStroke(new BasicStroke(1.5f));
        int centerX = getWidth() / 2;
        int centerY = getHeight() / 2;
        
        // Draw two overlapping rectangles
        g2d.drawRect(centerX - 6, centerY - 5, 5, 5);
        g2d.drawRect(centerX - 2, centerY - 1, 5, 5);

        g2d.dispose();
    }
}

