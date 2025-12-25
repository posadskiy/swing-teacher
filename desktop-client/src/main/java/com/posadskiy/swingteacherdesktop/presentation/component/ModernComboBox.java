package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.plaf.basic.BasicComboBoxUI;
import javax.swing.plaf.basic.BasicComboPopup;
import javax.swing.plaf.basic.ComboPopup;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;

/**
 * Modern styled combo box with dark theme and rounded corners.
 */
public class ModernComboBox<E> extends JComboBox<E> {

    public ModernComboBox() {
        super();
        setupStyle();
    }

    public ModernComboBox(ComboBoxModel<E> model) {
        super(model);
        setupStyle();
    }

    private void setupStyle() {
        setFont(UITheme.getFont(Font.PLAIN, 14));
        setForeground(UITheme.TEXT_PRIMARY);
        setBackground(UITheme.INPUT_BACKGROUND);
        setBorder(new EmptyBorder(8, 12, 8, 12));
        setFocusable(true);
        
        setUI(new ModernComboBoxUI());
        setRenderer(new ModernListCellRenderer<>());
    }

    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2d = (Graphics2D) g.create();
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        // Background
        g2d.setColor(UITheme.INPUT_BACKGROUND);
        g2d.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 10, 10));

        // Border
        g2d.setColor(isFocusOwner() ? UITheme.INPUT_FOCUS : UITheme.INPUT_BORDER);
        g2d.setStroke(new BasicStroke(isFocusOwner() ? 2f : 1f));
        g2d.draw(new RoundRectangle2D.Float(0.5f, 0.5f, getWidth() - 1, getHeight() - 1, 10, 10));

        g2d.dispose();
        super.paintComponent(g);
    }

    @Override
    protected void paintBorder(Graphics g) {
        // Don't paint default border
    }

    private static class ModernComboBoxUI extends BasicComboBoxUI {
        @Override
        protected JButton createArrowButton() {
            JButton button = new JButton() {
                @Override
                public void paintComponent(Graphics g) {
                    Graphics2D g2d = (Graphics2D) g.create();
                    g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                    
                    int w = getWidth();
                    int h = getHeight();
                    int size = 8;
                    int x = (w - size) / 2;
                    int y = (h - size) / 2;
                    
                    g2d.setColor(UITheme.TEXT_SECONDARY);
                    int[] xPoints = {x, x + size, x + size / 2};
                    int[] yPoints = {y, y, y + size};
                    g2d.fillPolygon(xPoints, yPoints, 3);
                    
                    g2d.dispose();
                }
            };
            button.setBackground(UITheme.INPUT_BACKGROUND);
            button.setBorder(BorderFactory.createEmptyBorder());
            button.setFocusable(false);
            return button;
        }

        @Override
        protected ComboPopup createPopup() {
            return new ModernComboPopup(comboBox);
        }
    }

    private static class ModernComboPopup extends BasicComboPopup {
        @SuppressWarnings("unchecked")
        public ModernComboPopup(JComboBox combo) {
            super(combo);
            setBorder(BorderFactory.createLineBorder(UITheme.INPUT_BORDER, 1));
            setBackground(UITheme.INPUT_BACKGROUND);
        }

        @Override
        protected JScrollPane createScroller() {
            JScrollPane scroller = super.createScroller();
            scroller.getViewport().setBackground(UITheme.INPUT_BACKGROUND);
            scroller.setBorder(null);
            return scroller;
        }
    }

    private static class ModernListCellRenderer<E> extends DefaultListCellRenderer {
        @Override
        public Component getListCellRendererComponent(JList<?> list, Object value, int index, boolean isSelected, boolean cellHasFocus) {
            JLabel label = (JLabel) super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);
            
            label.setFont(UITheme.getFont(Font.PLAIN, 14));
            label.setBorder(new EmptyBorder(8, 12, 8, 12));
            
            if (isSelected) {
                label.setBackground(UITheme.PRIMARY_ACCENT);
                label.setForeground(UITheme.TEXT_PRIMARY);
            } else {
                label.setBackground(UITheme.INPUT_BACKGROUND);
                label.setForeground(UITheme.TEXT_PRIMARY);
            }
            
            return label;
        }
    }
}

