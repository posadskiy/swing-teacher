package com.posadskiy.swingteacherdesktop.domain.checker.validation;

import java.util.List;

/**
 * Represents a component found in user's code.
 */
public record UserComponent(String className, String variableName, List<String> methodCalls) {
    
    public boolean hasMethodCalls() {
        return methodCalls != null && !methodCalls.isEmpty();
    }
    
    public boolean hasConstructor() {
        return variableName != null && !variableName.isBlank();
    }
    
    public static UserComponent empty(String className) {
        return new UserComponent(className, null, List.of());
    }
}


