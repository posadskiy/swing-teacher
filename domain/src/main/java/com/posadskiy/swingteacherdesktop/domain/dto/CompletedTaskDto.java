package com.posadskiy.swingteacherdesktop.domain.dto;

public record CompletedTaskDto(
    Long id,
    Long userId,
    Long taskId
) {
}

