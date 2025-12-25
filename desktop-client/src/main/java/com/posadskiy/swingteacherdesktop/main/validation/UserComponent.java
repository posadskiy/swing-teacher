package com.posadskiy.swingteacherdesktop.main.validation;

import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * Represents a component found in user code with its variable name and method calls.
 * Uses record-style accessor naming for consistency.
 */
@RequiredArgsConstructor
public final class UserComponent {
    
    private final String className;
    private final String variableName;
    private final List<String> methodCalls = new ArrayList<>();
    
    public String className() {
        return className;
    }
    
    public String variableName() {
        return variableName;
    }
    
    public List<String> methodCalls() {
        return List.copyOf(methodCalls);
    }
    
    public void addMethodCall(String methodCall) {
        if (methodCall != null && !methodCall.trim().isEmpty()) {
            methodCalls.add(methodCall);
        }
    }
    
    public boolean hasMethodCalls() {
        return !methodCalls.isEmpty();
    }
    
    public String getMethodCallsAsString() {
        return String.join(";", methodCalls) + (methodCalls.isEmpty() ? "" : ";");
    }
}
