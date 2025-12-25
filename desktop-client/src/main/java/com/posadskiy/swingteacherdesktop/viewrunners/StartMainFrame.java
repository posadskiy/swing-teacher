package com.posadskiy.swingteacherdesktop.viewrunners;

import com.posadskiy.swingteacherdesktop.config.AppConfig;
import com.posadskiy.swingteacherdesktop.navigation.AppNavigator;
import com.posadskiy.swingteacherdesktop.state.AppState;
import com.posadskiy.swingteacherdesktop.tables.User;
import com.posadskiy.swingteacherdesktop.utils.StringUtils;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * Development entry point for testing the main frame directly.
 */
public class StartMainFrame {

    public static void main(String[] args) {
        // Create test user using builder pattern
        var user = User.builder()
            .id(1)
            .email("dmitry.posadsky@gmail.com")
            .login("admin")
            .password(StringUtils.md5Apache("25531094"))
            .lastLogin(1)
            .build();

        var ctx = new AnnotationConfigApplicationContext(AppConfig.class);
        ctx.registerShutdownHook();

        ctx.getBean(AppState.class).setCurrentUser(user);
        ctx.getBean(AppNavigator.class).showMainFrame();
    }
}
