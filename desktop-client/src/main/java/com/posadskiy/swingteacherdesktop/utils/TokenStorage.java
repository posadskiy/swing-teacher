package com.posadskiy.swingteacherdesktop.utils;

import org.springframework.stereotype.Component;

import java.time.Instant;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

@Component
public class TokenStorage {
    private final ReadWriteLock lock = new ReentrantReadWriteLock();
    private String accessToken;
    private String refreshToken;
    private Instant expiresAt;

    public void saveTokens(String accessToken, String refreshToken, Instant expiresAt) {
        lock.writeLock().lock();
        try {
            this.accessToken = accessToken;
            this.refreshToken = refreshToken;
            this.expiresAt = expiresAt;
        } finally {
            lock.writeLock().unlock();
        }
    }

    public String getAccessToken() {
        lock.readLock().lock();
        try {
            return accessToken;
        } finally {
            lock.readLock().unlock();
        }
    }

    public String getRefreshToken() {
        lock.readLock().lock();
        try {
            return refreshToken;
        } finally {
            lock.readLock().unlock();
        }
    }

    public boolean isTokenExpired() {
        lock.readLock().lock();
        try {
            return expiresAt == null || expiresAt.isBefore(Instant.now());
        } finally {
            lock.readLock().unlock();
        }
    }

    public boolean hasTokens() {
        lock.readLock().lock();
        try {
            return accessToken != null && refreshToken != null;
        } finally {
            lock.readLock().unlock();
        }
    }

    public void clear() {
        lock.writeLock().lock();
        try {
            this.accessToken = null;
            this.refreshToken = null;
            this.expiresAt = null;
        } finally {
            lock.writeLock().unlock();
        }
    }
}

