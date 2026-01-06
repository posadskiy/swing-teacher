package com.posadskiy.swingteacherdesktop.presentation.view;

import com.posadskiy.swingteacherdesktop.infrastructure.i18n.I18nService;
import com.posadskiy.swingteacherdesktop.presentation.component.*;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.Objects;
import java.util.function.Consumer;

/**
 * Simple settings dialog (currently: language).
 */
public final class SettingsDialog extends JDialog implements PropertyChangeListener {

    private final I18nService i18n;
    private final Consumer<String> onLanguageChanged;

    private JLabel titleLabel;
    private JLabel languageLabel;
    private LanguageSelector languageSelector;
    private ModernButton closeButton;

    public SettingsDialog(
        JFrame owner,
        I18nService i18n,
        String currentLanguage,
        Consumer<String> onLanguageChanged
    ) {
        super(owner, true);
        this.i18n = Objects.requireNonNull(i18n, "i18n");
        this.onLanguageChanged = Objects.requireNonNull(onLanguageChanged, "onLanguageChanged");
        i18n.addPropertyChangeListener(this);

        initializeUI(currentLanguage);
    }

    private void initializeUI(String currentLanguage) {
        setTitle(i18n.getString("settings.title"));
        setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
        setSize(520, 300);
        setMinimumSize(new Dimension(480, 260));
        setLocationRelativeTo(getOwner());

        GradientPanel root = new GradientPanel(new BorderLayout(16, 16));
        root.setBorder(new EmptyBorder(16, 16, 16, 16));

        CardPanel card = new CardPanel();
        card.setLayout(new GridBagLayout());
        card.setBorder(new EmptyBorder(20, 20, 20, 20));

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.weightx = 1;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.insets = new Insets(0, 0, 16, 0);

        titleLabel = new JLabel(i18n.getString("settings.title"));
        titleLabel.setFont(UITheme.getFont(Font.BOLD, 20));
        titleLabel.setForeground(UITheme.TEXT_PRIMARY);
        card.add(titleLabel, gbc);

        gbc.gridy++;
        gbc.insets = new Insets(0, 0, 8, 0);
        languageLabel = new JLabel(i18n.getString("settings.language"));
        languageLabel.setFont(UITheme.getFont(Font.PLAIN, 13));
        languageLabel.setForeground(UITheme.TEXT_SECONDARY);
        card.add(languageLabel, gbc);

        gbc.gridy++;
        gbc.insets = new Insets(0, 0, 0, 0);
        languageSelector = new LanguageSelector(currentLanguage);
        languageSelector.setPreferredSize(new Dimension(0, 44));
        languageSelector.setOnLanguageChanged(code -> onLanguageChanged.accept(code));
        card.add(languageSelector, gbc);

        root.add(card, BorderLayout.CENTER);

        closeButton = ModernButton.primary(i18n.getString("button.close"));
        closeButton.setPreferredSize(new Dimension(120, 44));
        closeButton.addActionListener(e -> dispose());

        JPanel footer = new JPanel(new FlowLayout(FlowLayout.RIGHT, 0, 0));
        footer.setOpaque(false);
        footer.add(closeButton);
        root.add(footer, BorderLayout.SOUTH);

        setContentPane(root);
    }

    private void updateUITexts() {
        SwingUtilities.invokeLater(() -> {
            setTitle(i18n.getString("settings.title"));
            if (titleLabel != null) titleLabel.setText(i18n.getString("settings.title"));
            if (languageLabel != null) languageLabel.setText(i18n.getString("settings.language"));
            if (closeButton != null) closeButton.setText(i18n.getString("button.close"));
        });
    }

    @Override
    public void propertyChange(PropertyChangeEvent evt) {
        if ("locale".equals(evt.getPropertyName())) {
            updateUITexts();
        }
    }
}

