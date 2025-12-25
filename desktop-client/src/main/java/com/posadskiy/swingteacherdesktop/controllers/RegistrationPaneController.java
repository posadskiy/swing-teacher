package com.posadskiy.swingteacherdesktop.controllers;

import com.posadskiy.swingteacherdesktop.dao.UserDao;
import com.posadskiy.swingteacherdesktop.main.Checker;
import com.posadskiy.swingteacherdesktop.state.AppState;
import com.posadskiy.swingteacherdesktop.tables.User;
import com.posadskiy.swingteacherdesktop.views.RegistrationPane;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.stereotype.Component;

import javax.swing.*;
import java.awt.*;
import java.sql.SQLException;

/**
 * Controller for registration pane using modern Java patterns.
 */
@Slf4j
@Component
public class RegistrationPaneController {

    private final ObjectProvider<RegistrationPane> registrationPaneProvider;
    private final UserDao userDao;
    private final Checker checker;
    private final AppState appState;

    public RegistrationPaneController(
        ObjectProvider<RegistrationPane> registrationPaneProvider,
        UserDao userDao,
        Checker checker,
        AppState appState
    ) {
        this.registrationPaneProvider = registrationPaneProvider;
        this.userDao = userDao;
        this.checker = checker;
        this.appState = appState;
    }

    public boolean registration(String login, String password, String passwordRepeat, String email) {
        var registrationPane = registrationPaneProvider.getObject();
        var builder = User.builder();
        boolean isValid = true;

        // Validate login
        if (checker.checkLogin(login)) {
            registrationPane.getLoginTextField().setBorder(null);
            builder.login(login);
        } else {
            registrationPane.getLoginTextField().setBorder(BorderFactory.createLineBorder(Color.red, 1));
            isValid = false;
        }

        // Validate password
        if (checker.checkPassword(password, passwordRepeat)) {
            registrationPane.getPasswordField().setBorder(null);
            registrationPane.getPasswordRepeatField().setBorder(null);
            builder.password(password);
        } else {
            registrationPane.getPasswordField().setBorder(BorderFactory.createLineBorder(Color.red, 1));
            registrationPane.getPasswordRepeatField().setBorder(BorderFactory.createLineBorder(Color.red, 1));
            isValid = false;
        }

        // Validate email
        if (checker.checkEMail(email)) {
            registrationPane.getEMailTextField().setBorder(null);
            builder.email(email);
        } else {
            registrationPane.getEMailTextField().setBorder(BorderFactory.createLineBorder(Color.red, 1));
            isValid = false;
        }

        if (!isValid) {
            return false;
        }

        // Register user
        try {
            var user = builder.build();
            userDao.addUser(user);
            return true;
        } catch (SQLException ex) {
            log.error("Registration failed", ex);
            return false;
        }
    }

    public void closePane() {
        registrationPaneProvider.getObject().setVisible(false);
    }
}
