package com.posadskiy.swingteacherdesktop.state;

import com.posadskiy.swingteacherdesktop.tables.User;
import org.springframework.stereotype.Component;

import java.util.concurrent.atomic.AtomicReference;

@Component
public class AppState {
    private final AtomicReference<User> currentUser = new AtomicReference<>(new User());

    public User getCurrentUser() {
        return currentUser.get();
    }

    public void setCurrentUser(User user) {
        currentUser.set(user == null ? new User() : user);
    }
}


