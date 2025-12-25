package com.posadskiy.swingteacherdesktop.views;

import com.posadskiy.swingteacherdesktop.controllers.AuthPaneController;
import com.posadskiy.swingteacherdesktop.navigation.AppNavigator;
import lombok.extern.slf4j.Slf4j;
import net.miginfocom.swing.MigLayout;
import org.springframework.stereotype.Component;

import javax.imageio.ImageIO;
import javax.swing.*;
import javax.swing.border.LineBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.io.IOException;

@Slf4j
@Component
public class AuthPane extends JFrame {

    private final AuthPaneController controller;
    private final AppNavigator navigator;

    ImagePanel imgPanel;

    JLabel auth;
    JLabel loginLabel;
    JLabel passLabel;
    JLabel errorLabel;

    JTextField loginField;
    JPasswordField passField;

    JButton ok;
    JButton registration;
    JButton rememberPass;

    MigLayout layout;


    public AuthPane(AuthPaneController controller, AppNavigator navigator) {
        this.controller = controller;
        this.navigator = navigator;
        initComponent();
    }

    private void initComponent() {
        imgPanel = getImage();
        imgPanel.setPreferredSize(new Dimension(800, 450));

        layout = new MigLayout("wrap 4", "grow, fill");

        imgPanel.setLayout(layout);

        setResizable(false);

        add(imgPanel);

        layout = new MigLayout("wrap 4", "grow, fill");
        setLayout(layout);

        loginLabel = new JLabel("Login", SwingConstants.CENTER);
        loginLabel.setFont(new Font("Verdana", Font.BOLD, 20));
        loginLabel.setForeground(Color.WHITE);
        passLabel = new JLabel("Password", SwingConstants.CENTER);
        passLabel.setFont(new Font("Verdana", Font.BOLD, 20));
        passLabel.setForeground(Color.WHITE);
        errorLabel = new JLabel("User does not exist. Please check your credentials.",
            SwingConstants.CENTER);
        errorLabel.setFont(new Font("Verdana", Font.PLAIN, 15));
        errorLabel.setForeground(Color.red);
        errorLabel.setBorder(BorderFactory.createCompoundBorder(
            new LineBorder(Color.RED, 1, true),
            BorderFactory.createEmptyBorder(0, 0, 0, 0)));
        errorLabel.setVisible(false);

        loginField = new JTextField();
        loginField.setMinimumSize(new Dimension(100, 40));
        loginField.setFont(new Font("Verdana", Font.PLAIN, 20));
        passField = new JPasswordField();
        passField.setMinimumSize(new Dimension(100, 40));
        passField.setFont(new Font("Verdana", Font.PLAIN, 20));

        ok = new JButton("Login");
        ok.addActionListener(this::clickOkButton);

        registration = new JButton("Register");
        registration.addActionListener(this::clickRegistrationButton);

        rememberPass = new JButton("Forgot password?");
        rememberPass.addActionListener(this::clickRememberPassButton);

        imgPanel.add(loginLabel, "w 25%, gap 0px 0px 300px 0px");
        imgPanel.add(loginField, "w 25%");
        imgPanel.add(passLabel, "w 25%");
        imgPanel.add(passField, "w 25%");

        imgPanel.add(errorLabel, "span 4");

        imgPanel.add(registration, "gap 0px 0px 10px 0px");
        imgPanel.add(rememberPass);

        imgPanel.add(ok, "span 2");

        doSetupFrame();
    }

    public void doSetupFrame() {
        setTitle("Authorization");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(800, 450);
        //pack();
        setLocationRelativeTo(null);
        setVisible(true);
    }

    public ImagePanel getImage() {
        ImagePanel img = new ImagePanel();
        img.setLayout(new BorderLayout());
        try {
            // Load from classpath so it works from a packaged jar (resources include `/res/**` via pom.xml).
            var url = AuthPane.class.getResource("/res/img/login.png");
            if (url != null) {
                img.setImage(ImageIO.read(url));
            } else {
                log.warn("Resource not found: /img/login.png");
            }
        } catch (IOException e) {
            log.error("Failed to load login image", e);
        }
        return img;
    }

    public JLabel getErrorLabel() {
        return errorLabel;
    }

    public void clickRegistrationButton(ActionEvent ae) {
        navigator.showRegistration();
    }

    public void clickRememberPassButton(ActionEvent ae) {

    }

    public void clickOkButton(ActionEvent ae) {
        boolean ok = controller.authenticate(loginField.getText(), String.copyValueOf(passField.getPassword()));
        if (ok) {
            errorLabel.setVisible(false);
            setVisible(false);
            navigator.showMainFrame();
        } else {
            errorLabel.setVisible(true);
        }
    }
}
