package com.posadskiy.swingteacherdesktop.service.domain.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "lesson_translation", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"lesson_id", "language_code"})
})
public class LessonTranslationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "lesson_id", nullable = false)
    private Long lessonId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lesson_id", insertable = false, updatable = false)
    private LessonEntity lesson;

    @Column(name = "language_code", nullable = false, length = 10)
    private String languageCode;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "language_code", referencedColumnName = "code", insertable = false, updatable = false)
    private LanguageEntity language;

    @Column(name = "lesson_name", length = 255)
    private String lessonName;
}
