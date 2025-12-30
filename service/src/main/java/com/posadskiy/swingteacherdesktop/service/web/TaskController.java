package com.posadskiy.swingteacherdesktop.service.web;

import com.posadskiy.swingteacherdesktop.domain.dto.TaskDto;
import com.posadskiy.swingteacherdesktop.service.application.TaskService;
import com.posadskiy.swingteacherdesktop.service.application.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/tasks")
public class TaskController {
    private final TaskService taskService;
    private final UserService userService;

    public TaskController(TaskService taskService, UserService userService) {
        this.taskService = taskService;
        this.userService = userService;
    }

    @GetMapping
    public List<TaskDto> getTasks(
        @RequestParam(name = "lessonId", required = false) Long lessonId,
        @RequestParam(name = "lang", required = false) String languageCode,
        Authentication authentication
    ) {
        String lang = determineLanguage(languageCode, authentication);
        return taskService.getByLesson(lessonId, lang);
    }

    @GetMapping("/{id}")
    public ResponseEntity<TaskDto> getTask(
        @PathVariable("id") Long id,
        @RequestParam(name = "lang", required = false) String languageCode,
        Authentication authentication
    ) {
        String lang = determineLanguage(languageCode, authentication);
        return taskService.getById(id, lang)
            .map(ResponseEntity::ok)
            .orElseGet(() -> ResponseEntity.notFound().build());
    }

    private String determineLanguage(String languageCode, Authentication authentication) {
        if (languageCode != null && !languageCode.isBlank()) {
            return languageCode;
        }

        if (authentication != null && authentication.getPrincipal() != null) {
            try {
                Long userId = Long.parseLong(authentication.getPrincipal().toString());
                return userService.getPreferredLanguage(userId).orElse("en");
            } catch (NumberFormatException e) {
                // Fall through to default
            }
        }

        return "en";
    }
}

