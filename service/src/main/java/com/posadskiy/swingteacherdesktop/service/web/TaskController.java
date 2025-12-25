package com.posadskiy.swingteacherdesktop.service.web;

import com.posadskiy.swingteacherdesktop.domain.dto.TaskDto;
import com.posadskiy.swingteacherdesktop.service.application.TaskService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/tasks")
public class TaskController {
    private final TaskService taskService;

    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }

    @GetMapping
    public List<TaskDto> getTasks(@RequestParam(name = "lessonId", required = false) Long lessonId) {
        return taskService.getByLesson(lessonId);
    }

    @GetMapping("/{id}")
    public ResponseEntity<TaskDto> getTask(@PathVariable("id") Long id) {
        return taskService.getById(id)
            .map(ResponseEntity::ok)
            .orElseGet(() -> ResponseEntity.notFound().build());
    }
}

