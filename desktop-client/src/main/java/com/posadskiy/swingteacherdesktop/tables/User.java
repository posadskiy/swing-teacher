package com.posadskiy.swingteacherdesktop.tables;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
public class User implements Serializable {

    @Serial
    private static final long serialVersionUID = -5527566248002496042L;

    private Integer id;

    private String email;

    private String login;

    private String password;

    private Integer logins;

    private Integer lastLogin;

    private Boolean completeTraining;

}
