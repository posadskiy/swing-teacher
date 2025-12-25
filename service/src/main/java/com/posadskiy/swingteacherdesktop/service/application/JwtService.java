package com.posadskiy.swingteacherdesktop.service.application;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.Date;

@Service
public class JwtService {
    private final SecretKey secretKey;
    private final long accessTokenExpirationMs;
    private final long refreshTokenExpirationMs;

    public JwtService(
        @Value("${jwt.secret:defaultSecretKeyForDevelopmentOnlyChangeInProduction}") String secret,
        @Value("${jwt.access-token-expiration:900000}") long accessTokenExpirationMs,
        @Value("${jwt.refresh-token-expiration:604800000}") long refreshTokenExpirationMs) {
        this.secretKey = Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));
        this.accessTokenExpirationMs = accessTokenExpirationMs;
        this.refreshTokenExpirationMs = refreshTokenExpirationMs;
    }

    public String generateAccessToken(Long userId, String login) {
        Instant now = Instant.now();
        Instant expiration = now.plusMillis(accessTokenExpirationMs);

        return Jwts.builder()
            .subject(String.valueOf(userId))
            .claim("login", login)
            .issuedAt(Date.from(now))
            .expiration(Date.from(expiration))
            .signWith(secretKey)
            .compact();
    }

    public String generateRefreshToken(Long userId) {
        Instant now = Instant.now();
        Instant expiration = now.plusMillis(refreshTokenExpirationMs);

        return Jwts.builder()
            .subject(String.valueOf(userId))
            .claim("type", "refresh")
            .issuedAt(Date.from(now))
            .expiration(Date.from(expiration))
            .signWith(secretKey)
            .compact();
    }

    public Claims validateToken(String token) {
        return Jwts.parser()
            .verifyWith(secretKey)
            .build()
            .parseSignedClaims(token)
            .getPayload();
    }

    public Long extractUserId(String token) {
        Claims claims = validateToken(token);
        return Long.parseLong(claims.getSubject());
    }

    public String extractLogin(String token) {
        Claims claims = validateToken(token);
        return claims.get("login", String.class);
    }

    public boolean isRefreshToken(String token) {
        try {
            Claims claims = validateToken(token);
            return "refresh".equals(claims.get("type", String.class));
        } catch (Exception e) {
            return false;
        }
    }

    public Instant getAccessTokenExpiration() {
        return Instant.now().plusMillis(accessTokenExpirationMs);
    }
}

