package com.posadskiy.swingteacherdesktop.main;

import com.posadskiy.swingteacherdesktop.main.validation.*;
import com.posadskiy.swingteacherdesktop.utils.CheckerResult;
import com.posadskiy.swingteacherdesktop.utils.StringUtils;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Main checker class that validates user code against expected solutions.
 * This class orchestrates the validation process using specialized validators.
 */
@Slf4j
public final class Checker {
    
    /**
     * Validates user solution against the expected solution.
     * 
     * @param expectedSolution Expected solution format: "JButton-setText,add;JLabel-add"
     * @param userSolution User's code
     * @return List of validation results (empty if all validations pass)
     */
    public ArrayList<CheckerResult> check(String expectedSolution, String userSolution) {
        ArrayList<CheckerResult> results = new ArrayList<>();
        
        // Handle null/empty cases
        if (expectedSolution == null && userSolution == null) {
            return results;
        }
        
        if (expectedSolution == null || expectedSolution.trim().isEmpty()) {
            if (userSolution == null || userSolution.trim().isEmpty()) {
                return results;
            }
        }
        
        // Normalize inputs
        String normalizedExpected = expectedSolution != null 
            ? StringUtils.removeSpace(expectedSolution) 
            : "";
        String normalizedUser = userSolution != null 
            ? userSolution.trim() 
            : "";
        
        if (normalizedExpected.isEmpty() && normalizedUser.isEmpty()) {
            return results;
        }
        
        // Parse expected solution
        List<SolutionComponent> expectedComponents = SolutionParser.parse(normalizedExpected);
        if (expectedComponents.isEmpty()) {
            return results;
        }
        
        // Extract expected class names
        List<String> expectedClassNames = expectedComponents.stream()
            .map(SolutionComponent::className)
            .toList();
        
        // Parse user code
        Map<String, UserComponent> userComponents = UserCodeParser.extractComponents(
            expectedClassNames, 
            normalizedUser
        );
        
        // Validate each component
        for (SolutionComponent expected : expectedComponents) {
            UserComponent actual = userComponents.get(expected.className());
            ValidationError error = ComponentValidator.validate(expected, actual);
            
            if (!error.isSuccess()) {
                results.add(new CheckerResult(error.componentName(), error.errorCode()));
            }
        }
        
        return results;
    }
    
    /**
     * Validates method calls (used by checkMini).
     * 
     * @param expectedMethods Comma-separated list of expected methods: "setText,add"
     * @param userMethods Semicolon-separated list of user methods: "setText(\"Hi\");add(button);"
     * @return 0 if valid, 1 if wrong count, 2 if missing methods
     */
    public int checkMini(String expectedMethods, String userMethods) {
        if (expectedMethods == null || userMethods == null) {
            return 1;
        }
        
        String cleanedUser = StringUtils.removeSpace(userMethods);
        String[] expectedArray = expectedMethods.split(",");
        String[] userArray = cleanedUser.split(";");
        
        // Filter out empty strings
        List<String> validUserMethods = java.util.Arrays.stream(userArray)
            .filter(s -> s != null && !s.trim().isEmpty())
            .toList();
        
        // Check if all required methods are present (user can have extra methods)
        boolean[] found = new boolean[expectedArray.length];
        int foundCount = 0;
        
        for (String userMethod : validUserMethods) {
            for (int i = 0; i < expectedArray.length; i++) {
                if (MethodMatcher.matches(expectedArray[i].trim(), userMethod)) {
                    if (!found[i]) {
                        found[i] = true;
                        foundCount++;
                    }
                    break;
                }
            }
        }
        
        // Check if all required methods found
        boolean allFound = foundCount == expectedArray.length;
        
        if (!allFound) {
            // If user has fewer methods than required
            if (validUserMethods.size() < expectedArray.length) {
                // If user provided only 1 method when multiple are expected,
                // it's a count issue (error 1)
                if (validUserMethods.size() <= 1) {
                    return 1; // Wrong count - user barely tried
                }
                // If user provided 2+ methods but is still missing some,
                // and the methods they provided match required ones,
                // it's a missing method issue (error 2)
                if (foundCount >= 2) {
                    return 2; // Missing specific method
                }
                // Otherwise, it's a count issue
                return 1; // Wrong count
            }
            
            // User has enough methods but some required ones are missing
            return 2; // Missing method
        }
        
        // All required methods found - extra methods are allowed
        return 0;
    }
    
    /**
     * Helper method for pattern matching (used by checkHelper).
     */
    public boolean checkHelper(String expectedMethod, String actualCall) {
        return MethodMatcher.matches(expectedMethod, actualCall);
    }
    
    /**
     * Validates login string.
     */
    public boolean checkLogin(String login) {
        return UserInputValidators.isValidLogin(login);
    }
    
    /**
     * Validates password and password repeat.
     */
    public boolean checkPassword(String password, String passwordRepeat) {
        return UserInputValidators.isValidPassword(password, passwordRepeat);
    }
    
    /**
     * Validates email address.
     */
    public boolean checkEMail(String email) {
        return UserInputValidators.isValidEmail(email);
    }
}
