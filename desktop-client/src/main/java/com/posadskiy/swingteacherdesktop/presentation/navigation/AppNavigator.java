package com.posadskiy.swingteacherdesktop.presentation.navigation;

import com.posadskiy.swingteacherdesktop.presentation.view.AuthView;
import com.posadskiy.swingteacherdesktop.presentation.view.MainFrameView;
import com.posadskiy.swingteacherdesktop.presentation.view.RegistrationView;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.stereotype.Component;

import javax.swing.*;
import java.util.function.Consumer;

/**
 * Navigation controller for managing view transitions.
 */
@Component
public class AppNavigator {
    
    private final ObjectProvider<AuthView> authViewProvider;
    private final ObjectProvider<MainFrameView> mainFrameProvider;
    private final ObjectProvider<RegistrationView> registrationViewProvider;
    
    public AppNavigator(
        ObjectProvider<AuthView> authViewProvider,
        ObjectProvider<MainFrameView> mainFrameProvider,
        ObjectProvider<RegistrationView> registrationViewProvider
    ) {
        this.authViewProvider = authViewProvider;
        this.mainFrameProvider = mainFrameProvider;
        this.registrationViewProvider = registrationViewProvider;
    }
    
    public void showAuth() {
        invokeOnEdt(view -> view.setVisible(true), authViewProvider);
    }
    
    public void hideAuth() {
        invokeOnEdt(view -> view.setVisible(false), authViewProvider);
    }
    
    public void showMainFrame() {
        invokeOnEdt(view -> view.setVisible(true), mainFrameProvider);
    }
    
    public void hideMainFrame() {
        invokeOnEdt(view -> view.setVisible(false), mainFrameProvider);
    }
    
    public void showRegistration() {
        invokeOnEdt(view -> view.setVisible(true), registrationViewProvider);
    }
    
    public void hideRegistration() {
        invokeOnEdt(view -> view.setVisible(false), registrationViewProvider);
    }
    
    /**
     * Navigates from auth to main frame.
     */
    public void navigateToMainFrame() {
        SwingUtilities.invokeLater(() -> {
            authViewProvider.getObject().setVisible(false);
            mainFrameProvider.getObject().setVisible(true);
        });
    }
    
    /**
     * Navigates from main frame back to auth.
     */
    public void navigateToAuth() {
        SwingUtilities.invokeLater(() -> {
            mainFrameProvider.getObject().setVisible(false);
            authViewProvider.getObject().setVisible(true);
        });
    }
    
    /**
     * Generic helper to invoke action on EDT with view from provider.
     */
    private <T extends JFrame> void invokeOnEdt(Consumer<T> action, ObjectProvider<T> provider) {
        SwingUtilities.invokeLater(() -> action.accept(provider.getObject()));
    }
}

