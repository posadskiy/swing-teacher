package com.posadskiy.swingteacherdesktop.service.domain.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "task")
public class TaskEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_lesson")
    private Long lessonId;

    @Column(name = "task_number")
    private Integer taskNumber;

    private String title;
    private String question;
    private String answer;
    private String imports;

    @Column(name = "id_documentation")
    private Long documentationId;

    private Double difficult;
    private Double rating;
}

