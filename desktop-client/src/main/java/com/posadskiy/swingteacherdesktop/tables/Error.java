package com.posadskiy.swingteacherdesktop.tables;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
public class Error implements Serializable {

    @Serial
    private static final long serialVersionUID = -5527568543302296042L;

    private Integer id;

    private String errorText;

}
