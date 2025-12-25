package com.posadskiy.swingteacherdesktop.domain.checker.validation;

import java.util.Arrays;
import java.util.List;

/**
 * Represents an expected component in the solution.
 * Format: "JButton-setText,add" means JButton with methods setText and add
 */
public record SolutionComponent(String className, List<String> expectedMethods) {
    
    /**
     * Parses a component definition like "JButton-setText,add"
     */
    public static SolutionComponent parse(String definition) {
        if (definition == null || definition.isBlank()) {
            return new SolutionComponent("", List.of());
        }
        
        var parts = definition.split("-", 2);
        var className = parts[0].trim();
        
        if (parts.length < 2 || parts[1].isBlank()) {
            return new SolutionComponent(className, List.of());
        }
        
        var methods = Arrays.stream(parts[1].split(","))
            .map(String::trim)
            .filter(s -> !s.isEmpty())
            .toList();
        
        return new SolutionComponent(className, methods);
    }
    
    public boolean hasExpectedMethods() {
        return expectedMethods != null && !expectedMethods.isEmpty();
    }
}


