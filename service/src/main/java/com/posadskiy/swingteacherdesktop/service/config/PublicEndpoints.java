package com.posadskiy.swingteacherdesktop.service.config;

/**
 * Central policy for unauthenticated endpoints in the service.
 */
public final class PublicEndpoints {
    public static final String[] PERMIT_ALL = {
        "/api/auth/**",
        "/api/users/register",
        "/api/code-checking/**"
    };

    private PublicEndpoints() {
    }
}
