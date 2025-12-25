package com.posadskiy.swingteacherdesktop.domain.checker.validation;

/**
 * Validates user components against expected solution components.
 */
public final class ComponentValidator {
    
    private ComponentValidator() {
        // Utility class - prevent instantiation
    }
    
    /**
     * Validates a user component against the expected solution component.
     * 
     * @param expected The expected solution component
     * @param actual The user's component (may be null or empty)
     * @return ValidationError with appropriate error code
     */
    public static ValidationError validate(SolutionComponent expected, UserComponent actual) {
        // Check if component exists in user code
        if (actual == null || !actual.hasConstructor()) {
            return ValidationError.missingConstructor(expected.className());
        }
        
        // If no methods are expected, component existence is sufficient
        if (!expected.hasExpectedMethods()) {
            return ValidationError.success(expected.className());
        }
        
        // Check each expected method first
        boolean allExpectedFound = true;
        for (var expectedMethod : expected.expectedMethods()) {
            boolean found = false;
            
            for (var actualCall : actual.methodCalls()) {
                if (MethodMatcher.matches(expectedMethod, actualCall)) {
                    found = true;
                    break;
                }
            }
            
            if (!found) {
                allExpectedFound = false;
                break;
            }
        }
        
        // If all expected methods are found, extra methods are allowed - return success
        if (allExpectedFound) {
            return ValidationError.success(expected.className());
        }
        
        // Some expected methods are missing - determine error type
        if (!actual.hasMethodCalls()) {
            // No method calls at all - missing method (error 2)
            return ValidationError.missingMethod(expected.className(),
                "Missing required methods");
        }
        
        // User has some method calls but missing expected ones
        // Check if user has any methods that don't match any expected method (wrong methods)
        boolean hasWrongMethod = false;
        for (var actualCall : actual.methodCalls()) {
            boolean matchesAnyExpected = false;
            for (var expectedMethod : expected.expectedMethods()) {
                if (MethodMatcher.matches(expectedMethod, actualCall)) {
                    matchesAnyExpected = true;
                    break;
                }
            }
            if (!matchesAnyExpected) {
                hasWrongMethod = true;
                break;
            }
        }
        
        // If user has wrong methods (methods that don't match any expected), return error 1
        if (hasWrongMethod) {
            return ValidationError.wrongMethod(expected.className(),
                "Wrong method or incorrect implementation");
        }
        
        // User has some expected methods but missing others - missing method (error 2)
        return ValidationError.missingMethod(expected.className(),
            "Missing required methods");
    }
}

