package com.posadskiy.swingteacherdesktop.service.domain.mapper;

import com.posadskiy.swingteacherdesktop.domain.dto.*;
import com.posadskiy.swingteacherdesktop.service.domain.entity.*;

import java.util.List;
import java.util.function.Function;

public final class DtoMapper {
    private DtoMapper() {
    }

    public static UserDto toDto(UserEntity entity) {
        return new UserDto(
            entity.getId(),
            entity.getEmail(),
            entity.getLogin(),
            entity.getLogins(),
            entity.getLastLogin(),
            entity.getCompleteTraining(),
            entity.getPreferredLanguage()
        );
    }

    public static LessonDto toDto(LessonEntity entity) {
        return toDto(entity, "en");
    }

    public static LessonDto toDto(LessonEntity entity, String languageCode) {
        return toDto(entity, languageCode, null, null);
    }

    public static LessonDto toDto(
        LessonEntity entity,
        String languageCode,
        String lessonName,
        Function<TaskEntity, TaskDto> taskMapper
    ) {
        List<TaskDto> tasks = entity.getTasks() != null
            ? entity.getTasks().stream()
            .map(task -> taskMapper != null ? taskMapper.apply(task) : toDto(task, languageCode))
                .toList()
            : List.of();
        
        return new LessonDto(
            entity.getId(),
            lessonName,
            entity.getTaskCategoryId(),
            tasks
        );
    }

    public static TaskDto toDto(TaskEntity entity) {
        return toDto(entity, "en");
    }

    public static TaskDto toDto(TaskEntity entity, String languageCode) {
        return toDto(entity, languageCode, null, null);
    }

    public static TaskDto toDto(
        TaskEntity entity,
        String languageCode,
        String title,
        String question
    ) {
        return new TaskDto(
            entity.getId(),
            entity.getLessonId(),
            entity.getTaskNumber(),
            title,
            question,
            entity.getAnswer(),
            entity.getImports(),
            entity.getSolution(),
            entity.getDocumentationId(),
            entity.getDifficult(),
            entity.getRating()
        );
    }

    public static KeywordDto toDto(KeywordEntity entity) {
        return new KeywordDto(entity.getId(), entity.getKeywordText());
    }

    public static ShorthandDto toDto(ShorthandEntity entity) {
        return new ShorthandDto(entity.getId(), entity.getShortText(), entity.getFullText());
    }

    public static DocumentationDto toDto(DocumentationEntity entity) {
        return new DocumentationDto(entity.getId(), entity.getText());
    }

    public static ErrorDto toDto(ErrorEntryEntity entity) {
        return new ErrorDto(entity.getId(), entity.getErrorText());
    }

    public static CompletedTaskDto toDto(CompletedTaskEntity entity) {
        return new CompletedTaskDto(entity.getId(), entity.getUserId(), entity.getTaskId());
    }

    public static TaskCategoryDto toDto(TaskCategoryEntity entity) {
        return new TaskCategoryDto(entity.getId(), entity.getName());
    }
}

