package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.geom.RoundRectangle2D;

/**
 * Modern styled button with hover animation and primary/secondary variants.
 */
public class ModernButton extends JButton {
    
    private final boolean isPrimary;
    private boolean hovered = false;
    private float animationProgress = 0f;
    private Timer animationTimer;

    public ModernButton(String text, boolean isPrimary) {
        super(text);
        this.isPrimary = isPrimary;
        setupStyle();
        setupListeners();
    }

    public static ModernButton primary(String text) {
        return new ModernButton(text, true);
    }

    public static ModernButton secondary(String text) {
        return new ModernButton(text, false);
    }

    private void setupStyle() {
        setOpaque(false);
        setContentAreaFilled(false);
        setBorderPainted(false);
        setFocusPainted(false);
        setFont(UITheme.getFont(Font.BOLD, 14));
        setForeground(UITheme.TEXT_PRIMARY);
        setCursor(new Cursor(Cursor.HAND_CURSOR));
    }

    private void setupListeners() {
        addMouseListener(new MouseAdapter() {
            @Override
            public void mouseEntered(MouseEvent e) {
                if (isEnabled()) {
                    hovered = true;
                    animateHover(true);
                }
            }

            @Override
            public void mouseExited(MouseEvent e) {
                hovered = false;
                animateHover(false);
            }

            @Override
            public void mousePressed(MouseEvent e) {
                if (isEnabled()) {
                    animationProgress = 0.3f;
                    repaint();
                }
            }

            @Override
            public void mouseReleased(MouseEvent e) {
                animationProgress = hovered ? 1f : 0f;
                repaint();
            }
        });
    }

    private void animateHover(boolean entering) {
        if (animationTimer != null) {
            animationTimer.stop();
        }
        
        animationTimer = new Timer(16, e -> {
            if (entering) {
                animationProgress = Math.min(1f, animationProgress + 0.15f);
            } else {
                animationProgress = Math.max(0f, animationProgress - 0.15f);
            }
            repaint();
            
            if ((entering && animationProgress >= 1f) || (!entering && animationProgress <= 0f)) {
                ((Timer) e.getSource()).stop();
            }
        });
        animationTimer.start();
    }

    private LoadingSpinner loadingSpinner;
    private String originalText;

    public void setLoading(boolean loading) {
        if (loading) {
            originalText = getText();
            setText("");
            setEnabled(false);
            if (loadingSpinner == null) {
                loadingSpinner = new LoadingSpinner();
            }
            add(loadingSpinner);
            loadingSpinner.setBounds((getWidth() - 16) / 2, (getHeight() - 16) / 2, 16, 16);
        } else {
            setEnabled(true);
            if (loadingSpinner != null) {
                remove(loadingSpinner);
                loadingSpinner.stop();
                loadingSpinner = null;
            }
            if (originalText != null) {
                setText(originalText);
                originalText = null;
            }
        }
        repaint();
    }

    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2d = (Graphics2D) g.create();
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        Color baseColor = isPrimary ? UITheme.PRIMARY_ACCENT : UITheme.SECONDARY_BUTTON;
        Color hoverColor = isPrimary ? UITheme.PRIMARY_HOVER : UITheme.SECONDARY_HOVER;
        
        // Interpolate colors for smooth animation
        Color currentColor = UITheme.interpolate(baseColor, hoverColor, animationProgress);

        // Dim if disabled
        if (!isEnabled()) {
            currentColor = new Color(
                currentColor.getRed(), 
                currentColor.getGreen(), 
                currentColor.getBlue(), 
                128
            );
        }

        // Draw button background
        g2d.setColor(currentColor);
        g2d.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 12, 12));

        // Draw text only if not loading
        if (loadingSpinner == null && getText() != null && !getText().isEmpty()) {
            g2d.setColor(isEnabled() ? UITheme.TEXT_PRIMARY : UITheme.TEXT_SECONDARY);
            g2d.setFont(getFont());
            FontMetrics fm = g2d.getFontMetrics();
            int x = (getWidth() - fm.stringWidth(getText())) / 2;
            int y = (getHeight() + fm.getAscent() - fm.getDescent()) / 2;
            g2d.drawString(getText(), x, y);
        }

        g2d.dispose();
    }
}


