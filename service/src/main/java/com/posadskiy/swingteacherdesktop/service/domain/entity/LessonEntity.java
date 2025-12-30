package com.posadskiy.swingteacherdesktop.service.domain.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "lesson")
public class LessonEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_task_category")
    private Long taskCategoryId;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_lesson")
    @OrderBy("taskNumber ASC")
    private List<TaskEntity> tasks = new ArrayList<>();

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "lesson")
    private List<LessonTranslationEntity> translations = new ArrayList<>();
}

