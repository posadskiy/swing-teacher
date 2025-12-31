package com.posadskiy.swingteacherdesktop.presentation.view;

import com.posadskiy.swingteacherdesktop.infrastructure.i18n.I18nService;
import com.posadskiy.swingteacherdesktop.presentation.component.*;
import com.posadskiy.swingteacherdesktop.presentation.controller.AuthController;
import com.posadskiy.swingteacherdesktop.presentation.navigation.AppNavigator;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.geom.RoundRectangle2D;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;

/**
 * Authentication view for user login.
 * Composes reusable UI components into a cohesive login form.
 */
@Slf4j
@Component
public class AuthView extends JFrame implements PropertyChangeListener {

    private static final int CARD_WIDTH = 380;
    private static final int CARD_HEIGHT = 480;
    private static final int CONTENT_WIDTH = 300;
    private static final int PADDING = 40;

    private final AuthController controller;
    private final AppNavigator navigator;
    private final I18nService i18n;

    private ModernTextField loginField;
    private ModernPasswordField passField;
    private JLabel errorLabel;
    private ModernButton loginButton;
    private JLabel headerLabel;
    private JLabel subHeaderLabel;
    private JLabel emailLabel;
    private JLabel passLabel;
    private ModernButton registerButton;
    private LinkButton forgotPasswordButton;

    public AuthView(AuthController controller, AppNavigator navigator, I18nService i18n) {
        this.controller = controller;
        this.navigator = navigator;
        this.i18n = i18n;
        i18n.addPropertyChangeListener(this);
        initializeUI();
    }

    private void initializeUI() {
        configureFrame();
        setContentPane(new GradientPanel());
        getContentPane().add(createLoginCard());
        setupKeyBindings();
        setVisible(true);
    }

    private void configureFrame() {
        setTitle(i18n.getString("auth.title"));
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(900, 600);
        setMinimumSize(new Dimension(700, 500));
        setLocationRelativeTo(null);
        
        System.setProperty("awt.useSystemAAFontSettings", "on");
        System.setProperty("swing.aatext", "true");
    }

    private JPanel createLoginCard() {
        CardPanel card = new CardPanel();
        card.setPreferredSize(new Dimension(CARD_WIDTH, CARD_HEIGHT));
        card.setLayout(null);

        int y = PADDING;

        // Header
        y = addHeader(card, y);
        
        // Form fields
        y = addFormFields(card, y);
        
        // Error label
        y = addErrorLabel(card, y);
        
        // Buttons
        addButtons(card, y);

        return card;
    }

    private int addHeader(JPanel card, int y) {
        headerLabel = createLabel(i18n.getString("auth.title"), Font.BOLD, 28, UITheme.TEXT_PRIMARY, SwingConstants.CENTER);
        headerLabel.setBounds(PADDING, y, CONTENT_WIDTH, 40);
        card.add(headerLabel);
        y += 45;

        subHeaderLabel = createLabel(i18n.getString("auth.subtitle"), Font.PLAIN, 14, UITheme.TEXT_SECONDARY, SwingConstants.CENTER);
        subHeaderLabel.setBounds(PADDING, y, CONTENT_WIDTH, 24);
        card.add(subHeaderLabel);
        
        return y + 50;
    }

    private int addFormFields(JPanel card, int y) {
        // Email field
        emailLabel = createLabel(i18n.getString("auth.emailLabel"), Font.PLAIN, 13, UITheme.TEXT_SECONDARY, SwingConstants.LEFT);
        emailLabel.setBounds(PADDING, y, CONTENT_WIDTH, 20);
        card.add(emailLabel);
        y += 26;

        loginField = new ModernTextField(i18n.getString("auth.emailPlaceholder"));
        loginField.setBounds(PADDING, y, CONTENT_WIDTH, 48);
        card.add(loginField);
        y += 64;

        // Password field
        passLabel = createLabel(i18n.getString("auth.passwordLabel"), Font.PLAIN, 13, UITheme.TEXT_SECONDARY, SwingConstants.LEFT);
        passLabel.setBounds(PADDING, y, CONTENT_WIDTH, 20);
        card.add(passLabel);
        y += 26;

        passField = new ModernPasswordField(i18n.getString("auth.passwordPlaceholder"));
        passField.setBounds(PADDING, y, CONTENT_WIDTH, 48);
        card.add(passField);
        
        return y + 58;
    }

