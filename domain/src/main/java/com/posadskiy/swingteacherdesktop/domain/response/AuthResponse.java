package com.posadskiy.swingteacherdesktop.domain.response;

import java.time.Instant;

public record AuthResponse(String accessToken, String refreshToken, Instant expiresAt) {
}


