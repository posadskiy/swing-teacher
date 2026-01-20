package com.posadskiy.swingteacherdesktop.infrastructure.config;

/**
 * Central policy for unauthenticated endpoints in the desktop client.
 */
public final class PublicEndpoints {
    private PublicEndpoints() {
    }

    public static boolean isPublic(String path) {
        if (path == null) {
            return false;
        }
        return path.startsWith("/api/auth/")
            || path.startsWith("/api/users/register")
            || path.startsWith("/api/code-checking/");
    }
}
