package com.posadskiy.swingteacherdesktop.service.infrastructure.jpa;

import com.posadskiy.swingteacherdesktop.service.domain.entity.CompletedTaskEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CompletedTaskRepository extends JpaRepository<CompletedTaskEntity, Long> {
    Optional<CompletedTaskEntity> findByUserIdAndTaskId(Long userId, Long taskId);

    List<CompletedTaskEntity> findByUserId(Long userId);
}


