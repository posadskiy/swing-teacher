package com.posadskiy.swingteacherdesktop.service.infrastructure.jpa;

import com.posadskiy.swingteacherdesktop.service.domain.entity.TaskTranslationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface TaskTranslationRepository extends JpaRepository<TaskTranslationEntity, Long> {
    Optional<TaskTranslationEntity> findByTaskIdAndLanguageCode(Long taskId, String languageCode);

    @Query("SELECT tt FROM TaskTranslationEntity tt WHERE tt.taskId = :taskId AND tt.languageCode = :languageCode")
    Optional<TaskTranslationEntity> findTranslation(@Param("taskId") Long taskId, @Param("languageCode") String languageCode);

    @Query("SELECT tt FROM TaskTranslationEntity tt WHERE tt.taskId IN :taskIds AND tt.languageCode = :languageCode")
    List<TaskTranslationEntity> findByTaskIdsAndLanguageCode(@Param("taskIds") List<Long> taskIds, @Param("languageCode") String languageCode);
}
