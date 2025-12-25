package com.posadskiy.swingteacherdesktop.service.domain.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "users")
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String email;
    private String login;
    private String password;
    private Integer logins;

    @Column(name = "last_login")
    private Integer lastLogin;

    @Column(name = "complete_training")
    private Boolean completeTraining;
}

