package com.posadskiy.swingteacherdesktop.domain.checker.validation;

import java.util.Arrays;
import java.util.List;

/**
 * Parses the expected solution format.
 * Format: "JButton-setText,add;JLabel-add"
 */
public final class SolutionParser {
    
    private SolutionParser() {
        // Utility class - prevent instantiation
    }
    
    /**
     * Parses the solution string into a list of SolutionComponent objects.
     */
    public static List<SolutionComponent> parse(String solutionString) {
        if (solutionString == null || solutionString.trim().isEmpty()) {
            return List.of();
        }
        
        return Arrays.stream(solutionString.split(";"))
            .map(String::trim)
            .filter(s -> !s.isEmpty())
            .map(SolutionComponent::parse)
            .toList();
    }
}

