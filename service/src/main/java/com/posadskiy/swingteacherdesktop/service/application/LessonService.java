package com.posadskiy.swingteacherdesktop.service.application;

import com.posadskiy.swingteacherdesktop.domain.dto.LessonDto;
import com.posadskiy.swingteacherdesktop.service.domain.mapper.DtoMapper;
import com.posadskiy.swingteacherdesktop.service.infrastructure.jpa.LessonRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LessonService {
    private final LessonRepository lessonRepository;
    private final TranslationService translationService;

    public LessonService(LessonRepository lessonRepository, TranslationService translationService) {
        this.lessonRepository = lessonRepository;
        this.translationService = translationService;
    }

    public List<LessonDto> getAll() {
        return getAll("en");
    }

    public List<LessonDto> getAll(String languageCode) {
        String lang = languageCode != null ? languageCode : "en";
        return lessonRepository.findAllWithTasks()
            .stream()
            .map(lesson -> {
                String translatedName = translationService.getLessonName(
                    lesson.getId(), lang
                );
                return DtoMapper.toDto(
                    lesson,
                    lang,
                    translatedName,
                    task -> {
                        String taskTitle = translationService.getTaskTitle(task.getId(), lang);
                        String taskQuestion = translationService.getTaskQuestion(task.getId(), lang);
                        return DtoMapper.toDto(task, lang, taskTitle, taskQuestion);
                    }
                );
            })
            .toList();
    }

    public List<LessonDto> getByCategory(Long categoryId) {
        return getByCategory(categoryId, "en");
    }

    public List<LessonDto> getByCategory(Long categoryId, String languageCode) {
        String lang = languageCode != null ? languageCode : "en";
        if (categoryId == null) {
            return getAll(lang);
        }
        return lessonRepository.findByTaskCategoryIdWithTasks(categoryId)
            .stream()
            .map(lesson -> {
                String translatedName = translationService.getLessonName(
                    lesson.getId(), lang
                );
                return DtoMapper.toDto(
                    lesson,
                    lang,
                    translatedName,
                    task -> {
                        String taskTitle = translationService.getTaskTitle(task.getId(), lang);
                        String taskQuestion = translationService.getTaskQuestion(task.getId(), lang);
                        return DtoMapper.toDto(task, lang, taskTitle, taskQuestion);
                    }
                );
            })
            .toList();
    }

    public java.util.Optional<LessonDto> getById(Long id) {
        return getById(id, "en");
    }

    public java.util.Optional<LessonDto> getById(Long id, String languageCode) {
        String lang = languageCode != null ? languageCode : "en";
        return lessonRepository.findByIdWithTasks(id)
            .map(lesson -> {
                String translatedName = translationService.getLessonName(
                    lesson.getId(), lang
                );
                return DtoMapper.toDto(
                    lesson,
                    lang,
                    translatedName,
                    task -> {
                        String taskTitle = translationService.getTaskTitle(task.getId(), lang);
                        String taskQuestion = translationService.getTaskQuestion(task.getId(), lang);
                        return DtoMapper.toDto(task, lang, taskTitle, taskQuestion);
                    }
                );
            });
    }
}

