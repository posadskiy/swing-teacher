package com.posadskiy.swingteacherdesktop.service.infrastructure.jpa;

import com.posadskiy.swingteacherdesktop.service.domain.entity.TaskCategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskCategoryRepository extends JpaRepository<TaskCategoryEntity, Long> {
}

