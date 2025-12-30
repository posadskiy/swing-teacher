package com.posadskiy.swingteacherdesktop.service.infrastructure.jpa;

import com.posadskiy.swingteacherdesktop.service.domain.entity.LessonTranslationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface LessonTranslationRepository extends JpaRepository<LessonTranslationEntity, Long> {
    Optional<LessonTranslationEntity> findByLessonIdAndLanguageCode(Long lessonId, String languageCode);

    @Query("SELECT lt FROM LessonTranslationEntity lt WHERE lt.lessonId = :lessonId AND lt.languageCode = :languageCode")
    Optional<LessonTranslationEntity> findTranslation(@Param("lessonId") Long lessonId, @Param("languageCode") String languageCode);
}
