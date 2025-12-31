package com.posadskiy.swingteacherdesktop.presentation.view;

import com.posadskiy.swingteacherdesktop.infrastructure.i18n.I18nService;
import com.posadskiy.swingteacherdesktop.presentation.component.*;
import com.posadskiy.swingteacherdesktop.presentation.controller.PopupController;
import com.posadskiy.swingteacherdesktop.presentation.controller.RegistrationController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;

/**
 * Modern registration view for new user sign-up.
 * Uses reusable UI components for consistent styling.
 */
@Slf4j
@Lazy
@Component
public class RegistrationView extends JFrame implements PropertyChangeListener {

    private static final int CARD_WIDTH = 400;
    private static final int CARD_HEIGHT = 520;
    private static final int CONTENT_WIDTH = 320;
    private static final int PADDING = 40;

    private final RegistrationController controller;
    private final PopupController popupController;
    private final I18nService i18n;

    private ModernTextField loginField;
    private ModernPasswordField passwordField;
    private ModernPasswordField passwordRepeatField;
    private ModernTextField emailField;
    private ModernButton registerButton;
    private JLabel headerLabel;
    private JLabel subHeaderLabel;
    private JLabel usernameLabel;
    private JLabel emailLabel;
    private JLabel passwordLabel;
    private JLabel confirmPasswordLabel;
    private LinkButton backButton;

    public RegistrationView(
        RegistrationController controller,
        PopupController popupController,
        I18nService i18n
    ) {
        this.controller = controller;
        this.popupController = popupController;
        this.i18n = i18n;
        i18n.addPropertyChangeListener(this);
        initializeUI();
    }

    private void initializeUI() {
        configureFrame();
        setContentPane(new GradientPanel());
        getContentPane().add(createRegistrationCard());
        setupKeyBindings();
    }

    private void configureFrame() {
        setTitle(i18n.getString("registration.title"));
        setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
        setSize(900, 620);
        setMinimumSize(new Dimension(700, 550));
        setLocationRelativeTo(null);

        System.setProperty("awt.useSystemAAFontSettings", "on");
        System.setProperty("swing.aatext", "true");
    }

    private JPanel createRegistrationCard() {
        CardPanel card = new CardPanel();
        card.setPreferredSize(new Dimension(CARD_WIDTH, CARD_HEIGHT));
        card.setLayout(null);

        int y = PADDING;

        // Header
        y = addHeader(card, y);

        // Form fields
        y = addFormFields(card, y);

        // Buttons
        addButtons(card, y);

        return card;
    }

    private int addHeader(JPanel card, int y) {
        headerLabel = createLabel(i18n.getString("registration.title"), Font.BOLD, 28, UITheme.TEXT_PRIMARY, SwingConstants.CENTER);
        headerLabel.setBounds(PADDING, y, CONTENT_WIDTH, 40);
        card.add(headerLabel);
        y += 45;

        subHeaderLabel = createLabel(i18n.getString("registration.subtitle"), Font.PLAIN, 14, UITheme.TEXT_SECONDARY, SwingConstants.CENTER);
        subHeaderLabel.setBounds(PADDING, y, CONTENT_WIDTH, 24);
        card.add(subHeaderLabel);

        return y + 40;
    }

    private int addFormFields(JPanel card, int y) {
        // Username field
        y = addField(card, y, i18n.getString("registration.usernameLabel"), i18n.getString("registration.usernamePlaceholder"));
        loginField = (ModernTextField) card.getComponent(card.getComponentCount() - 1);
        usernameLabel = (JLabel) card.getComponent(card.getComponentCount() - 2);

        // Email field
        y = addField(card, y, i18n.getString("registration.emailLabel"), i18n.getString("registration.emailPlaceholder"));
        emailField = (ModernTextField) card.getComponent(card.getComponentCount() - 1);
        emailLabel = (JLabel) card.getComponent(card.getComponentCount() - 2);

        // Password field
        y = addPasswordField(card, y, i18n.getString("registration.passwordLabel"), i18n.getString("registration.passwordPlaceholder"));
        passwordField = (ModernPasswordField) card.getComponent(card.getComponentCount() - 1);
        passwordLabel = (JLabel) card.getComponent(card.getComponentCount() - 2);

        // Confirm password field
        y = addPasswordField(card, y, i18n.getString("registration.confirmPasswordLabel"), i18n.getString("registration.confirmPasswordPlaceholder"));
        passwordRepeatField = (ModernPasswordField) card.getComponent(card.getComponentCount() - 1);
        confirmPasswordLabel = (JLabel) card.getComponent(card.getComponentCount() - 2);

        return y;
    }

    private int addField(JPanel card, int y, String labelText, String placeholder) {
        JLabel label = createLabel(labelText, Font.PLAIN, 13, UITheme.TEXT_SECONDARY, SwingConstants.LEFT);
        label.setBounds(PADDING, y, CONTENT_WIDTH, 20);
        card.add(label);
        y += 24;

        ModernTextField field = new ModernTextField(placeholder);
        field.setBounds(PADDING, y, CONTENT_WIDTH, 44);
        card.add(field);

        return y + 54;
    }

