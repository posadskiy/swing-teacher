package com.posadskiy.swingteacherdesktop.utils;

import org.springframework.stereotype.Component;

import java.time.Instant;
import java.util.Optional;
import java.util.concurrent.locks.StampedLock;

/**
 * Thread-safe token storage using modern StampedLock for better performance.
 * StampedLock provides optimistic reads for frequently accessed tokens.
 */
@Component
public class TokenStorage {
    
    private final StampedLock lock = new StampedLock();
    
    private volatile String accessToken;
    private volatile String refreshToken;
    private volatile Instant expiresAt;
    
    /**
     * Immutable token snapshot for atomic reads.
     */
    public record TokenSnapshot(
        String accessToken,
        String refreshToken,
        Instant expiresAt
    ) {
        public boolean isExpired() {
            return expiresAt == null || expiresAt.isBefore(Instant.now());
        }
        
        public boolean isValid() {
            return accessToken != null && refreshToken != null && !isExpired();
        }
        
        public Optional<String> getAccessTokenOptional() {
            return Optional.ofNullable(accessToken);
        }
    }
    
    public void saveTokens(String accessToken, String refreshToken, Instant expiresAt) {
        var stamp = lock.writeLock();
        try {
            this.accessToken = accessToken;
            this.refreshToken = refreshToken;
            this.expiresAt = expiresAt;
        } finally {
            lock.unlockWrite(stamp);
        }
    }
    
    /**
     * Gets a consistent snapshot of all tokens atomically.
     */
    public TokenSnapshot getSnapshot() {
        // Try optimistic read first (no locking)
        var stamp = lock.tryOptimisticRead();
        var access = accessToken;
        var refresh = refreshToken;
        var expires = expiresAt;
        
        // Validate the read - if write occurred during read, acquire read lock
        if (!lock.validate(stamp)) {
            stamp = lock.readLock();
            try {
                access = accessToken;
                refresh = refreshToken;
                expires = expiresAt;
            } finally {
                lock.unlockRead(stamp);
            }
        }
        
        return new TokenSnapshot(access, refresh, expires);
    }
    
    public String getAccessToken() {
        return getSnapshot().accessToken();
    }
    
    public Optional<String> getAccessTokenOptional() {
        return getSnapshot().getAccessTokenOptional();
    }
    
    public String getRefreshToken() {
        return getSnapshot().refreshToken();
    }
    
    public boolean isTokenExpired() {
        return getSnapshot().isExpired();
    }
    
    public boolean hasTokens() {
        var snapshot = getSnapshot();
        return snapshot.accessToken() != null && snapshot.refreshToken() != null;
    }
    
    public boolean hasValidTokens() {
        return getSnapshot().isValid();
    }
    
    public void clear() {
        var stamp = lock.writeLock();
        try {
            this.accessToken = null;
            this.refreshToken = null;
            this.expiresAt = null;
        } finally {
            lock.unlockWrite(stamp);
        }
    }
}
