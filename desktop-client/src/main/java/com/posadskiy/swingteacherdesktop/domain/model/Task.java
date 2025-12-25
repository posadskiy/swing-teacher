package com.posadskiy.swingteacherdesktop.domain.model;

import lombok.Builder;

import java.io.Serializable;
import java.util.Optional;

/**
 * Immutable task entity using Java record with Lombok @Builder.
 */
@Builder(toBuilder = true)
public record Task(
    Integer id,
    Integer idLesson,
    Integer taskNumber,
    String title,
    String question,
    String answer,
    String imports,
    Integer idDocumentation,
    Double difficult,
    Double rating
) implements Serializable {
    
    private static final long serialVersionUID = -5527566248002296042L;
    
    public Optional<String> getImportsOptional() {
        return Optional.ofNullable(imports).filter(s -> !s.isBlank());
    }
    
    @Override
    public String toString() {
        return Optional.ofNullable(title).orElse("Untitled Task");
    }
}

