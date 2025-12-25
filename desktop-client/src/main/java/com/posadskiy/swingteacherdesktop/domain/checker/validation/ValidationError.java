package com.posadskiy.swingteacherdesktop.domain.checker.validation;

/**
 * Represents a validation error.
 */
public record ValidationError(String componentName, int errorCode, String message) {
    
    public static final int SUCCESS = 0;
    public static final int WRONG_METHOD = 1;
    public static final int MISSING_METHOD = 2;
    public static final int MISSING_CONSTRUCTOR = 3;
    
    public static ValidationError success(String componentName) {
        return new ValidationError(componentName, SUCCESS, "Validation passed");
    }
    
    public static ValidationError wrongMethod(String componentName, String details) {
        return new ValidationError(componentName, WRONG_METHOD, details);
    }
    
    public static ValidationError missingMethod(String componentName, String details) {
        return new ValidationError(componentName, MISSING_METHOD, details);
    }
    
    public static ValidationError missingConstructor(String componentName) {
        return new ValidationError(componentName, MISSING_CONSTRUCTOR, 
            "Missing constructor for " + componentName);
    }
    
    public boolean isSuccess() {
        return errorCode == SUCCESS;
    }
}

