package com.posadskiy.swingteacherdesktop.dao.rest;

import com.posadskiy.swingteacherdesktop.domain.dto.*;
import com.posadskiy.swingteacherdesktop.tables.*;
import com.posadskiy.swingteacherdesktop.tables.Error;

import java.util.List;
import java.util.Optional;

/**
 * Modern DTO mapper using Optional and functional patterns.
 */
final class RestDtoMapper {
    
    private RestDtoMapper() {
        // Utility class
    }
    
    static User toUser(UserDto dto) {
        return Optional.ofNullable(dto)
            .map(d -> User.builder()
                .id(toInt(d.id()))
                .email(d.email())
                .login(d.login())
                .logins(d.logins())
                .lastLogin(d.lastLogin())
                .completeTraining(d.completeTraining())
                .build())
            .orElse(null);
    }
    
    static Optional<User> toUserOptional(UserDto dto) {
        return Optional.ofNullable(toUser(dto));
    }
    
    static Lesson toLesson(LessonDto dto) {
        return Optional.ofNullable(dto)
            .map(d -> {
                var tasks = Optional.ofNullable(d.tasks())
                    .map(t -> t.stream().map(RestDtoMapper::toTask).toList())
                    .orElse(List.of());
                    
                return Lesson.builder()
                    .id(toInt(d.id()))
                    .lessonNumber(d.lessonNumber())
                    .lessonName(d.lessonName())
                    .idTaskCategory(toInt(d.taskCategoryId()))
                    .tasks(tasks)
                    .build();
            })
            .orElse(null);
    }
    
    static Task toTask(TaskDto dto) {
        return Optional.ofNullable(dto)
            .map(d -> Task.builder()
                .id(toInt(d.id()))
                .idLesson(toInt(d.lessonId()))
                .taskNumber(d.taskNumber())
                .title(d.title())
                .question(d.question())
                .answer(d.answer())
                .imports(d.imports())
                .idDocumentation(toInt(d.documentationId()))
                .difficult(d.difficult())
                .rating(d.rating())
                .build())
            .orElse(null);
    }
    
    static Keyword toKeyword(KeywordDto dto) {
        return Optional.ofNullable(dto)
            .map(d -> Keyword.of(toInt(d.id()), d.keywordText()))
            .orElse(null);
    }
    
    static Shorthand toShorthand(ShorthandDto dto) {
        return Optional.ofNullable(dto)
            .map(d -> Shorthand.of(toInt(d.id()), d.shortText(), d.fullText()))
            .orElse(null);
    }
    
    static Documentation toDocumentation(DocumentationDto dto) {
        return Optional.ofNullable(dto)
            .map(d -> Documentation.of(toInt(d.id()), d.text()))
            .orElse(null);
    }
    
    static Error toError(ErrorDto dto) {
        return Optional.ofNullable(dto)
            .map(d -> Error.of(toInt(d.id()), d.errorText()))
            .orElse(null);
    }
    
    static CompletedTask toCompletedTask(CompletedTaskDto dto) {
        return Optional.ofNullable(dto)
            .map(d -> CompletedTask.of(toInt(d.id()), toInt(d.userId()), toInt(d.taskId())))
            .orElse(null);
    }
    
    static TaskCategory toTaskCategory(TaskCategoryDto dto) {
        return Optional.ofNullable(dto)
            .map(d -> TaskCategory.of(toInt(d.id()), d.name()))
            .orElse(null);
    }
    
    private static Integer toInt(Long value) {
        return Optional.ofNullable(value)
            .map(Math::toIntExact)
            .orElse(null);
    }
}
