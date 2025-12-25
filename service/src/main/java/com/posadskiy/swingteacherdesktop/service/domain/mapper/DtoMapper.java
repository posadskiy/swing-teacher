package com.posadskiy.swingteacherdesktop.service.domain.mapper;

import com.posadskiy.swingteacherdesktop.domain.dto.*;
import com.posadskiy.swingteacherdesktop.service.domain.entity.*;

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
            entity.getCompleteTraining()
        );
    }

    public static LessonDto toDto(LessonEntity entity) {
        return new LessonDto(
            entity.getId(),
            entity.getLessonNumber(),
            entity.getLessonName(),
            entity.getTaskCategoryId()
        );
    }

    public static TaskDto toDto(TaskEntity entity) {
        return new TaskDto(
            entity.getId(),
            entity.getLessonId(),
            entity.getTaskNumber(),
            entity.getTitle(),
            entity.getQuestion(),
            entity.getAnswer(),
            entity.getImports(),
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

