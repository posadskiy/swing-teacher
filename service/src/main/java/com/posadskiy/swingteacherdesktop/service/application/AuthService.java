package com.posadskiy.swingteacherdesktop.service.application;

import com.posadskiy.swingteacherdesktop.domain.request.AuthRequest;
import com.posadskiy.swingteacherdesktop.domain.response.AuthResponse;
import com.posadskiy.swingteacherdesktop.domain.response.RefreshTokenResponse;
import com.posadskiy.swingteacherdesktop.service.domain.entity.RefreshTokenEntity;
import com.posadskiy.swingteacherdesktop.service.domain.entity.UserEntity;
import com.posadskiy.swingteacherdesktop.service.infrastructure.jpa.RefreshTokenRepository;
import com.posadskiy.swingteacherdesktop.service.infrastructure.jpa.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.Optional;

@Service
public class AuthService {
    private final UserRepository userRepository;
    private final RefreshTokenRepository refreshTokenRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    public AuthService(
        UserRepository userRepository,
        RefreshTokenRepository refreshTokenRepository,
        PasswordEncoder passwordEncoder,
        JwtService jwtService) {
        this.userRepository = userRepository;
        this.refreshTokenRepository = refreshTokenRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtService = jwtService;
    }

    @Transactional
    public Optional<AuthResponse> authenticate(AuthRequest request) {
        return userRepository.findByLoginIgnoreCase(request.login())
            .filter(user -> matchesPassword(user, request.password()))
            .map(user -> generateTokenPair(user.getId(), user.getLogin()));
    }

    @Transactional
    public Optional<RefreshTokenResponse> refreshToken(String refreshToken) {
        try {
            if (!jwtService.isRefreshToken(refreshToken)) {
                return Optional.empty();
            }

            Long userId = jwtService.extractUserId(refreshToken);

            Optional<RefreshTokenEntity> tokenEntity = refreshTokenRepository.findByToken(refreshToken);
            if (tokenEntity.isEmpty() || tokenEntity.get().getExpiresAt().isBefore(Instant.now())) {
                return Optional.empty();
            }

            Optional<UserEntity> user = userRepository.findById(userId);
            if (user.isEmpty()) {
                return Optional.empty();
            }

            // Revoke old refresh token
            refreshTokenRepository.deleteByToken(refreshToken);

            // Generate new token pair
            AuthResponse authResponse = generateTokenPair(userId, user.get().getLogin());
            return Optional.of(
                new RefreshTokenResponse(
                    authResponse.accessToken(),
                    authResponse.refreshToken(),
                    authResponse.expiresAt()));
        } catch (Exception e) {
            return Optional.empty();
        }
    }

    @Transactional
    public void revokeRefreshToken(String refreshToken) {
        refreshTokenRepository.findByToken(refreshToken).ifPresent(refreshTokenRepository::delete);
    }

    @Transactional
    public AuthResponse generateTokenPair(Long userId, String login) {
        String accessToken = jwtService.generateAccessToken(userId, login);
        String refreshToken = jwtService.generateRefreshToken(userId);
        Instant expiresAt = jwtService.getAccessTokenExpiration();

        // Store refresh token in database
        RefreshTokenEntity tokenEntity = new RefreshTokenEntity();
        tokenEntity.setUserId(userId);
        tokenEntity.setToken(refreshToken);
        tokenEntity.setExpiresAt(Instant.now().plusMillis(604800000L)); // 7 days
        tokenEntity.setCreatedAt(Instant.now());
        refreshTokenRepository.save(tokenEntity);

        return new AuthResponse(accessToken, refreshToken, expiresAt);
    }

    private boolean matchesPassword(UserEntity user, String rawPassword) {
        String stored = Optional.ofNullable(user.getPassword()).orElse("");
        if (stored.startsWith("$2a$") || stored.startsWith("$2b$") || stored.startsWith("$2y$")) {
            return passwordEncoder.matches(rawPassword, stored);
        }
        if (stored.equalsIgnoreCase(rawPassword)) {
            return true;
        }
        String md5 = org.apache.commons.codec.digest.DigestUtils.md5Hex(rawPassword);
        return stored.equalsIgnoreCase(md5);
    }
}

