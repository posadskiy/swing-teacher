package com.posadskiy.swingteacherdesktop.tables;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
public class Task implements Serializable {

    @Serial
    private static final long serialVersionUID = -5527566248002296042L;

    private Integer id;

    private Integer idLesson;

    private Integer taskNumber;

    private String title;

    private String question;

    private String answer;

    private String imports;

    private Integer idDocumentation;

    private Double difficult;

    private Double rating;

    @Override
    public String toString() {
        return this.title;
    }

}
