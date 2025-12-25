package com.posadskiy.swingteacherdesktop.controllers.auth;

import com.posadskiy.swingteacherdesktop.dao.UserDao;
import com.posadskiy.swingteacherdesktop.state.AppState;
import com.posadskiy.swingteacherdesktop.tables.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Slf4j
@Service
public class AuthLoginService {

    private final UserDao userDao;
    private final AppState appState;

    public AuthLoginService(UserDao userDao, AppState appState) {
        this.userDao = userDao;
        this.appState = appState;
    }

    public boolean authenticate(String login, String pass) {
        User user = null;
        try {
            user = userDao.getUserByLoginAndPassword(login, pass);
        } catch (SQLException ex) {
            log.error("Failed to authenticate user={}", login, ex);
        }

        if (user == null)
            return false;

        appState.setCurrentUser(user);

        return true;
    }

}
