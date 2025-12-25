package com.posadskiy.swingteacherdesktop.navigation;

import com.posadskiy.swingteacherdesktop.views.AuthPane;
import com.posadskiy.swingteacherdesktop.views.MainFrameView;
import com.posadskiy.swingteacherdesktop.views.RegistrationPane;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.stereotype.Component;

import javax.swing.*;

@Component
public class AppNavigator {
    private final ObjectProvider<AuthPane> authPaneProvider;
    private final ObjectProvider<MainFrameView> mainFrameProvider;
    private final ObjectProvider<RegistrationPane> registrationPaneProvider;

    public AppNavigator(
        ObjectProvider<AuthPane> authPaneProvider,
        ObjectProvider<MainFrameView> mainFrameProvider,
        ObjectProvider<RegistrationPane> registrationPaneProvider
    ) {
        this.authPaneProvider = authPaneProvider;
        this.mainFrameProvider = mainFrameProvider;
        this.registrationPaneProvider = registrationPaneProvider;
    }

    public void showAuth() {
        SwingUtilities.invokeLater(() -> authPaneProvider.getObject().setVisible(true));
    }

    public void hideAuth() {
        SwingUtilities.invokeLater(() -> authPaneProvider.getObject().setVisible(false));
    }

    public void showMainFrame() {
        SwingUtilities.invokeLater(() -> mainFrameProvider.getObject().setVisible(true));
    }

    public void showRegistration() {
        SwingUtilities.invokeLater(() -> registrationPaneProvider.getObject().setVisible(true));
    }
}


