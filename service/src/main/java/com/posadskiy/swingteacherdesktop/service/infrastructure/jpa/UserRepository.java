package com.posadskiy.swingteacherdesktop.service.infrastructure.jpa;

import com.posadskiy.swingteacherdesktop.service.domain.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
    Optional<UserEntity> findByLoginIgnoreCase(String login);
}

