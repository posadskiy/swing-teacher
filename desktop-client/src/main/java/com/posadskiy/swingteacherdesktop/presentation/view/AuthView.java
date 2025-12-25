package com.posadskiy.swingteacherdesktop.presentation.view;

import com.posadskiy.swingteacherdesktop.presentation.component.ImagePanel;
import com.posadskiy.swingteacherdesktop.presentation.controller.AuthController;
import com.posadskiy.swingteacherdesktop.presentation.navigation.AppNavigator;
import lombok.extern.slf4j.Slf4j;
import net.miginfocom.swing.MigLayout;
import org.springframework.stereotype.Component;

import javax.imageio.ImageIO;
import javax.swing.*;
import javax.swing.border.LineBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.io.IOException;

/**
 * Authentication view for user login.
 */
@Slf4j
@Component
public class AuthView extends JFrame {

    private final AuthController controller;
    private final AppNavigator navigator;

    private ImagePanel imgPanel;
    private JLabel loginLabel;
    private JLabel passLabel;
    private JLabel errorLabel;
    private JTextField loginField;
    private JPasswordField passField;
    private JButton okButton;
    private JButton registrationButton;
    private JButton rememberPassButton;

    public AuthView(AuthController controller, AppNavigator navigator) {
        this.controller = controller;
        this.navigator = navigator;
        initComponent();
    }

    private void initComponent() {
        imgPanel = createBackgroundPanel();
        imgPanel.setPreferredSize(new Dimension(800, 450));
        imgPanel.setLayout(new MigLayout("wrap 4", "grow, fill"));

        setResizable(false);
        add(imgPanel);
        setLayout(new MigLayout("wrap 4", "grow, fill"));

        // Create components
        loginLabel = createLabel("Login");
        passLabel = createLabel("Password");
        errorLabel = createErrorLabel();

        loginField = createTextField();
        passField = createPasswordField();

        okButton = new JButton("Login");
        okButton.addActionListener(this::onLoginClick);

        registrationButton = new JButton("Register");
        registrationButton.addActionListener(this::onRegistrationClick);

        rememberPassButton = new JButton("Forgot password?");
        rememberPassButton.addActionListener(this::onForgotPasswordClick);

        // Layout
        imgPanel.add(loginLabel, "w 25%, gap 0px 0px 300px 0px");
        imgPanel.add(loginField, "w 25%");
        imgPanel.add(passLabel, "w 25%");
        imgPanel.add(passField, "w 25%");
        imgPanel.add(errorLabel, "span 4");
        imgPanel.add(registrationButton, "gap 0px 0px 10px 0px");
        imgPanel.add(rememberPassButton);
        imgPanel.add(okButton, "span 2");

        setupFrame();
    }

    private void setupFrame() {
        setTitle("Authorization");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(800, 450);
        setLocationRelativeTo(null);
        setVisible(true);
    }

    private JLabel createLabel(String text) {
        var label = new JLabel(text, SwingConstants.CENTER);
        label.setFont(new Font("Verdana", Font.BOLD, 20));
        label.setForeground(Color.WHITE);
        return label;
    }

    private JLabel createErrorLabel() {
        var label = new JLabel("User does not exist. Please check your credentials.", SwingConstants.CENTER);
        label.setFont(new Font("Verdana", Font.PLAIN, 15));
        label.setForeground(Color.RED);
        label.setBorder(BorderFactory.createCompoundBorder(
            new LineBorder(Color.RED, 1, true),
            BorderFactory.createEmptyBorder(0, 0, 0, 0)));
        label.setVisible(false);
        return label;
    }

    private JTextField createTextField() {
        var field = new JTextField();
        field.setMinimumSize(new Dimension(100, 40));
        field.setFont(new Font("Verdana", Font.PLAIN, 20));
        return field;
    }

    private JPasswordField createPasswordField() {
        var field = new JPasswordField();
        field.setMinimumSize(new Dimension(100, 40));
        field.setFont(new Font("Verdana", Font.PLAIN, 20));
        return field;
    }

    private ImagePanel createBackgroundPanel() {
        var panel = new ImagePanel();
        panel.setLayout(new BorderLayout());
        try {
            var url = AuthView.class.getResource("/res/img/login.png");
            if (url != null) {
                panel.setImage(ImageIO.read(url));
            } else {
                log.warn("Resource not found: /res/img/login.png");
            }
        } catch (IOException e) {
            log.error("Failed to load login image", e);
        }
        return panel;
    }

    private void onLoginClick(ActionEvent ae) {
        boolean success = controller.authenticate(
            loginField.getText(), 
            String.copyValueOf(passField.getPassword())
        );
        
        if (success) {
            errorLabel.setVisible(false);
            setVisible(false);
            navigator.showMainFrame();
        } else {
            errorLabel.setVisible(true);
        }
    }

    private void onRegistrationClick(ActionEvent ae) {
        navigator.showRegistration();
    }

    private void onForgotPasswordClick(ActionEvent ae) {
        // TODO: Implement forgot password functionality
    }

    public JLabel getErrorLabel() {
        return errorLabel;
    }
}

