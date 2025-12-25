package com.posadskiy.swingteacherdesktop.views;

import com.posadskiy.swingteacherdesktop.controllers.PopupWindowsController;
import com.posadskiy.swingteacherdesktop.controllers.RegistrationPaneController;
import net.miginfocom.swing.MigLayout;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import javax.swing.*;

/**
 *
 * @author DPosadsky
 */
@Lazy
@Component
public class RegistrationPane extends JFrame {

    JLabel titleLabel;
    JLabel loginLabel;
    JLabel passwordLabel;
    JLabel passwordRepeatLabel;
    JLabel eMailLabel;

    JTextField loginTextField;
    JPasswordField passwordField;
    JPasswordField passwordRepeatField;
    JTextField eMailTextField;

    JButton okButton;
    JButton cancelButton;

    MigLayout layout;
    RegistrationPaneController registrationPaneController;
    PopupWindowsController popupWindowsController;

    public RegistrationPane(RegistrationPaneController registrationPaneController, PopupWindowsController popupWindowsController) {
        this.registrationPaneController = registrationPaneController;
        this.popupWindowsController = popupWindowsController;
        initComponents();
    }

    public void initComponents() {
        layout = new MigLayout("wrap 2", "grow, fill");
        setLayout(layout);

        titleLabel = new JLabel("Registration");
        loginLabel = new JLabel("Login");
        passwordLabel = new JLabel("Password");
        passwordRepeatLabel = new JLabel("Repeat password");
        eMailLabel = new JLabel("e-mail");

        loginTextField = new JTextField();
        passwordField = new JPasswordField();
        passwordRepeatField = new JPasswordField();
        eMailTextField = new JFormattedTextField();

        okButton = new JButton("Register");
        okButton.addActionListener(ae -> registrationButtonClick());
        cancelButton = new JButton("Cancel");

        add(titleLabel, "span 2");
        add(loginLabel);
        add(loginTextField);
        add(passwordLabel);
        add(passwordField);
        add(passwordRepeatLabel);
        add(passwordRepeatField);
        add(eMailLabel);
        add(eMailTextField);

        add(cancelButton);
        add(okButton);

        doSetupFrame();
    }

    public void doSetupFrame() {
        setTitle("Registration");
        setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
        setSize(350, 200);
        // setVisible(true) removed - frame should only be shown when explicitly called via navigator
        //pack();
        setLocationRelativeTo(null);
    }

    public void registrationButtonClick() {
        if (registrationPaneController.registration(loginTextField.getText(),
            String.copyValueOf(passwordField.getPassword()),
            String.copyValueOf(passwordRepeatField.getPassword()),
            eMailTextField.getText())) {
            registrationPaneController.closePane();
            popupWindowsController.createPopupWindow(
                "You are registered! Use your credentials to log in", "Success");
        } else
            popupWindowsController.createPopupWindow("Invalid data entered", "Error!");
    }

    public JTextField getLoginTextField() {
        return loginTextField;
    }

    public JPasswordField getPasswordField() {
        return passwordField;
    }

    public JPasswordField getPasswordRepeatField() {
        return passwordRepeatField;
    }

    public JTextField getEMailTextField() {
        return eMailTextField;
    }

}
