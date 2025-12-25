package com.posadskiy.swingteacherdesktop.dao.rest;

import com.posadskiy.swingteacherdesktop.domain.dto.*;
import com.posadskiy.swingteacherdesktop.tables.*;
import com.posadskiy.swingteacherdesktop.tables.Error;

final class RestDtoMapper {
    private RestDtoMapper() {
    }

    static User toUser(UserDto dto) {
        if (dto == null) {
            return null;
        }
        User user = new User();
        user.setId(toInt(dto.id()));
        user.setEmail(dto.email());
        user.setLogin(dto.login());
        user.setLogins(dto.logins());
        user.setLastLogin(dto.lastLogin());
        user.setCompleteTraining(dto.completeTraining());
        return user;
    }

    static Lesson toLesson(LessonDto dto) {
        Lesson lesson = new Lesson();
        lesson.setId(toInt(dto.id()));
        lesson.setLessonNumber(dto.lessonNumber());
        lesson.setLessonName(dto.lessonName());
        lesson.setIdTaskCategory(toInt(dto.taskCategoryId()));
        return lesson;
    }

    static Task toTask(TaskDto dto) {
        Task task = new Task();
        task.setId(toInt(dto.id()));
        task.setIdLesson(toInt(dto.lessonId()));
        task.setTaskNumber(dto.taskNumber());
        task.setTitle(dto.title());
        task.setQuestion(dto.question());
        task.setAnswer(dto.answer());
        task.setImports(dto.imports());
        task.setIdDocumentation(toInt(dto.documentationId()));
        task.setDifficult(dto.difficult());
        task.setRating(dto.rating());
        return task;
    }

    static Keyword toKeyword(KeywordDto dto) {
        Keyword keyword = new Keyword();
        keyword.setId(toInt(dto.id()));
        keyword.setKeywordText(dto.keywordText());
        return keyword;
    }

    static Shorthand toShorthand(ShorthandDto dto) {
        Shorthand shorthand = new Shorthand();
        shorthand.setId(toInt(dto.id()));
        shorthand.setShortText(dto.shortText());
        shorthand.setFullText(dto.fullText());
        return shorthand;
    }

    static Documentation toDocumentation(DocumentationDto dto) {
        Documentation documentation = new Documentation();
        documentation.setId(toInt(dto.id()));
        documentation.setText(dto.text());
        return documentation;
    }

    static Error toError(ErrorDto dto) {
        Error error = new Error();
        error.setId(toInt(dto.id()));
        error.setErrorText(dto.errorText());
        return error;
    }

    static CompletedTask toCompletedTask(CompletedTaskDto dto) {
        CompletedTask completedTask = new CompletedTask();
        completedTask.setId(toInt(dto.id()));
        completedTask.setUserId(toInt(dto.userId()));
        completedTask.setTaskId(toInt(dto.taskId()));
        return completedTask;
    }

    static TaskCategory toTaskCategory(TaskCategoryDto dto) {
        TaskCategory category = new TaskCategory();
        category.setId(toInt(dto.id()));
        category.setName(dto.name());
        return category;
    }

    private static Integer toInt(Long value) {
        return value == null ? null : Math.toIntExact(value);
    }
}

