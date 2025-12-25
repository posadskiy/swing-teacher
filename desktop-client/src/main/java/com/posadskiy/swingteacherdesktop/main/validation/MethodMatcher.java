package com.posadskiy.swingteacherdesktop.main.validation;

import java.util.regex.Pattern;

/**
 * Utility class for matching method calls in user code.
 */
public final class MethodMatcher {
    
    private MethodMatcher() {
        // Utility class - prevent instantiation
    }
    
    /**
     * Checks if a method call matches the expected method name.
     * Example: matches("setText", "setText(\"Hi\")") -> true
     */
    public static boolean matches(String expectedMethod, String actualCall) {
        if (expectedMethod == null || actualCall == null) {
            return false;
        }
        
        String pattern = "^" + Pattern.quote(expectedMethod) + "\\([\\s\\S]*\\)$";
        return Pattern.compile(pattern).matcher(actualCall).matches();
    }
    
    /**
     * Checks if the operator is a component method call.
     * Example: isComponentMethod("button", "button.setText(\"Hi\")") -> true
     */
    public static boolean isComponentMethod(String variableName, String operator) {
        if (variableName == null || operator == null || operator.trim().isEmpty()) {
            return false;
        }
        
        String pattern = "^" + Pattern.quote(variableName) + "\\.[\\s\\S]+";
        return Pattern.compile(pattern).matcher(operator).matches();
    }
    
    /**
     * Checks if the operator is an add() call referencing the component.
     * Example: isAddCall("button", "add(button)") -> true
     *          isAddCall("button", "add(button, BorderLayout.NORTH)") -> true
     */
    public static boolean isAddCall(String variableName, String operator) {
        if (variableName == null || operator == null || operator.trim().isEmpty()) {
            return false;
        }
        
        String escapedName = Pattern.quote(variableName);
        String pattern = "^add\\([\\s\\S]*" + escapedName + "[\\s\\S]*\\)$";
        return Pattern.compile(pattern).matcher(operator).matches();
    }
    
    /**
     * Extracts the method call from an operator.
     * Example: extractMethod("button", "button.setText(\"Hi\")") -> "setText(\"Hi\")"
     *          extractMethod("button", "add(button)") -> "add(button)"
     */
    public static String extractMethod(String variableName, String operator) {
        if (variableName == null || operator == null || operator.trim().isEmpty()) {
            return null;
        }
        
        // Handle component method calls
        String componentMethodPattern = "^" + Pattern.quote(variableName) + "\\.([\\s\\S]+)$";
        var matcher = Pattern.compile(componentMethodPattern).matcher(operator);
        if (matcher.matches()) {
            return matcher.group(1);
        }
        
        // Handle add() calls
        String addPattern = "^add\\(([\\s\\S]*)\\)$";
        matcher = Pattern.compile(addPattern).matcher(operator);
        if (matcher.matches()) {
            String params = matcher.group(1);
            if (params != null && params.contains(variableName)) {
                return "add(" + params + ")";
            }
        }
        
        return null;
    }
}
