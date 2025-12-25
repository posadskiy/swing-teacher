package com.posadskiy.swingteacherdesktop.application.service;

import com.posadskiy.swingteacherdesktop.domain.checker.CheckerResult;
import com.posadskiy.swingteacherdesktop.domain.checker.CodeChecker;
import com.posadskiy.swingteacherdesktop.domain.model.Error;
import com.posadskiy.swingteacherdesktop.domain.repository.ErrorRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * Application service for task checking operations.
 * Orchestrates code validation and error message formatting.
 */
@Slf4j
@Service
public class TaskCheckingService {
    
    private final CodeChecker codeChecker;
    private final ErrorRepository errorRepository;
    
    public TaskCheckingService(CodeChecker codeChecker, ErrorRepository errorRepository) {
        this.codeChecker = codeChecker;
        this.errorRepository = errorRepository;
    }
    
    /**
     * Validates user code against expected solution.
     * 
     * @param expectedAnswer Expected solution format
     * @param userAnswer User's submitted code
     * @return Error message string (empty if valid)
     */
    public String validateCode(String expectedAnswer, String userAnswer) {
        List<CheckerResult> checkerResults = codeChecker.check(expectedAnswer, userAnswer);
        
        return checkerResults.stream()
            .filter(CheckerResult::isError)
            .map(this::formatErrorMessage)
            .collect(Collectors.joining("\n"));
    }
    
    /**
     * Gets the raw checker results for detailed analysis.
     */
    public List<CheckerResult> checkCode(String expectedAnswer, String userAnswer) {
        return codeChecker.check(expectedAnswer, userAnswer);
    }
    
    /**
     * Validates login format.
     */
    public boolean isValidLogin(String login) {
        return codeChecker.checkLogin(login);
    }
    
    /**
     * Validates password and confirmation.
     */
    public boolean isValidPassword(String password, String passwordRepeat) {
        return codeChecker.checkPassword(password, passwordRepeat);
    }
    
    /**
     * Validates email format.
     */
    public boolean isValidEmail(String email) {
        return codeChecker.checkEMail(email);
    }
    
    private String formatErrorMessage(CheckerResult result) {
        var errorText = getErrorText(result.errorCode());
        return "Error in component %s. %s".formatted(result.className(), errorText);
    }
    
    private String getErrorText(int errorCode) {
        try {
            return errorRepository.getError(errorCode)
                .map(Error::errorText)
                .orElse("Unknown error");
        } catch (SQLException ex) {
            log.error("Failed to get error text for code: {}", errorCode, ex);
            return "Unknown error";
        }
    }
}