    private int addPasswordField(JPanel card, int y, String labelText, String placeholder) {
        JLabel label = createLabel(labelText, Font.PLAIN, 13, UITheme.TEXT_SECONDARY, SwingConstants.LEFT);
        label.setBounds(PADDING, y, CONTENT_WIDTH, 20);
        card.add(label);
        y += 24;

        ModernPasswordField field = new ModernPasswordField(placeholder);
        field.setBounds(PADDING, y, CONTENT_WIDTH, 44);
        card.add(field);

        return y + 54;
    }

    private void addButtons(JPanel card, int y) {
        registerButton = ModernButton.primary(i18n.getString("registration.createAccountButton"));
        registerButton.addActionListener(e -> onRegisterClick());
        registerButton.setBounds(PADDING, y, CONTENT_WIDTH, 48);
        card.add(registerButton);
        y += 58;

        backButton = new LinkButton(i18n.getString("registration.backLink"));
        backButton.addActionListener(e -> setVisible(false));
        backButton.setBounds(PADDING, y, CONTENT_WIDTH, 24);
        card.add(backButton);
    }

    private JLabel createLabel(String text, int fontStyle, int fontSize, Color color, int alignment) {
        JLabel label = new JLabel(text, alignment);
        label.setFont(UITheme.getFont(fontStyle, fontSize));
        label.setForeground(color);
        return label;
    }

    private void setupKeyBindings() {
        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
        getRootPane().getInputMap(JComponent.WHEN_IN_FOCUSED_WINDOW).put(enter, "register");
        getRootPane().getActionMap().put("register", new AbstractAction() {
            @Override
            public void actionPerformed(ActionEvent e) {
                onRegisterClick();
            }
        });

        KeyStroke escape = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0);
        getRootPane().getInputMap(JComponent.WHEN_IN_FOCUSED_WINDOW).put(escape, "cancel");
        getRootPane().getActionMap().put("cancel", new AbstractAction() {
            @Override
            public void actionPerformed(ActionEvent e) {
                setVisible(false);
            }
        });
    }

    private void onRegisterClick() {
        setLoadingState(true);

        new SwingWorker<RegistrationController.ValidationResult, Void>() {
            @Override
            protected RegistrationController.ValidationResult doInBackground() {
                return controller.register(
                    loginField.getText(),
                    String.copyValueOf(passwordField.getPassword()),
                    String.copyValueOf(passwordRepeatField.getPassword()),
                    emailField.getText()
                );
            }

            @Override
            protected void done() {
                try {
                    var result = get();
                    if (result.isSuccess()) {
                        controller.closeRegistration();
                        popupController.showSuccess(i18n.getString("registration.success"));
                    } else if (result.hasErrors()) {
                        popupController.showError(i18n.getString("registration.error.checkForm"));
                    }
                } catch (Exception ex) {
                    log.error("Registration error", ex);
                    popupController.showError(i18n.getString("registration.error.generic"));
                } finally {
                    setLoadingState(false);
                }
            }
        }.execute();
    }

    private void setLoadingState(boolean loading) {
        registerButton.setEnabled(!loading);
        registerButton.setText(loading ? i18n.getString("registration.creatingAccountButton") : i18n.getString("registration.createAccountButton"));
    }

    /**
     * Updates all UI texts when language changes.
     */
    public void updateUITexts() {
        SwingUtilities.invokeLater(() -> {
            setTitle(i18n.getString("registration.title"));
            if (headerLabel != null) headerLabel.setText(i18n.getString("registration.title"));
            if (subHeaderLabel != null) subHeaderLabel.setText(i18n.getString("registration.subtitle"));
            if (usernameLabel != null) usernameLabel.setText(i18n.getString("registration.usernameLabel"));
            if (emailLabel != null) emailLabel.setText(i18n.getString("registration.emailLabel"));
            if (passwordLabel != null) passwordLabel.setText(i18n.getString("registration.passwordLabel"));
            if (confirmPasswordLabel != null)
                confirmPasswordLabel.setText(i18n.getString("registration.confirmPasswordLabel"));
            if (registerButton != null) {
                boolean wasLoading = !registerButton.isEnabled();
                registerButton.setText(wasLoading ? i18n.getString("registration.creatingAccountButton") : i18n.getString("registration.createAccountButton"));
            }
            if (backButton != null) backButton.setText(i18n.getString("registration.backLink"));
        });
    }

    @Override
    public void propertyChange(PropertyChangeEvent evt) {
        if ("locale".equals(evt.getPropertyName())) {
            updateUITexts();
        }
    }

    // Getters for testing
    public JTextField getLoginTextField() {
        return loginField;
    }

    public JPasswordField getPasswordField() {
        return passwordField;
    }

    public JPasswordField getPasswordRepeatField() {
        return passwordRepeatField;
    }

    public JTextField getEmailTextField() {
        return emailField;
    }
}
