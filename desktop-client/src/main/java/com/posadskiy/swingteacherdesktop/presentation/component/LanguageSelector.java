package com.posadskiy.swingteacherdesktop.presentation.component;

import javax.swing.*;
import java.awt.*;
import java.util.Map;
import java.util.function.Consumer;

/**
 * Language selector component with modern styling.
 */
public class LanguageSelector extends ModernComboBox<String> {

    private static final Map<String, String> LANGUAGES = Map.of(
        "en", "English",
        "ru", "Русский",
        "it", "Italiano",
        "es", "Español"
    );

    private Consumer<String> onLanguageChanged;

    public LanguageSelector() {
        super(new DefaultComboBoxModel<>(LANGUAGES.keySet().toArray(new String[0])));
        setupLanguageSelector();
    }

    public LanguageSelector(String currentLanguage) {
        super(new DefaultComboBoxModel<>(LANGUAGES.keySet().toArray(new String[0])));
        setupLanguageSelector();
        setSelectedLanguage(currentLanguage);
    }

    private void setupLanguageSelector() {
        setRenderer(new LanguageCellRenderer());
        addActionListener(e -> {
            String selectedCode = (String) getSelectedItem();
            if (selectedCode != null && onLanguageChanged != null) {
                onLanguageChanged.accept(selectedCode);
            }
        });
    }

    public void setSelectedLanguage(String languageCode) {
        if (languageCode != null && LANGUAGES.containsKey(languageCode)) {
            setSelectedItem(languageCode);
        } else {
            setSelectedItem("en"); // Default to English
        }
    }

    public String getSelectedLanguageCode() {
        return (String) getSelectedItem();
    }

    public void setOnLanguageChanged(Consumer<String> callback) {
        this.onLanguageChanged = callback;
    }

    private static class LanguageCellRenderer extends DefaultListCellRenderer {
        @Override
        public Component getListCellRendererComponent(
            JList<?> list, Object value, int index, boolean isSelected, boolean cellHasFocus
        ) {
            JLabel label = (JLabel) super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);

            String code = (String) value;
            String displayName = LANGUAGES.getOrDefault(code, code);
            label.setText(displayName);

            label.setFont(UITheme.getFont(Font.PLAIN, 14));
            label.setBorder(new javax.swing.border.EmptyBorder(8, 12, 8, 12));

            if (isSelected) {
                label.setBackground(UITheme.PRIMARY_ACCENT);
                label.setForeground(UITheme.TEXT_PRIMARY);
            } else {
                label.setBackground(UITheme.INPUT_BACKGROUND);
                label.setForeground(UITheme.TEXT_PRIMARY);
            }

            return label;
        }
    }
}
