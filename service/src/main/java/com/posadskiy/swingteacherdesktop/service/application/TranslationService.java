package com.posadskiy.swingteacherdesktop.service.application;

import com.posadskiy.swingteacherdesktop.service.domain.entity.LessonTranslationEntity;
import com.posadskiy.swingteacherdesktop.service.domain.entity.TaskTranslationEntity;
import com.posadskiy.swingteacherdesktop.service.infrastructure.jpa.LessonTranslationRepository;
import com.posadskiy.swingteacherdesktop.service.infrastructure.jpa.TaskTranslationRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class TranslationService {
    private final LessonTranslationRepository lessonTranslationRepository;
    private final TaskTranslationRepository taskTranslationRepository;

    public TranslationService(
        LessonTranslationRepository lessonTranslationRepository,
        TaskTranslationRepository taskTranslationRepository
    ) {
        this.lessonTranslationRepository = lessonTranslationRepository;
        this.taskTranslationRepository = taskTranslationRepository;
    }

    /**
     * Get lesson name translation with fallback to English.
     * Returns null if no translation is found.
     */
    public String getLessonName(Long lessonId, String languageCode) {
        if (languageCode != null && !languageCode.isBlank() && !"en".equals(languageCode)) {
            // Try requested language first
            Optional<LessonTranslationEntity> translation = lessonTranslationRepository
                .findByLessonIdAndLanguageCode(lessonId, languageCode);
            if (translation.isPresent() && translation.get().getLessonName() != null) {
                return translation.get().getLessonName();
            }
        }

        // Fallback to English
        Optional<LessonTranslationEntity> enTranslation = lessonTranslationRepository
            .findByLessonIdAndLanguageCode(lessonId, "en");
        if (enTranslation.isPresent() && enTranslation.get().getLessonName() != null) {
            return enTranslation.get().getLessonName();
        }

        // No translation found
        return null;
    }

    /**
     * Get task title translation with fallback to English.
     * Returns null if no translation is found.
     */
    public String getTaskTitle(Long taskId, String languageCode) {
        if (languageCode != null && !"en".equals(languageCode)) {
            // Try requested language first
            Optional<TaskTranslationEntity> translation = taskTranslationRepository
                .findByTaskIdAndLanguageCode(taskId, languageCode);
            if (translation.isPresent() && translation.get().getTitle() != null) {
                return translation.get().getTitle();
            }
        }

        // Fallback to English
        Optional<TaskTranslationEntity> enTranslation = taskTranslationRepository
            .findByTaskIdAndLanguageCode(taskId, "en");
        if (enTranslation.isPresent() && enTranslation.get().getTitle() != null) {
            return enTranslation.get().getTitle();
        }

        // No translation found
        return null;
    }

    /**
     * Get task question translation with fallback to English.
     * Returns null if no translation is found.
     */
    public String getTaskQuestion(Long taskId, String languageCode) {
        if (languageCode != null && !"en".equals(languageCode)) {
            // Try requested language first
            Optional<TaskTranslationEntity> translation = taskTranslationRepository
                .findByTaskIdAndLanguageCode(taskId, languageCode);
            if (translation.isPresent() && translation.get().getQuestion() != null) {
                return translation.get().getQuestion();
            }
        }

        // Fallback to English
        Optional<TaskTranslationEntity> enTranslation = taskTranslationRepository
            .findByTaskIdAndLanguageCode(taskId, "en");
        if (enTranslation.isPresent() && enTranslation.get().getQuestion() != null) {
            return enTranslation.get().getQuestion();
        }

        // No translation found
        return null;
    }
}
