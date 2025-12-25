package com.posadskiy.swingteacherdesktop.service.infrastructure.jpa;

import com.posadskiy.swingteacherdesktop.service.domain.entity.LessonEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LessonRepository extends JpaRepository<LessonEntity, Long> {
    List<LessonEntity> findByTaskCategoryId(Long taskCategoryId);
}

