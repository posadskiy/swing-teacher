package com.posadskiy.swingteacherdesktop.domain.request;

import jakarta.validation.constraints.NotNull;

public record CompletedTaskRequest(
    @NotNull Long userId,
    @NotNull Long taskId
) {
}

