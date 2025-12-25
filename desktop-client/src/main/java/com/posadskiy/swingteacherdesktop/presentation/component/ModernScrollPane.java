package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.plaf.basic.BasicScrollBarUI;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;

/**
 * Modern styled scroll pane with dark theme and custom scrollbars.
 */
public class ModernScrollPane extends JScrollPane {

    private String title;

    public ModernScrollPane(Component view) {
        super(view);
        setupStyle();
    }

    public ModernScrollPane(Component view, String title) {
        super(view);
        this.title = title;
        setupStyle();
    }

    private void setupStyle() {
        setOpaque(false);
        getViewport().setOpaque(false);
        setBorder(new EmptyBorder(0, 0, 0, 0));
        
        // Custom scrollbars
        getVerticalScrollBar().setUI(new ModernScrollBarUI());
        getHorizontalScrollBar().setUI(new ModernScrollBarUI());
        getVerticalScrollBar().setOpaque(false);
        getHorizontalScrollBar().setOpaque(false);
    }

    public void setTitle(String title) {
        this.title = title;
        repaint();
    }

    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2d = (Graphics2D) g.create();
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        // Background
        g2d.setColor(UITheme.CARD_BACKGROUND);
        g2d.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 12, 12));

        // Border
        g2d.setColor(UITheme.CARD_BORDER);
        g2d.setStroke(new BasicStroke(1f));
        g2d.draw(new RoundRectangle2D.Float(0.5f, 0.5f, getWidth() - 1, getHeight() - 1, 12, 12));

        g2d.dispose();
        super.paintComponent(g);
    }

    @Override
    protected void paintBorder(Graphics g) {
        if (title != null && !title.isEmpty()) {
            Graphics2D g2d = (Graphics2D) g.create();
            g2d.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
            
            g2d.setFont(UITheme.getFont(Font.BOLD, 12));
            g2d.setColor(UITheme.TEXT_SECONDARY);
            
            FontMetrics fm = g2d.getFontMetrics();
            int textWidth = fm.stringWidth(title);
            
            // Background for title
            g2d.setColor(UITheme.CARD_BACKGROUND);
            g2d.fillRect(12, 0, textWidth + 8, fm.getHeight());
            
            // Title text
            g2d.setColor(UITheme.TEXT_SECONDARY);
            g2d.drawString(title, 16, fm.getAscent() - 2);
            
            g2d.dispose();
        }
    }

    private static class ModernScrollBarUI extends BasicScrollBarUI {
        @Override
        protected void configureScrollBarColors() {
            thumbColor = UITheme.INPUT_BORDER;
            trackColor = UITheme.CARD_BACKGROUND;
        }

        @Override
        protected JButton createDecreaseButton(int orientation) {
            return createEmptyButton();
        }

        @Override
        protected JButton createIncreaseButton(int orientation) {
            return createEmptyButton();
        }

        private JButton createEmptyButton() {
            JButton button = new JButton();
            button.setPreferredSize(new Dimension(0, 0));
            button.setMinimumSize(new Dimension(0, 0));
            button.setMaximumSize(new Dimension(0, 0));
            return button;
        }

        @Override
        protected void paintThumb(Graphics g, JComponent c, Rectangle thumbBounds) {
            if (thumbBounds.isEmpty() || !scrollbar.isEnabled()) {
                return;
            }

            Graphics2D g2d = (Graphics2D) g.create();
            g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            
            g2d.setColor(isDragging ? UITheme.TEXT_SECONDARY : UITheme.INPUT_BORDER);
            g2d.fill(new RoundRectangle2D.Float(
                thumbBounds.x + 2, thumbBounds.y + 2,
                thumbBounds.width - 4, thumbBounds.height - 4,
                6, 6
            ));
            
            g2d.dispose();
        }

        @Override
        protected void paintTrack(Graphics g, JComponent c, Rectangle trackBounds) {
            // Don't paint track - transparent
        }
    }
}


