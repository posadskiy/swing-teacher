package com.posadskiy.swingteacherdesktop.tables;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
public class Keyword implements Serializable {
    @Serial
    private static final long serialVersionUID = -1L;

    private Integer id;

    private String keywordText;

}
