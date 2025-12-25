package com.posadskiy.swingteacherdesktop.presentation.view;

import com.posadskiy.swingteacherdesktop.presentation.controller.PopupController;
import com.posadskiy.swingteacherdesktop.presentation.controller.RegistrationController;
import net.miginfocom.swing.MigLayout;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import javax.swing.*;
import java.awt.*;

/**
 * Registration view for new user sign-up.
 */
@Lazy
@Component
public class RegistrationView extends JFrame {

    private final RegistrationController controller;
    private final PopupController popupController;

    private JTextField loginTextField;
    private JPasswordField passwordField;
    private JPasswordField passwordRepeatField;
    private JTextField emailTextField;

    public RegistrationView(
        RegistrationController controller,
        PopupController popupController
    ) {
        this.controller = controller;
        this.popupController = popupController;
        initComponents();
    }

    private void initComponents() {
        setLayout(new MigLayout("wrap 2", "grow, fill"));

        // Labels
        var titleLabel = new JLabel("Registration");
        var loginLabel = new JLabel("Login");
        var passwordLabel = new JLabel("Password");
        var passwordRepeatLabel = new JLabel("Repeat password");
        var emailLabel = new JLabel("e-mail");

        // Input fields
        loginTextField = new JTextField();
        passwordField = new JPasswordField();
        passwordRepeatField = new JPasswordField();
        emailTextField = new JFormattedTextField();

        // Buttons
        var okButton = new JButton("Register");
        okButton.addActionListener(e -> onRegisterClick());
        
        var cancelButton = new JButton("Cancel");
        cancelButton.addActionListener(e -> setVisible(false));

        // Layout
        add(titleLabel, "span 2");
        add(loginLabel);
        add(loginTextField);
        add(passwordLabel);
        add(passwordField);
        add(passwordRepeatLabel);
        add(passwordRepeatField);
        add(emailLabel);
        add(emailTextField);
        add(cancelButton);
        add(okButton);

        setupFrame();
    }

    private void setupFrame() {
        setTitle("Registration");
        setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
        setSize(350, 200);
        setLocationRelativeTo(null);
    }

    private void onRegisterClick() {
        var result = controller.register(
            loginTextField.getText(),
            String.copyValueOf(passwordField.getPassword()),
            String.copyValueOf(passwordRepeatField.getPassword()),
            emailTextField.getText()
        );

        // Update field borders based on validation
        updateFieldBorder(loginTextField, !result.hasError("login"));
        updateFieldBorder(passwordField, !result.hasError("password"));
        updateFieldBorder(passwordRepeatField, !result.hasError("password"));
        updateFieldBorder(emailTextField, !result.hasError("email"));

        if (result.isSuccess()) {
            controller.closeRegistration();
            popupController.showSuccess("You are registered! Use your credentials to log in");
        } else if (result.hasErrors()) {
            popupController.showError("Invalid data entered");
        }
    }

    private void updateFieldBorder(JComponent field, boolean isValid) {
        if (isValid) {
            field.setBorder(null);
        } else {
            field.setBorder(BorderFactory.createLineBorder(Color.RED, 1));
        }
    }

    // Getters for testing
    public JTextField getLoginTextField() {
        return loginTextField;
    }

    public JPasswordField getPasswordField() {
        return passwordField;
    }

    public JPasswordField getPasswordRepeatField() {
        return passwordRepeatField;
    }

    public JTextField getEmailTextField() {
        return emailTextField;
    }
}

