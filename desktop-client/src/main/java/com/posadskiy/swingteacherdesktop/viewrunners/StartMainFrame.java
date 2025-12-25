package com.posadskiy.swingteacherdesktop.viewrunners;

import com.posadskiy.swingteacherdesktop.config.AppConfig;
import com.posadskiy.swingteacherdesktop.navigation.AppNavigator;
import com.posadskiy.swingteacherdesktop.state.AppState;
import com.posadskiy.swingteacherdesktop.tables.User;
import com.posadskiy.swingteacherdesktop.utils.StringUtils;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class StartMainFrame {

    public static void main(String[] args) {
        User user = new User();
        user.setEmail("dmitry.posadsky@gmail.com");
        user.setLastLogin(1);
        user.setLogin("admin");
        user.setPassword(StringUtils.md5Apache("25531094"));
        user.setId(1);

        var ctx = new AnnotationConfigApplicationContext(AppConfig.class);
        ctx.registerShutdownHook();

        ctx.getBean(AppState.class).setCurrentUser(user);
        ctx.getBean(AppNavigator.class).showMainFrame();
    }

}
