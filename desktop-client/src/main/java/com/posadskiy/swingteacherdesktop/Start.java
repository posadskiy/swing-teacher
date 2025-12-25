package com.posadskiy.swingteacherdesktop;

import com.posadskiy.swingteacherdesktop.infrastructure.config.AppConfig;
import com.posadskiy.swingteacherdesktop.presentation.navigation.AppNavigator;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import javax.swing.*;

/**
 * Application entry point.
 */
public class Start {
    public static void main(String[] args) {
        // Set Look and Feel before creating any Swing components
        setLookAndFeel();

        // Initialize Spring context and show UI on EDT
        SwingUtilities.invokeLater(() -> {
            var ctx = new AnnotationConfigApplicationContext(AppConfig.class);
            ctx.registerShutdownHook();

            ctx.getBean(AppNavigator.class).showAuth();
        });
    }

    private static void setLookAndFeel() {
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException
                 | UnsupportedLookAndFeelException ex) {
            System.err.println("Failed to set system Look&Feel: " + ex.getMessage());
            try {
                UIManager.setLookAndFeel(UIManager.getCrossPlatformLookAndFeelClassName());
            } catch (Exception e) {
                System.err.println("Failed to set fallback Look&Feel: " + e.getMessage());
            }
        }
    }
}
