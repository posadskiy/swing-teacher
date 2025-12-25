package com.posadskiy.swingteacherdesktop.service.infrastructure.jpa;

import com.posadskiy.swingteacherdesktop.service.domain.entity.RefreshTokenEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.Instant;
import java.util.Optional;

public interface RefreshTokenRepository extends JpaRepository<RefreshTokenEntity, Long> {
    Optional<RefreshTokenEntity> findByToken(String token);

    void deleteByToken(String token);

    void deleteByUserId(Long userId);

    void deleteByExpiresAtBefore(Instant instant);
}

