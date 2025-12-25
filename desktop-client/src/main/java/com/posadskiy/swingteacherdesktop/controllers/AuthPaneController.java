package com.posadskiy.swingteacherdesktop.controllers;

import com.posadskiy.swingteacherdesktop.controllers.auth.AuthLoginService;
import org.springframework.stereotype.Component;

@Component
public class AuthPaneController {

    private final AuthLoginService authLoginService;

    public AuthPaneController(AuthLoginService authLoginService) {
        this.authLoginService = authLoginService;
    }

    public boolean authenticate(String login, String pass) {
        return authLoginService.authenticate(login, pass);
    }
}
