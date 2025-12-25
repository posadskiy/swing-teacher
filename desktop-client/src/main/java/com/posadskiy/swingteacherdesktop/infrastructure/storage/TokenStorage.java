package com.posadskiy.swingteacherdesktop.infrastructure.storage;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.time.Instant;
import java.util.concurrent.atomic.AtomicReference;

/**
 * Thread-safe token storage for authentication tokens.
 */
@Slf4j
@Component
public class TokenStorage {
    
    private final AtomicReference<TokenData> tokens = new AtomicReference<>();
    
    public void saveTokens(String accessToken, String refreshToken, Instant expiresAt) {
        tokens.set(new TokenData(accessToken, refreshToken, expiresAt));
        log.debug("Tokens saved, expires at: {}", expiresAt);
    }
    
    public String getAccessToken() {
        var data = tokens.get();
        return data != null ? data.accessToken() : null;
    }
    
    public String getRefreshToken() {
        var data = tokens.get();
        return data != null ? data.refreshToken() : null;
    }
    
    public boolean hasValidTokens() {
        var data = tokens.get();
        if (data == null || data.accessToken() == null) {
            return false;
        }
        return data.expiresAt() == null || data.expiresAt().isAfter(Instant.now());
    }
    
    public boolean isExpired() {
        var data = tokens.get();
        if (data == null || data.expiresAt() == null) {
            return true;
        }
        return data.expiresAt().isBefore(Instant.now());
    }
    
    public void clear() {
        tokens.set(null);
        log.debug("Tokens cleared");
    }
    
    private record TokenData(String accessToken, String refreshToken, Instant expiresAt) {}
}


