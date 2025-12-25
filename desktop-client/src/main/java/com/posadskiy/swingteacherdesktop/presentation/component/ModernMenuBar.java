package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;

/**
 * Modern styled menu bar with dark theme.
 */
public class ModernMenuBar extends JMenuBar {

    public ModernMenuBar() {
        setupStyle();
    }

    private void setupStyle() {
        setBackground(UITheme.BACKGROUND_START);
        setBorder(new EmptyBorder(6, 12, 6, 12));
        setOpaque(true);
        setPreferredSize(new Dimension(0, 36));
    }

    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2d = (Graphics2D) g.create();
        g2d.setColor(new Color(20, 27, 45)); // Slightly lighter than background
        g2d.fillRect(0, 0, getWidth(), getHeight());
        // Bottom border
        g2d.setColor(UITheme.CARD_BORDER);
        g2d.drawLine(0, getHeight() - 1, getWidth(), getHeight() - 1);
        g2d.dispose();
    }

    /**
     * Creates a styled menu.
     */
    public static JMenu createMenu(String text) {
        JMenu menu = new JMenu(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2d = (Graphics2D) g.create();
                g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2d.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
                
                if (isSelected() || getModel().isArmed()) {
                    g2d.setColor(UITheme.PRIMARY_ACCENT);
                    g2d.fillRoundRect(0, 0, getWidth(), getHeight(), 6, 6);
                }
                
                // Draw text manually to ensure visibility
                g2d.setColor(UITheme.TEXT_PRIMARY);
                g2d.setFont(getFont());
                FontMetrics fm = g2d.getFontMetrics();
                int x = (getWidth() - fm.stringWidth(getText())) / 2;
                int y = (getHeight() + fm.getAscent() - fm.getDescent()) / 2;
                g2d.drawString(getText(), x, y);
                
                g2d.dispose();
            }
        };
        menu.setFont(UITheme.getFont(Font.PLAIN, 13));
        menu.setForeground(UITheme.TEXT_PRIMARY);
        menu.setOpaque(false);
        menu.setBorder(new EmptyBorder(6, 12, 6, 12));
        
        // Style the popup menu
        menu.getPopupMenu().setBackground(UITheme.CARD_BACKGROUND);
        menu.getPopupMenu().setBorder(BorderFactory.createLineBorder(UITheme.CARD_BORDER, 1));
        
        return menu;
    }

    /**
     * Creates a styled menu item.
     */
    public static JMenuItem createMenuItem(String text) {
        JMenuItem item = new JMenuItem(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2d = (Graphics2D) g.create();
                g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2d.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
                
                if (getModel().isArmed()) {
                    g2d.setColor(UITheme.PRIMARY_ACCENT);
                    g2d.fillRect(0, 0, getWidth(), getHeight());
                } else {
                    g2d.setColor(UITheme.CARD_BACKGROUND);
                    g2d.fillRect(0, 0, getWidth(), getHeight());
                }
                
                // Draw text manually
                g2d.setColor(UITheme.TEXT_PRIMARY);
                g2d.setFont(getFont());
                FontMetrics fm = g2d.getFontMetrics();
                int y = (getHeight() + fm.getAscent() - fm.getDescent()) / 2;
                g2d.drawString(getText(), 16, y);
                
                g2d.dispose();
            }
        };
        item.setFont(UITheme.getFont(Font.PLAIN, 13));
        item.setForeground(UITheme.TEXT_PRIMARY);
        item.setBackground(UITheme.CARD_BACKGROUND);
        item.setOpaque(false);
        item.setBorder(new EmptyBorder(8, 16, 8, 16));
        
        return item;
    }

    /**
     * Creates a styled separator.
     */
    public static JSeparator createSeparator() {
        JSeparator separator = new JSeparator() {
            @Override
            protected void paintComponent(Graphics g) {
                g.setColor(UITheme.CARD_BORDER);
                g.fillRect(8, getHeight() / 2, getWidth() - 16, 1);
            }
        };
        separator.setPreferredSize(new Dimension(0, 8));
        return separator;
    }
}

