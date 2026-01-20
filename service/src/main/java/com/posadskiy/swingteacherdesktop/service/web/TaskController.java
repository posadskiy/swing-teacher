package com.posadskiy.swingteacherdesktop.service.web;

import com.posadskiy.swingteacherdesktop.domain.dto.TaskDto;
import com.posadskiy.swingteacherdesktop.service.application.TaskService;
import com.posadskiy.swingteacherdesktop.service.infrastructure.client.UserServiceClient;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/tasks")
public class TaskController {
    private final TaskService taskService;
    private final UserServiceClient userServiceClient;

    public TaskController(TaskService taskService, UserServiceClient userServiceClient) {
        this.taskService = taskService;
        this.userServiceClient = userServiceClient;
    }

    @GetMapping
    public List<TaskDto> getTasks(
        @RequestParam(name = "lessonId", required = false) Long lessonId,
        @RequestParam(name = "lang", required = false) String languageCode,
        Authentication authentication,
        HttpServletRequest request) {
        String lang = determineLanguage(languageCode, authentication, request);
        return taskService.getByLesson(lessonId, lang);
    }

    @GetMapping("/{id}")
    public ResponseEntity<TaskDto> getTask(
        @PathVariable("id") Long id,
        @RequestParam(name = "lang", required = false) String languageCode,
        Authentication authentication,
        HttpServletRequest request) {
        String lang = determineLanguage(languageCode, authentication, request);
        return taskService.getById(id, lang)
            .map(ResponseEntity::ok)
            .orElseGet(() -> ResponseEntity.notFound().build());
    }

    private String determineLanguage(
        String languageCode, Authentication authentication, HttpServletRequest request) {
        if (languageCode != null && !languageCode.isBlank()) {
            return languageCode;
        }

        if (authentication != null && authentication.getPrincipal() != null) {
            try {
                Long userId = Long.parseLong(authentication.getPrincipal().toString());
                String token = extractToken(request);
                return userServiceClient.getPreferredLanguage(userId, token).orElse("en");
            } catch (NumberFormatException e) {
                // Fall through to default
            }
        }

        return "en";
    }

    private String extractToken(HttpServletRequest request) {
        String authHeader = request.getHeader("Authorization");
        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            return authHeader.substring(7);
        }
        return null;
    }
}

