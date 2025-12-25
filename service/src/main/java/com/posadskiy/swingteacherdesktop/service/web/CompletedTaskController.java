package com.posadskiy.swingteacherdesktop.service.web;

import com.posadskiy.swingteacherdesktop.domain.dto.CompletedTaskDto;
import com.posadskiy.swingteacherdesktop.domain.request.CompletedTaskRequest;
import com.posadskiy.swingteacherdesktop.service.application.CompletedTaskService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/completed-tasks")
public class CompletedTaskController {
    private final CompletedTaskService completedTaskService;

    public CompletedTaskController(CompletedTaskService completedTaskService) {
        this.completedTaskService = completedTaskService;
    }

    @GetMapping
    public List<CompletedTaskDto> byUser(@RequestParam("userId") Long userId) {
        return completedTaskService.findByUser(userId);
    }

    @GetMapping("/{userId}/{taskId}")
    public ResponseEntity<CompletedTaskDto> byUserAndTask(
        @PathVariable("userId") Long userId,
        @PathVariable("taskId") Long taskId
    ) {
        return completedTaskService.findByUserAndTask(userId, taskId)
            .map(ResponseEntity::ok)
            .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public CompletedTaskDto create(@Valid @RequestBody CompletedTaskRequest request) {
        return completedTaskService.create(request);
    }
}

