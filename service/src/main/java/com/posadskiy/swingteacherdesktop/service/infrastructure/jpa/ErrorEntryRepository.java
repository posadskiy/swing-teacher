package com.posadskiy.swingteacherdesktop.service.infrastructure.jpa;

import com.posadskiy.swingteacherdesktop.service.domain.entity.ErrorEntryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ErrorEntryRepository extends JpaRepository<ErrorEntryEntity, Long> {
}


