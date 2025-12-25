package com.posadskiy.swingteacherdesktop.service.application;

import com.posadskiy.swingteacherdesktop.domain.dto.TaskDto;
import com.posadskiy.swingteacherdesktop.service.domain.mapper.DtoMapper;
import com.posadskiy.swingteacherdesktop.service.infrastructure.jpa.TaskRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskService {
    private final TaskRepository taskRepository;

    public TaskService(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    public List<TaskDto> getAll() {
        return taskRepository.findAll()
            .stream()
            .map(DtoMapper::toDto)
            .toList();
    }

    public List<TaskDto> getByLesson(Long lessonId) {
        if (lessonId == null) {
            return getAll();
        }
        return taskRepository.findByLessonId(lessonId)
            .stream()
            .map(DtoMapper::toDto)
            .toList();
    }

    public java.util.Optional<TaskDto> getById(Long id) {
        return taskRepository.findById(id)
            .map(DtoMapper::toDto);
    }
}

