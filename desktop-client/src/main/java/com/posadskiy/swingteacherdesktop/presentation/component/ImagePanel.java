package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import java.awt.*;

/**
 * Panel that displays a background image.
 */
public class ImagePanel extends JPanel {
    
    private Image image;
    
    public ImagePanel() {
        super();
    }
    
    public void setImage(Image image) {
        this.image = image;
        repaint();
    }
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        if (image != null) {
            g.drawImage(image, 0, 0, getWidth(), getHeight(), this);
        }
    }
}

