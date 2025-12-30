package com.posadskiy.swingteacherdesktop.application.service;

import com.posadskiy.swingteacherdesktop.api.client.LessonApiClient;
import com.posadskiy.swingteacherdesktop.api.client.TaskApiClient;
import com.posadskiy.swingteacherdesktop.domain.model.CompletedTask;
import com.posadskiy.swingteacherdesktop.domain.model.Documentation;
import com.posadskiy.swingteacherdesktop.domain.model.Lesson;
import com.posadskiy.swingteacherdesktop.domain.model.Task;
import com.posadskiy.swingteacherdesktop.domain.repository.CompletedTaskRepository;
import com.posadskiy.swingteacherdesktop.domain.repository.DocumentationRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

/**
 * Application service for lesson and task operations.
 */
@Slf4j
@Service
public class LessonService {
    
    private final CompletedTaskRepository completedTaskRepository;
    private final DocumentationRepository documentationRepository;
    private final UserService userService;
    private final LessonApiClient lessonApiClient;
    private final TaskApiClient taskApiClient;
    
    public LessonService(
        CompletedTaskRepository completedTaskRepository,
        DocumentationRepository documentationRepository,
        UserService userService,
        LessonApiClient lessonApiClient,
        TaskApiClient taskApiClient
    ) {
        this.completedTaskRepository = completedTaskRepository;
        this.documentationRepository = documentationRepository;
        this.userService = userService;
        this.lessonApiClient = lessonApiClient;
        this.taskApiClient = taskApiClient;
    }
    
    public List<Lesson> getLessonsByCategory(int categoryId) {
        return getLessonsByCategory(categoryId, null);
    }

    public List<Lesson> getLessonsByCategory(int categoryId, String languageCode) {
        try {
            String lang = languageCode != null ? languageCode : userService.getPreferredLanguage();
            return lessonApiClient.getLessonsByCategory(categoryId, lang);
        } catch (SQLException ex) {
            log.error("Failed to get lessons by category: {}", categoryId, ex);
            return List.of();
        }
    }
    
    public List<Task> getTasksByLesson(int lessonId) {
        return getTasksByLesson(lessonId, null);
    }

    public List<Task> getTasksByLesson(int lessonId, String languageCode) {
        try {
            String lang = languageCode != null ? languageCode : userService.getPreferredLanguage();
            return taskApiClient.getTasksByLesson(lessonId, lang);
        } catch (SQLException ex) {
            log.error("Failed to get tasks by lesson: {}", lessonId, ex);
            return List.of();
        }
    }
    
    public Optional<Documentation> getDocumentation(int id) {
        try {
            return documentationRepository.getDocumentation(id);
        } catch (SQLException ex) {
            log.error("Failed to get documentation: {}", id, ex);
            return Optional.empty();
        }
    }
    
    public List<CompletedTask> getCompletedTasksByUser(int userId) {
        try {
            return completedTaskRepository.getCompletedTaskByUserId(userId);
        } catch (SQLException ex) {
            log.error("Failed to get completed tasks for user: {}", userId, ex);
            return List.of();
        }
    }
    
    public Optional<CompletedTask> getCompletedTask(int userId, int taskId) {
        try {
            return completedTaskRepository.getCompletedTaskByUserIdByTaskId(userId, taskId);
        } catch (SQLException ex) {
            log.error("Failed to get completed task for user {} task {}", userId, taskId, ex);
            return Optional.empty();
        }
    }
    
    public void markTaskCompleted(int userId, int taskId) {
        try {
            var completedTask = CompletedTask.forUser(userId, taskId);
            completedTaskRepository.addCompletedTask(completedTask);
            log.debug("Task {} marked as completed for user {}", taskId, userId);
        } catch (SQLException ex) {
            log.error("Failed to mark task {} as completed for user {}", taskId, userId, ex);
        }
    }
    
    public boolean isTaskCompleted(int userId, int taskId) {
        return getCompletedTask(userId, taskId).isPresent();
    }
}




