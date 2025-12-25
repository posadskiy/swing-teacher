package com.posadskiy.swingteacherdesktop.presentation.component;

import java.awt.*;

/**
 * Centralized design system with color palette and font utilities.
 * Inspired by modern dark theme UI patterns.
 */
public final class UITheme {

    private UITheme() {} // Prevent instantiation

    // Background colors
    public static final Color BACKGROUND_START = new Color(15, 23, 42);      // Slate-900
    public static final Color BACKGROUND_END = new Color(30, 41, 59);        // Slate-800
    
    // Card colors
    public static final Color CARD_BACKGROUND = new Color(30, 41, 59, 230);  // Semi-transparent
    public static final Color CARD_BORDER = new Color(71, 85, 105, 100);     // Slate-600
    
    // Accent colors
    public static final Color PRIMARY_ACCENT = new Color(99, 102, 241);      // Indigo-500
    public static final Color PRIMARY_HOVER = new Color(129, 140, 248);      // Indigo-400
    
    // Text colors
    public static final Color TEXT_PRIMARY = new Color(248, 250, 252);       // Slate-50
    public static final Color TEXT_SECONDARY = new Color(148, 163, 184);     // Slate-400
    public static final Color TEXT_PLACEHOLDER = new Color(100, 116, 139);   // Slate-500
    
    // Input colors
    public static final Color INPUT_BACKGROUND = new Color(51, 65, 85);      // Slate-700
    public static final Color INPUT_BORDER = new Color(71, 85, 105);         // Slate-600
    public static final Color INPUT_FOCUS = new Color(99, 102, 241);         // Indigo-500
    
    // Status colors
    public static final Color ERROR_COLOR = new Color(239, 68, 68);          // Red-500
    public static final Color ERROR_BACKGROUND = new Color(127, 29, 29, 50); // Red with transparency
    
    // Button colors
    public static final Color SECONDARY_BUTTON = new Color(71, 85, 105);     // Slate-600
    public static final Color SECONDARY_HOVER = new Color(100, 116, 139);    // Slate-500

    // Font families to try (in order of preference)
    private static final String[] FONT_FAMILIES = {
        ".SF NS", "SF Pro Display", "Helvetica Neue", "Segoe UI", "Arial"
    };
    
    private static String cachedFontFamily;

    /**
     * Returns a modern font with cross-platform fallback support.
     */
    public static Font getFont(int style, int size) {
        if (cachedFontFamily == null) {
            cachedFontFamily = findAvailableFont();
        }
        return new Font(cachedFontFamily, style, size);
    }

    private static String findAvailableFont() {
        GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
        String[] availableFonts = ge.getAvailableFontFamilyNames();
        
        for (String family : FONT_FAMILIES) {
            for (String available : availableFonts) {
                if (available.equalsIgnoreCase(family)) {
                    return family;
                }
            }
        }
        return Font.SANS_SERIF;
    }

    /**
     * Interpolates between two colors for smooth animations.
     */
    public static Color interpolate(Color c1, Color c2, float progress) {
        int r = (int) (c1.getRed() + (c2.getRed() - c1.getRed()) * progress);
        int g = (int) (c1.getGreen() + (c2.getGreen() - c1.getGreen()) * progress);
        int b = (int) (c1.getBlue() + (c2.getBlue() - c1.getBlue()) * progress);
        return new Color(r, g, b);
    }
}


