package com.posadskiy.swingteacherdesktop.presentation.controller;

import com.posadskiy.swingteacherdesktop.application.service.AuthenticationService;
import com.posadskiy.swingteacherdesktop.application.service.CodeCompletionService;
import com.posadskiy.swingteacherdesktop.application.service.LessonService;
import com.posadskiy.swingteacherdesktop.application.service.TaskCheckingService;
import com.posadskiy.swingteacherdesktop.domain.model.CompletedTask;
import com.posadskiy.swingteacherdesktop.domain.model.Documentation;
import com.posadskiy.swingteacherdesktop.domain.model.Lesson;
import com.posadskiy.swingteacherdesktop.domain.model.Task;
import com.posadskiy.swingteacherdesktop.infrastructure.compiler.DynamicCompiler;
import lombok.extern.slf4j.Slf4j;
import org.fife.ui.autocomplete.CompletionProvider;
import org.springframework.stereotype.Component;

import javax.swing.*;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

/**
 * Controller for the main frame view.
 * Orchestrates interactions between UI and application services.
 */
@Slf4j
@Component
public class MainFrameController {

    private final LessonService lessonService;
    private final TaskCheckingService taskCheckingService;
    private final CodeCompletionService codeCompletionService;
    private final AuthenticationService authenticationService;

    public MainFrameController(
        LessonService lessonService,
        TaskCheckingService taskCheckingService,
        CodeCompletionService codeCompletionService,
        AuthenticationService authenticationService
    ) {
        this.lessonService = lessonService;
        this.taskCheckingService = taskCheckingService;
        this.codeCompletionService = codeCompletionService;
        this.authenticationService = authenticationService;
    }

    public List<Lesson> getLessonsByCategory(int categoryId) {
        return lessonService.getLessonsByCategory(categoryId);
    }

    public List<Task> getTasksByLesson(int lessonId) {
        return lessonService.getTasksByLesson(lessonId);
    }

    public Optional<Documentation> getDocumentation(int id) {
        return lessonService.getDocumentation(id);
    }

    public List<CompletedTask> getCompletedTasksByUser(int userId) {
        return lessonService.getCompletedTasksByUser(userId);
    }

    public boolean isTaskCompleted(int userId, int taskId) {
        return lessonService.isTaskCompleted(userId, taskId);
    }

    public void markTaskCompleted(int userId, int taskId) {
        lessonService.markTaskCompleted(userId, taskId);
    }

    /**
     * Compiles and runs user code for preview.
     */
    public void runUserCode(String code, String imports) {
        try {
            var errors = DynamicCompiler.compile(code, imports);

            if (errors.isEmpty()) {
                DynamicCompiler.runCompiledCode();
            } else {
                JOptionPane.showMessageDialog(
                    new JFrame(), 
                    errors, 
                    "Compilation error", 
                    JOptionPane.DEFAULT_OPTION
                );
            }
        } catch (IOException ex) {
            log.error("Failed to compile file from editor", ex);
            JOptionPane.showMessageDialog(
                new JFrame(), 
                ex.getMessage(), 
                "Compilation Error", 
                JOptionPane.DEFAULT_OPTION
            );
        } catch (ReflectiveOperationException ex) {
            log.error("Failed to run compiled class", ex);
            JOptionPane.showMessageDialog(
                new JFrame(), 
                ex.getMessage(), 
                "Runtime Error", 
                JOptionPane.DEFAULT_OPTION
            );
        }
    }

    /**
     * Compiles user code and returns errors.
     */
    public String compileUserCode(String code, String imports) {
        try {
            return DynamicCompiler.compile(code, imports);
        } catch (IOException ex) {
            log.error("Failed to compile file", ex);
            return "Compilation failed: " + ex.getMessage();
        }
    }

    /**
     * Validates user code against expected answer.
     */
    public String validateAnswer(String expectedAnswer, String userAnswer) {
        return taskCheckingService.validateCode(expectedAnswer, userAnswer);
    }

    /**
     * Creates a completion provider for the code editor.
     */
    public CompletionProvider createCompletionProvider() {
        return codeCompletionService.createCompletionProvider();
    }

    /**
     * Logs out the current user.
     */
    public void logout() {
        authenticationService.logout();
    }
}


