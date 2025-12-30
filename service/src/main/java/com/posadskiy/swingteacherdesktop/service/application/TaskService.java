package com.posadskiy.swingteacherdesktop.service.application;

import com.posadskiy.swingteacherdesktop.domain.dto.TaskDto;
import com.posadskiy.swingteacherdesktop.service.domain.mapper.DtoMapper;
import com.posadskiy.swingteacherdesktop.service.infrastructure.jpa.TaskRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskService {
    private final TaskRepository taskRepository;
    private final TranslationService translationService;

    public TaskService(TaskRepository taskRepository, TranslationService translationService) {
        this.taskRepository = taskRepository;
        this.translationService = translationService;
    }

    public List<TaskDto> getAll() {
        return getAll("en");
    }

    public List<TaskDto> getAll(String languageCode) {
        String lang = languageCode != null ? languageCode : "en";
        return taskRepository.findAll()
            .stream()
            .map(task -> {
                String translatedTitle = translationService.getTaskTitle(task.getId(), lang);
                String translatedQuestion = translationService.getTaskQuestion(task.getId(), lang);
                return DtoMapper.toDto(task, lang, translatedTitle, translatedQuestion);
            })
            .toList();
    }

    public List<TaskDto> getByLesson(Long lessonId) {
        return getByLesson(lessonId, "en");
    }

    public List<TaskDto> getByLesson(Long lessonId, String languageCode) {
        String lang = languageCode != null ? languageCode : "en";
        if (lessonId == null) {
            return getAll(lang);
        }
        return taskRepository.findByLessonId(lessonId)
            .stream()
            .map(task -> {
                String translatedTitle = translationService.getTaskTitle(task.getId(), lang);
                String translatedQuestion = translationService.getTaskQuestion(task.getId(), lang);
                return DtoMapper.toDto(task, lang, translatedTitle, translatedQuestion);
            })
            .toList();
    }

    public java.util.Optional<TaskDto> getById(Long id) {
        return getById(id, "en");
    }

    public java.util.Optional<TaskDto> getById(Long id, String languageCode) {
        String lang = languageCode != null ? languageCode : "en";
        return taskRepository.findById(id)
            .map(task -> {
                String translatedTitle = translationService.getTaskTitle(task.getId(), lang);
                String translatedQuestion = translationService.getTaskQuestion(task.getId(), lang);
                return DtoMapper.toDto(task, lang, translatedTitle, translatedQuestion);
            });
    }
}

