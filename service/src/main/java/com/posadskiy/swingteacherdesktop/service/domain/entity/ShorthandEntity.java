package com.posadskiy.swingteacherdesktop.service.domain.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "shorthand")
public class ShorthandEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "short_text")
    private String shortText;

    @Column(name = "full_text")
    private String fullText;
}

