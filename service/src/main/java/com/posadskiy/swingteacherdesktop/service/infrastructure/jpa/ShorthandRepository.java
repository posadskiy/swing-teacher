package com.posadskiy.swingteacherdesktop.service.infrastructure.jpa;

import com.posadskiy.swingteacherdesktop.service.domain.entity.ShorthandEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ShorthandRepository extends JpaRepository<ShorthandEntity, Long> {
}

