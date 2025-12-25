package com.posadskiy.swingteacherdesktop.utils;

import javax.swing.*;
import java.awt.Dimension;

public class Answer extends CreateFrame {
    public Answer() {
        setTitle("Your frame");

        setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
        setPreferredSize(new Dimension(700, 400));
        pack();
        setLocationRelativeTo(null);
        setVisible(true);
    }
}
