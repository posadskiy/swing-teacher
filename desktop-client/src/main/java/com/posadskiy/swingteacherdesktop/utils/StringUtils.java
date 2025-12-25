package com.posadskiy.swingteacherdesktop.utils;

import org.apache.commons.codec.digest.DigestUtils;

import java.util.Optional;

/**
 * Modern string utility methods.
 */
public final class StringUtils {
    
    private StringUtils() {
        // Utility class - prevent instantiation
    }
    
    /**
     * Removes all whitespace characters from a string.
     * Uses modern stream-based approach for clarity.
     *
     * @param input the input string (may be null)
     * @return string with all whitespace removed, or null if input was null
     */
    public static String removeSpace(String input) {
        return Optional.ofNullable(input)
            .map(s -> s.codePoints()
                .filter(ch -> ch > ' ')
                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                .toString())
            .orElse(null);
    }
    
    /**
     * Removes all whitespace and returns Optional.
     */
    public static Optional<String> removeSpaceOptional(String input) {
        return Optional.ofNullable(removeSpace(input))
            .filter(s -> !s.isEmpty());
    }
    
    /**
     * Computes MD5 hash of the input string.
     *
     * @param input the string to hash
     * @return MD5 hex string
     */
    public static String md5Apache(String input) {
        return DigestUtils.md5Hex(input);
    }
    
    /**
     * Checks if string is null or blank.
     */
    public static boolean isBlank(String input) {
        return input == null || input.isBlank();
    }
    
    /**
     * Checks if string is not null and not blank.
     */
    public static boolean isNotBlank(String input) {
        return !isBlank(input);
    }
    
    /**
     * Returns the string or a default value if null/blank.
     */
    public static String defaultIfBlank(String input, String defaultValue) {
        return isBlank(input) ? defaultValue : input;
    }
}