    private int addErrorLabel(JPanel card, int y) {
        errorLabel = new JLabel(i18n.getString("auth.error.invalidCredentials")) {
            @Override
            protected void paintComponent(Graphics g) {
                if (isVisible()) {
                    Graphics2D g2d = (Graphics2D) g.create();
                    g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                    g2d.setColor(UITheme.ERROR_BACKGROUND);
                    g2d.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 8, 8));
                    g2d.dispose();
                }
                super.paintComponent(g);
            }
        };
        errorLabel.setFont(UITheme.getFont(Font.PLAIN, 12));
        errorLabel.setForeground(UITheme.ERROR_COLOR);
        errorLabel.setBorder(new EmptyBorder(8, 12, 8, 12));
        errorLabel.setBounds(PADDING, y, CONTENT_WIDTH, 36);
        errorLabel.setVisible(false);
        errorLabel.setOpaque(false);
        card.add(errorLabel);
        
        return y + 46;
    }

    private void addButtons(JPanel card, int y) {
        loginButton = ModernButton.primary(i18n.getString("auth.signInButton"));
        loginButton.addActionListener(e -> onLoginClick());
        loginButton.setBounds(PADDING, y, CONTENT_WIDTH, 48);
        card.add(loginButton);
        y += 58;

        registerButton = ModernButton.secondary(i18n.getString("auth.createAccountButton"));
        registerButton.addActionListener(e -> navigator.showRegistration());
        registerButton.setBounds(PADDING, y, CONTENT_WIDTH, 48);
        card.add(registerButton);
        y += 64;

        forgotPasswordButton = new LinkButton(i18n.getString("auth.forgotPasswordLink"));
        forgotPasswordButton.addActionListener(e -> onForgotPasswordClick());
        forgotPasswordButton.setBounds(PADDING, y, CONTENT_WIDTH, 24);
        card.add(forgotPasswordButton);
    }

    private JLabel createLabel(String text, int fontStyle, int fontSize, Color color, int alignment) {
        JLabel label = new JLabel(text, alignment);
        label.setFont(UITheme.getFont(fontStyle, fontSize));
        label.setForeground(color);
        return label;
    }

    private void setupKeyBindings() {
        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
        getRootPane().getInputMap(JComponent.WHEN_IN_FOCUSED_WINDOW).put(enter, "login");
        getRootPane().getActionMap().put("login", new AbstractAction() {
            @Override
            public void actionPerformed(ActionEvent e) {
                onLoginClick();
            }
        });
    }

    private void onLoginClick() {
        String username = loginField.getText().trim();
        String password = String.copyValueOf(passField.getPassword());

        if (username.isEmpty() || password.isEmpty()) {
            showError(i18n.getString("auth.error.fillAllFields"));
            return;
        }

        setLoadingState(true);

        new SwingWorker<Boolean, Void>() {
            @Override
            protected Boolean doInBackground() {
                return controller.authenticate(username, password);
            }

            @Override
            protected void done() {
                try {
                    if (get()) {
                        hideError();
                        setVisible(false);
                        navigator.showMainFrame();
                    } else {
                        showError(i18n.getString("auth.error.invalidCredentials"));
                    }
                } catch (Exception ex) {
                    log.error("Authentication error", ex);
                    showError(i18n.getString("auth.error.generic"));
                } finally {
                    setLoadingState(false);
                }
            }
        }.execute();
    }

    private void onForgotPasswordClick() {
        JOptionPane.showMessageDialog(
            this,
            i18n.getString("auth.forgotPassword.message"),
            i18n.getString("auth.forgotPassword.title"),
            JOptionPane.INFORMATION_MESSAGE
        );
    }

    private void setLoadingState(boolean loading) {
        loginButton.setEnabled(!loading);
        loginButton.setText(loading ? i18n.getString("auth.signingInButton") : i18n.getString("auth.signInButton"));
    }

    /**
     * Updates all UI texts when language changes.
     */
    public void updateUITexts() {
        SwingUtilities.invokeLater(() -> {
            setTitle(i18n.getString("auth.title"));
            if (headerLabel != null) headerLabel.setText(i18n.getString("auth.title"));
            if (subHeaderLabel != null) subHeaderLabel.setText(i18n.getString("auth.subtitle"));
            if (emailLabel != null) emailLabel.setText(i18n.getString("auth.emailLabel"));
            if (passLabel != null) passLabel.setText(i18n.getString("auth.passwordLabel"));
            if (loginButton != null) {
                boolean wasLoading = !loginButton.isEnabled();
                loginButton.setText(wasLoading ? i18n.getString("auth.signingInButton") : i18n.getString("auth.signInButton"));
            }
            if (registerButton != null) registerButton.setText(i18n.getString("auth.createAccountButton"));
            if (forgotPasswordButton != null) forgotPasswordButton.setText(i18n.getString("auth.forgotPasswordLink"));
            // Note: Placeholders in ModernTextField/ModernPasswordField would need component updates
        });
    }

    @Override
    public void propertyChange(PropertyChangeEvent evt) {
        if ("locale".equals(evt.getPropertyName())) {
            updateUITexts();
        }
    }

    private void showError(String message) {
        errorLabel.setText(message);
        errorLabel.setVisible(true);
        errorLabel.repaint();
    }

    private void hideError() {
        errorLabel.setVisible(false);
    }

    public JLabel getErrorLabel() {
        return errorLabel;
    }
}
