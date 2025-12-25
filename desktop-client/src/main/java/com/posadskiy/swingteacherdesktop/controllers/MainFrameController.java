package com.posadskiy.swingteacherdesktop.controllers;

import com.posadskiy.swingteacherdesktop.dao.*;
import com.posadskiy.swingteacherdesktop.main.Checker;
import com.posadskiy.swingteacherdesktop.tables.*;
import com.posadskiy.swingteacherdesktop.tables.Error;
import com.posadskiy.swingteacherdesktop.utils.CheckerResult;
import com.posadskiy.swingteacherdesktop.utils.FileUtils;
import lombok.extern.slf4j.Slf4j;
import org.fife.ui.autocomplete.BasicCompletion;
import org.fife.ui.autocomplete.CompletionProvider;
import org.fife.ui.autocomplete.DefaultCompletionProvider;
import org.fife.ui.autocomplete.ShorthandCompletion;
import org.springframework.stereotype.Component;

import javax.swing.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * Controller for main frame using modern Java patterns.
 */
@Slf4j
@Component
public class MainFrameController {

    private final TaskDao taskDao;
    private final LessonDao lessonDao;
    private final ShorthandDao shorthandDao;
    private final DocumentationDao documentationDao;
    private final CompletedTaskDao completedTaskDao;
    private final ErrorDao errorDao;
    private final KeywordDao keywordDao;
    private final Checker checker;

    public MainFrameController(
        TaskDao taskDao,
        LessonDao lessonDao,
        ShorthandDao shorthandDao,
        DocumentationDao documentationDao,
        CompletedTaskDao completedTaskDao,
        ErrorDao errorDao,
        KeywordDao keywordDao,
        Checker checker
    ) {
        this.taskDao = taskDao;
        this.lessonDao = lessonDao;
        this.shorthandDao = shorthandDao;
        this.documentationDao = documentationDao;
        this.completedTaskDao = completedTaskDao;
        this.errorDao = errorDao;
        this.keywordDao = keywordDao;
        this.checker = checker;
    }

    public List<Lesson> getLessonByCategory(int taskCategory) {
        try {
            return lessonDao.getLessonsByCategory(taskCategory);
        } catch (SQLException ex) {
            log.error("Failed to get lessons by category {}", taskCategory, ex);
            return List.of();
        }
    }

    public List<Task> getTasksByLesson(int lesson) {
        try {
            return taskDao.getTasksByLesson(lesson);
        } catch (SQLException ex) {
            log.error("Failed to get tasks by lesson {}", lesson, ex);
            return List.of();
        }
    }

    public CompletedTask getCompletedTaskByUserIdByTaskId(int userId, int taskId) {
        try {
            return completedTaskDao.getCompletedTaskByUserIdByTaskId(userId, taskId);
        } catch (SQLException ex) {
            log.error("Failed to get completed task by userId={} taskId={}", userId, taskId, ex);
            return null;
        }
    }

    public List<CompletedTask> getCompletedTaskByUserId(int id) {
        try {
            return completedTaskDao.getCompletedTaskByUserId(id);
        } catch (SQLException ex) {
            log.error("Failed to get completed tasks by userId={}", id, ex);
            return List.of();
        }
    }

    public void addCompletedTask(CompletedTask completedTask) {
        try {
            completedTaskDao.addCompletedTask(completedTask);
        } catch (SQLException ex) {
            log.error("Failed to add completedTask={}", completedTask, ex);
        }
    }

    public Documentation getDocumentation(int id) {
        try {
            return documentationDao.getDocumentation(id);
        } catch (SQLException ex) {
            log.error("Failed to get documentation id={}", id, ex);
            return null;
        }
    }

    public Error getError(int id) {
        try {
            return errorDao.getError(id);
        } catch (SQLException ex) {
            log.error("Failed to get error id={}", id, ex);
            return null;
        }
    }

    public void loadAndRunClassFromFile(String operators, String imports) {
        try {
            var problems = FileUtils.isCompileFile(operators, imports);

            if (problems.isEmpty()) {
                FileUtils.runFile();
            } else {
                JOptionPane.showMessageDialog(new JFrame(), problems, "Compilation error", JOptionPane.DEFAULT_OPTION);
            }
        } catch (IOException ex) {
            log.error("Failed to compile file from editor", ex);
            JOptionPane.showMessageDialog(new JFrame(), ex.getMessage(), "Compilation Error", JOptionPane.DEFAULT_OPTION);
        } catch (ReflectiveOperationException ex) {
            log.error("Failed to run compiled class", ex);
            JOptionPane.showMessageDialog(new JFrame(), ex.getMessage(), "Runtime Error", JOptionPane.DEFAULT_OPTION);
        }
    }

    public String isFileCompile(String operators, String imports) {
        try {
            return FileUtils.isCompileFile(operators, imports);
        } catch (IOException ex) {
            log.error("Failed to compile file", ex);
            return "Compilation failed: " + ex.getMessage();
        }
    }

    public String check(String rightAnswer, String userAnswer) {
        var checkerResults = checker.check(rightAnswer, userAnswer);
        
        return checkerResults.stream()
            .filter(result -> result.errorCode() != 0)
            .map(result -> {
                var errorText = Optional.ofNullable(getError(result.errorCode()))
                    .map(Error::errorText)
                    .orElse("Unknown error");
                return "Error in component %s. %s".formatted(result.className(), errorText);
            })
            .collect(Collectors.joining("\n"));
    }

    public List<Keyword> getKeywords() {
        try {
            return keywordDao.getAllKeywords();
        } catch (SQLException ex) {
            log.error("Failed to load keywords", ex);
            return List.of();
        }
    }

    public List<Shorthand> getShorthand() {
        try {
            return shorthandDao.getAllShorthands();
        } catch (SQLException ex) {
            log.error("Failed to load shorthands", ex);
            return List.of();
        }
    }

    public CompletionProvider createCompletionProvider() {
        var provider = new DefaultCompletionProvider();

        // Add keyword completions
        getKeywords().stream()
            .map(Keyword::keywordText)
            .map(text -> new BasicCompletion(provider, text))
            .forEach(provider::addCompletion);

        // Add shorthand completions
        getShorthand().stream()
            .map(s -> new ShorthandCompletion(provider, s.shortText(), s.fullText(), s.fullText()))
            .forEach(provider::addCompletion);

        return provider;
    }
}
