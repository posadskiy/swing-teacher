package com.posadskiy.swingteacherdesktop.navigation;

import com.posadskiy.swingteacherdesktop.views.AuthPane;
import com.posadskiy.swingteacherdesktop.views.MainFrameView;
import com.posadskiy.swingteacherdesktop.views.RegistrationPane;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.stereotype.Component;

import javax.swing.*;
import java.util.function.Consumer;

/**
 * Modern navigation controller using functional patterns.
 */
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
        invokeOnEdt(view -> view.setVisible(true), authPaneProvider);
    }
    
    public void hideAuth() {
        invokeOnEdt(view -> view.setVisible(false), authPaneProvider);
    }
    
    public void showMainFrame() {
        invokeOnEdt(view -> view.setVisible(true), mainFrameProvider);
    }
    
    public void hideMainFrame() {
        invokeOnEdt(view -> view.setVisible(false), mainFrameProvider);
    }
    
    public void showRegistration() {
        invokeOnEdt(view -> view.setVisible(true), registrationPaneProvider);
    }
    
    public void hideRegistration() {
        invokeOnEdt(view -> view.setVisible(false), registrationPaneProvider);
    }
    
    /**
     * Navigates from auth to main frame.
     */
    public void navigateToMainFrame() {
        SwingUtilities.invokeLater(() -> {
            authPaneProvider.getObject().setVisible(false);
            mainFrameProvider.getObject().setVisible(true);
        });
    }
    
    /**
     * Navigates from main frame back to auth.
     */
    public void navigateToAuth() {
        SwingUtilities.invokeLater(() -> {
            mainFrameProvider.getObject().setVisible(false);
            authPaneProvider.getObject().setVisible(true);
        });
    }
    
    /**
     * Generic helper to invoke action on EDT with view from provider.
     */
    private <T extends JFrame> void invokeOnEdt(Consumer<T> action, ObjectProvider<T> provider) {
        SwingUtilities.invokeLater(() -> action.accept(provider.getObject()));
    }
}
