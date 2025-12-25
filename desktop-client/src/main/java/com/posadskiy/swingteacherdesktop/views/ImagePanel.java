package com.posadskiy.swingteacherdesktop.views;

import javax.swing.*;
import java.awt.*;

/**
 *
 * @author DPosadsky
 */
public class ImagePanel extends JPanel {

    private Image image;

    public ImagePanel() {
    }

    public ImagePanel(Image image) {
        this.image = image;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        if (image != null) {
            g.drawImage(image, 0, 0, getWidth(), getHeight(), null);
        }
    }
}
