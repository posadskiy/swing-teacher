package com.posadskiy.swingteacherdesktop.main.validation;

import com.posadskiy.swingteacherdesktop.utils.StringUtils;

import java.util.List;

/**
 * Validates a user component against the expected solution component.
 */
public final class ComponentValidator {
    
    private ComponentValidator() {
        // Utility class - prevent instantiation
    }
    
    /**
     * Validates a user component against the expected solution.
     */
    public static ValidationError validate(SolutionComponent expected, UserComponent actual) {
        // Check if component exists
        if (actual == null) {
            return ValidationError.missingConstructor(expected.className());
        }
        
        // If no methods required, just check that component exists
        if (!expected.hasRequiredMethods()) {
            return actual.hasMethodCalls()
                ? ValidationError.wrongMethod(expected.className())
                : ValidationError.success(expected.className());
        }
        
        // Check if user has any methods
        if (!actual.hasMethodCalls()) {
            return ValidationError.missingMethod(expected.className());
        }
        
        // Validate required methods
        return validateMethods(expected.requiredMethods(), actual.getMethodCallsAsString(), expected.className());
    }
    
    /**
     * Validates that all required methods are present in user code.
     */
    private static ValidationError validateMethods(List<String> requiredMethods, String userMethodsString, String componentName) {
        String cleanedUserMethods = StringUtils.removeSpace(userMethodsString);
        String[] userMethods = cleanedUserMethods.split(";");
        
        // Filter out empty strings
        List<String> validUserMethods = java.util.Arrays.stream(userMethods)
            .filter(s -> s != null && !s.trim().isEmpty())
            .toList();
        
        // Check if all required methods are present
        boolean[] foundMethods = new boolean[requiredMethods.size()];
        boolean hasWrongMethods = false;
        boolean hasAnyMatch = false;
        
        for (String userMethod : validUserMethods) {
            boolean matchesAny = false;
            for (int i = 0; i < requiredMethods.size(); i++) {
                if (MethodMatcher.matches(requiredMethods.get(i), userMethod)) {
                    foundMethods[i] = true;
                    matchesAny = true;
                    hasAnyMatch = true;
                    break;
                }
            }
            if (!matchesAny) {
                hasWrongMethods = true;
            }
        }
        
        // Check if all required methods were found
        for (boolean found : foundMethods) {
            if (!found) {
                // If user has some methods but not all required ones, and has wrong methods,
                // it's more likely a wrong method issue (error 1) than missing (error 2)
                if (hasAnyMatch && hasWrongMethods) {
                    return ValidationError.wrongMethod(componentName);
                }
                return ValidationError.missingMethod(componentName);
            }
        }
        
        // All required methods found - extra methods are allowed, don't fail for them
        return ValidationError.success(componentName);
    }
}
