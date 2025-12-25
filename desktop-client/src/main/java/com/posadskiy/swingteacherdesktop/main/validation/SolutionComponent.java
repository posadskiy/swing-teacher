package com.posadskiy.swingteacherdesktop.main.validation;

import java.util.Arrays;
import java.util.List;

/**
 * Represents a component definition from the expected solution.
 * Example: "JButton-setText,add" -> className="JButton", requiredMethods=["setText", "add"]
 */
public record SolutionComponent(String className, List<String> requiredMethods) {
    
    public static SolutionComponent parse(String componentString) {
        if (componentString == null || componentString.trim().isEmpty()) {
            throw new IllegalArgumentException("Component string cannot be null or empty");
        }
        
        String[] parts = componentString.split("-", 2);
        String className = parts[0].trim();
        
        List<String> methods = parts.length > 1 && !parts[1].trim().isEmpty()
            ? Arrays.stream(parts[1].split(","))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .toList()
            : List.of();
        
        return new SolutionComponent(className, methods);
    }
    
    public boolean hasRequiredMethods() {
        return !requiredMethods.isEmpty();
    }
}

