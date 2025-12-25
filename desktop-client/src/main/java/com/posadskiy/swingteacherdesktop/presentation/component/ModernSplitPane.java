package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import javax.swing.plaf.basic.BasicSplitPaneDivider;
import javax.swing.plaf.basic.BasicSplitPaneUI;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;

/**
 * Modern styled split pane with subtle divider.
 */
public class ModernSplitPane extends JSplitPane {

    public ModernSplitPane(int orientation, Component left, Component right) {
        super(orientation, left, right);
        setupStyle();
    }

    private void setupStyle() {
        setOpaque(false);
        setBorder(null);
        setDividerSize(12);
        setContinuousLayout(true);
        
        setUI(new ModernSplitPaneUI());
    }

    private static class ModernSplitPaneUI extends BasicSplitPaneUI {
        @Override
        public BasicSplitPaneDivider createDefaultDivider() {
            return new ModernDivider(this);
        }
    }

    private static class ModernDivider extends BasicSplitPaneDivider {
        
        public ModernDivider(BasicSplitPaneUI ui) {
            super(ui);
            setBackground(new Color(0, 0, 0, 0));
            setBorder(null);
        }

        @Override
        public void paint(Graphics g) {
            Graphics2D g2d = (Graphics2D) g.create();
            g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            
            int orientation = splitPane.getOrientation();
            
            // Draw subtle handle in center
            g2d.setColor(UITheme.INPUT_BORDER);
            
            if (orientation == JSplitPane.HORIZONTAL_SPLIT) {
                // Vertical divider (for horizontal split)
                int x = (getWidth() - 4) / 2;
                int handleHeight = Math.min(40, getHeight() / 3);
                int y = (getHeight() - handleHeight) / 2;
                g2d.fill(new RoundRectangle2D.Float(x, y, 4, handleHeight, 4, 4));
            } else {
                // Horizontal divider (for vertical split)
                int y = (getHeight() - 4) / 2;
                int handleWidth = Math.min(40, getWidth() / 3);
                int x = (getWidth() - handleWidth) / 2;
                g2d.fill(new RoundRectangle2D.Float(x, y, handleWidth, 4, 4, 4));
            }
            
            g2d.dispose();
        }

        @Override
        protected JButton createLeftOneTouchButton() {
            return createEmptyButton();
        }

        @Override
        protected JButton createRightOneTouchButton() {
            return createEmptyButton();
        }

        private JButton createEmptyButton() {
            JButton button = new JButton();
            button.setMinimumSize(new Dimension(0, 0));
            button.setPreferredSize(new Dimension(0, 0));
            button.setMaximumSize(new Dimension(0, 0));
            button.setFocusable(false);
            return button;
        }
    }
}

