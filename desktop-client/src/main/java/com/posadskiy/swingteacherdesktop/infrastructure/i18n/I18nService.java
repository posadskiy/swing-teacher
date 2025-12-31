package com.posadskiy.swingteacherdesktop.infrastructure.i18n;

import org.springframework.stereotype.Component;

import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.text.MessageFormat;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

/**
 * Internationalization service for managing translations.
 * Provides thread-safe access to ResourceBundle and supports dynamic language switching.
 */
@Component
public class I18nService {

    private static final String BUNDLE_BASE_NAME = "i18n.messages";
    private static final Locale DEFAULT_LOCALE = Locale.ENGLISH;
    private final PropertyChangeSupport propertyChangeSupport;
    private volatile ResourceBundle bundle;
    private volatile Locale currentLocale;

    public I18nService() {
        this.currentLocale = DEFAULT_LOCALE;
        this.bundle = ResourceBundle.getBundle(BUNDLE_BASE_NAME, currentLocale);
        this.propertyChangeSupport = new PropertyChangeSupport(this);
    }

    /**
     * Gets a translated string by key.
     * Returns the key itself if translation is missing.
     */
    public String getString(String key) {
        try {
            return bundle.getString(key);
        } catch (MissingResourceException e) {
            // Fallback to English if key is missing
            try {
                ResourceBundle defaultBundle = ResourceBundle.getBundle(BUNDLE_BASE_NAME, DEFAULT_LOCALE);
                return defaultBundle.getString(key);
            } catch (MissingResourceException ex) {
                return key; // Return key as fallback
            }
        }
    }

    /**
     * Gets a translated string with parameter substitution.
     * Uses MessageFormat for formatting.
     */
    public String getString(String key, Object... args) {
        String pattern = getString(key);
        try {
            return MessageFormat.format(pattern, args);
        } catch (IllegalArgumentException e) {
            return pattern; // Return unformatted pattern if formatting fails
        }
    }

    /**
     * Sets the current locale and reloads the resource bundle.
     * Notifies all listeners of the language change.
     */
    public void setLocale(Locale locale) {
        if (locale == null) {
            locale = DEFAULT_LOCALE;
        }

        Locale oldLocale = this.currentLocale;
        this.currentLocale = locale;
        this.bundle = ResourceBundle.getBundle(BUNDLE_BASE_NAME, locale);

        propertyChangeSupport.firePropertyChange("locale", oldLocale, locale);
    }

    /**
     * Sets the current locale by language code (e.g., "en", "ru", "es", "it").
     */
    public void setLocale(String languageCode) {
        Locale locale;
        if (languageCode == null || languageCode.isEmpty()) {
            locale = Locale.ENGLISH;
        } else {
            locale = Locale.forLanguageTag(languageCode.toLowerCase());
            // Fallback to English if locale is invalid
            if (locale.getLanguage().isEmpty()) {
                locale = Locale.ENGLISH;
            }
        }
        setLocale(locale);
    }

    /**
     * Gets the current locale.
     */
    public Locale getCurrentLocale() {
        return currentLocale;
    }

    /**
     * Gets the current language code.
     */
    public String getCurrentLanguageCode() {
        return currentLocale.getLanguage();
    }

    /**
     * Adds a property change listener for locale changes.
     */
    public void addPropertyChangeListener(PropertyChangeListener listener) {
        propertyChangeSupport.addPropertyChangeListener(listener);
    }

    /**
     * Removes a property change listener.
     */
    public void removePropertyChangeListener(PropertyChangeListener listener) {
        propertyChangeSupport.removePropertyChangeListener(listener);
    }
}
