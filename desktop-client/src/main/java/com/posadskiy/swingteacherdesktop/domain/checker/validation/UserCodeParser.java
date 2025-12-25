package com.posadskiy.swingteacherdesktop.domain.checker.validation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * Parses user code to extract components and method calls.
 */
public final class UserCodeParser {
    
    private UserCodeParser() {
        // Utility class - prevent instantiation
    }
    
    /**
     * Extracts user components from code based on expected class names.
     * 
     * @param expectedClassNames List of class names to look for
     * @param userCode The user's code to parse
     * @return Map of class name to UserComponent
     */
    public static Map<String, UserComponent> extractComponents(
            List<String> expectedClassNames, 
            String userCode) {
        
        var result = new HashMap<String, UserComponent>();
        
        for (var className : expectedClassNames) {
            var component = extractComponent(className, userCode);
            result.put(className, component);
        }
        
        return result;
    }
    
    private static UserComponent extractComponent(String className, String userCode) {
        // Pattern to match: ClassName varName = new ClassName(...)
        // or just: new ClassName(...)
        var constructorPattern = Pattern.compile(
            "(?:" + className + "\\s+(\\w+)\\s*=\\s*)?" +
            "new\\s+" + className + "\\s*\\([^)]*\\)",
            Pattern.MULTILINE
        );
        
        var matcher = constructorPattern.matcher(userCode);
        
        if (!matcher.find()) {
            return UserComponent.empty(className);
        }
        
        var variableName = matcher.group(1);
        if (variableName == null || variableName.isBlank()) {
            // Anonymous construction - still valid
            variableName = "_anonymous_" + className;
        }
        
        // Extract method calls on this variable
        var methodCalls = extractMethodCalls(variableName, userCode);
        
        return new UserComponent(className, variableName, methodCalls);
    }
    
    private static List<String> extractMethodCalls(String variableName, String userCode) {
        var methodCalls = new ArrayList<String>();
        
        // Handle anonymous constructions
        if (variableName.startsWith("_anonymous_")) {
            return methodCalls;
        }
        
        // Pattern 1: Match methods called on the variable: varName.methodName(...)
        var methodOnVariablePattern = Pattern.compile(
            variableName + "\\s*\\.\\s*(\\w+)\\s*\\([^)]*\\)",
            Pattern.MULTILINE
        );
        
        var matcher = methodOnVariablePattern.matcher(userCode);
        while (matcher.find()) {
            var fullCall = matcher.group(0);
            methodCalls.add(fullCall);
        }
        
        // Pattern 2: Match standalone method calls where variable is passed as parameter
        // e.g., add(button) or add(button, BorderLayout.NORTH)
        // This handles cases where methods are called on the container, not the component
        var standaloneMethodPattern = Pattern.compile(
            "(\\w+)\\s*\\([^)]*\\b" + Pattern.quote(variableName) + "\\b[^)]*\\)",
            Pattern.MULTILINE
        );
        
        var standaloneMatcher = standaloneMethodPattern.matcher(userCode);
        while (standaloneMatcher.find()) {
            var fullCall = standaloneMatcher.group(0);
            // Only add if it's not already added (avoid duplicates)
            if (!methodCalls.contains(fullCall)) {
                methodCalls.add(fullCall);
            }
        }
        
        return methodCalls;
    }
}

