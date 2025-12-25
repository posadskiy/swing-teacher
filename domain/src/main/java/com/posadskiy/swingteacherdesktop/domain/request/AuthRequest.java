package com.posadskiy.swingteacherdesktop.domain.request;

import jakarta.validation.constraints.NotBlank;

public record AuthRequest(
    @NotBlank String login,
    @NotBlank String password
) {
}

