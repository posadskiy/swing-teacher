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
import java.util.ArrayList;
import java.util.List;

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

    public Documentation getDocumentation(int i) {
        try {
            return documentationDao.getDocumentation(i);
        } catch (SQLException ex) {
            log.error("Failed to get documentation id={}", i, ex);
            return null;
        }
    }

    public Error getError(int i) {
        try {
            return errorDao.getError(i);
        } catch (SQLException ex) {
            log.error("Failed to get error id={}", i, ex);
            return null;
        }
    }

    public void loadAndRunClassFromFile(String operators, String imports) {
        try {
            String problems = FileUtils.isCompileFile(operators, imports);

            if (problems.isEmpty()) {
                FileUtils.runFile();
            } else {
                JOptionPane.showMessageDialog(new JFrame(), problems, "Compilation error", JOptionPane.DEFAULT_OPTION);
            }
        } catch (IOException | InstantiationException | IllegalAccessException ex) {
            log.error("Failed to compile/run file from editor", ex);
            JOptionPane.showMessageDialog(new JFrame(), ex.getMessage(), "Error", JOptionPane.DEFAULT_OPTION);
        }
    }

    public String isFileCompile(String operators, String imports) {
        String problems = "";
        try {
            problems = FileUtils.isCompileFile(operators, imports);
        } catch (IOException | InstantiationException | IllegalAccessException ex) {

        }
        return problems;

    }

    public String check(String rightAnswer, String userAnswer) {
        ArrayList<CheckerResult> checkerResults = checker.check(rightAnswer, userAnswer);
        StringBuilder errors = new StringBuilder();
        for (CheckerResult checkerResult : checkerResults) {
            if (checkerResult.getErrorCode() != 0)
                errors.append("Error in component ")
                    .append(checkerResult.getClassName())
                    .append(". ")
                    .append(getError(checkerResult.getErrorCode()).getErrorText())
                    .append("\n");
        }
        return errors.toString();
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
        DefaultCompletionProvider provider = new DefaultCompletionProvider();

        List<Keyword> keywords = getKeywords();

        for (Keyword keyword : keywords) {
            provider.addCompletion(new BasicCompletion(provider, keyword.getKeywordText()));
        }

        List<Shorthand> shorthands = getShorthand();

        for (Shorthand shorthand : shorthands) {
            provider.addCompletion(new ShorthandCompletion(provider, shorthand.getShortText(),
                shorthand.getFullText(), shorthand.getFullText()));
        }

        return provider;
    }
}
