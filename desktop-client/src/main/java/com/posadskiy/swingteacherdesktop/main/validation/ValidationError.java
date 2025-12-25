package com.posadskiy.swingteacherdesktop.main.validation;

/**
 * Represents a validation error with error code.
 * Error codes:
 * 0 = Success
 * 1 = Wrong method or incorrect implementation
 * 2 = Missing required method
 * 3 = Missing component constructor
 */
public record ValidationError(String componentName, int errorCode) {
    
    public static ValidationError success(String componentName) {
        return new ValidationError(componentName, 0);
    }
    
    public static ValidationError wrongMethod(String componentName) {
        return new ValidationError(componentName, 1);
    }
    
    public static ValidationError missingMethod(String componentName) {
        return new ValidationError(componentName, 2);
    }
    
    public static ValidationError missingConstructor(String componentName) {
        return new ValidationError(componentName, 3);
    }
    
    public boolean isSuccess() {
        return errorCode == 0;
    }
}

