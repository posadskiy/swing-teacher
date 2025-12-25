package com.posadskiy.swingteacherdesktop.service.infrastructure.jpa;

import com.posadskiy.swingteacherdesktop.service.domain.entity.DocumentationEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DocumentationRepository extends JpaRepository<DocumentationEntity, Long> {
}

