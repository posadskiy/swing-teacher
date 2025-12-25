package com.posadskiy.swingteacherdesktop.domain.checker;

/**
 * Immutable result of code validation check.
 * Error codes:
 * 0 = Success
 * 1 = Wrong method or incorrect implementation
 * 2 = Missing required method
 * 3 = Missing component constructor
 */
public record CheckerResult(String className, int errorCode) {
    
    public static CheckerResult success(String className) {
        return new CheckerResult(className, 0);
    }
    
    public static CheckerResult wrongMethod(String className) {
        return new CheckerResult(className, 1);
    }
    
    public static CheckerResult missingMethod(String className) {
        return new CheckerResult(className, 2);
    }
    
    public static CheckerResult missingConstructor(String className) {
        return new CheckerResult(className, 3);
    }
    
    public boolean isSuccess() {
        return errorCode == 0;
    }
    
    public boolean isError() {
        return errorCode != 0;
    }
    
    public String getErrorDescription() {
        return switch (errorCode) {
            case 0 -> "Success";
            case 1 -> "Wrong method or incorrect implementation";
            case 2 -> "Missing required method";
            case 3 -> "Missing component constructor";
            default -> "Unknown error (code: %d)".formatted(errorCode);
        };
    }
    
    // Compatibility getters for legacy code (tests use getClassName/getErrorCode)
    public String getClassName() { return className; }
    public int getErrorCode() { return errorCode; }
}

