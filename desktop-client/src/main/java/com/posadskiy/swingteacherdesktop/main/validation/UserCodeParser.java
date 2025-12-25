package com.posadskiy.swingteacherdesktop.main.validation;

import com.posadskiy.swingteacherdesktop.utils.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Parses user code to extract components and their method calls.
 */
public final class UserCodeParser {
    
    private UserCodeParser() {
        // Utility class - prevent instantiation
    }
    
    /**
     * Extracts components from user code and maps them by class name.
     * Returns a map: className -> UserComponent
     */
    public static Map<String, UserComponent> extractComponents(
            List<String> expectedClassNames, 
            String userCode) {
        
        Map<String, UserComponent> components = new HashMap<>();
        
        for (String className : expectedClassNames) {
            UserComponent component = extractComponent(className, userCode);
            if (component != null) {
                components.put(className, component);
            }
        }
        
        return components;
    }
    
    /**
     * Extracts a single component from user code.
     */
    private static UserComponent extractComponent(String className, String userCode) {
        // Remove single-line comments (// ...)
        String codeWithoutComments = userCode.replaceAll("//.*", "");
        
        // Find constructor: "JButton button = new JButton();"
        Pattern constructorPattern = Pattern.compile(
            "(?s)\\b" + Pattern.quote(className) + "\\s+([\\S]+)\\s*=\\s*new\\s+"
                + Pattern.quote(className) + "\\s*\\([\\s\\S]*?\\)\\s*;"
        );
        
        Matcher matcher = constructorPattern.matcher(codeWithoutComments);
        if (!matcher.find()) {
            return null;
        }
        
        String variableName = matcher.group(1);
        UserComponent component = new UserComponent(className, variableName);
        
        // Remove constructor from code to process remaining methods
        String codeWithoutConstructor = matcher.replaceFirst("");
        
        // Extract method calls
        extractMethodCalls(component, codeWithoutConstructor);
        
        return component;
    }
    
    /**
     * Extracts method calls for a component from the remaining code.
     */
    private static void extractMethodCalls(UserComponent component, String code) {
        String[] operators = code.split(";");
        
        for (String operator : operators) {
            String cleanedOperator = StringUtils.removeSpace(operator);
            if (cleanedOperator == null || cleanedOperator.trim().isEmpty()) {
                continue;
            }
            
            // Check if this operator is related to our component
            if (MethodMatcher.isComponentMethod(component.variableName(), cleanedOperator) ||
                MethodMatcher.isAddCall(component.variableName(), cleanedOperator)) {
                
                String methodCall = MethodMatcher.extractMethod(component.variableName(), cleanedOperator);
                if (methodCall != null) {
                    component.addMethodCall(methodCall);
                }
            }
        }
    }
}
