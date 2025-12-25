package com.posadskiy.swingteacherdesktop.domain.request;

import jakarta.validation.constraints.NotBlank;

public record RefreshTokenRequest(@NotBlank String refreshToken) {
}

