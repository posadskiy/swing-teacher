package com.posadskiy.swingteacherdesktop.domain.dto;

public record LessonDto(
    Long id,
    Integer lessonNumber,
    String lessonName,
    Long taskCategoryId
) {
}

