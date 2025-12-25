package com.posadskiy.swingteacherdesktop.service.application;

import com.posadskiy.swingteacherdesktop.domain.dto.LessonDto;
import com.posadskiy.swingteacherdesktop.service.domain.mapper.DtoMapper;
import com.posadskiy.swingteacherdesktop.service.infrastructure.jpa.LessonRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LessonService {
    private final LessonRepository lessonRepository;

    public LessonService(LessonRepository lessonRepository) {
        this.lessonRepository = lessonRepository;
    }

    public List<LessonDto> getAll() {
        return lessonRepository.findAll()
            .stream()
            .map(DtoMapper::toDto)
            .toList();
    }

    public List<LessonDto> getByCategory(Long categoryId) {
        if (categoryId == null) {
            return getAll();
        }
        return lessonRepository.findByTaskCategoryId(categoryId)
            .stream()
            .map(DtoMapper::toDto)
            .toList();
    }

    public java.util.Optional<LessonDto> getById(Long id) {
        return lessonRepository.findById(id)
            .map(DtoMapper::toDto);
    }
}

