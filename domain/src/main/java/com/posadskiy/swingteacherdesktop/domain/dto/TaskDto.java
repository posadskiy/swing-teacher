package com.posadskiy.swingteacherdesktop.domain.dto;

public record TaskDto(
    Long id,
    Long lessonId,
    Integer taskNumber,
    String title,
    String question,
    String answer,
    String imports,
    String solution,
    Long documentationId,
    Double difficult,
    Double rating
) {
}

