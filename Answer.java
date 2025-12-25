package com.posadskiy.swingteacherdesktop.presentation.component;
import javax.swing.*;
import java.awt.*;

public class Answer extends CreateFrame {
    public Answer() {
        createFrame();
    }

    @Override
    public void createFrame() {
        setTitle("Your frame");
        JButton button = new JButton();
add(button);
        setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
        setPreferredSize(new Dimension(700, 400));
        pack();
        setLocationRelativeTo(null);
        setVisible(true);
    }
}
