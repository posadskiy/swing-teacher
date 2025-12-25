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

    public boolean registration(String login, String password, String passwordRepeat, String eMail) {
        RegistrationPane registrationPane = registrationPaneProvider.getObject();
        boolean condition = true;

        User user = appState.getCurrentUser();

        if (checker.checkLogin(login)) {
            registrationPane.getLoginTextField().setBorder(null);
            user.setLogin(login);
        } else {
            registrationPane.getLoginTextField().setBorder(BorderFactory.createLineBorder(Color.red, 1));
            condition = false;
        }


        if (checker.checkPassword(password, passwordRepeat)) {
            registrationPane.getPasswordField().setBorder(null);
            registrationPane.getPasswordRepeatField().setBorder(null);
            user.setPassword(password);
        } else {
            registrationPane.getPasswordField().setBorder(BorderFactory.createLineBorder(Color.red, 1));
            registrationPane.getPasswordRepeatField().setBorder(BorderFactory.createLineBorder(Color.red, 1));
            condition = false;
        }

        if (checker.checkEMail(eMail)) {
            registrationPane.getEMailTextField().setBorder(null);
            user.setEmail(eMail);
        } else {
            registrationPane.getEMailTextField().setBorder(BorderFactory.createLineBorder(Color.red, 1));
            condition = false;
        }

        if (!condition)
            return false;

        // Register user directly without email confirmation
        try {
            userDao.addUser(user);
        } catch (SQLException ex) {
            log.error("Exception in registration", ex);
            return false;
        }

        return true;
    }

    public void closePane() {
        registrationPaneProvider.getObject().setVisible(false);
    }

}
