package com.posadskiy.swingteacherdesktop.service.application;

import com.posadskiy.swingteacherdesktop.domain.dto.*;
import com.posadskiy.swingteacherdesktop.service.domain.mapper.DtoMapper;
import com.posadskiy.swingteacherdesktop.service.infrastructure.jpa.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ReferenceDataService {
    private static final Logger log = LoggerFactory.getLogger(ReferenceDataService.class);
    private final KeywordRepository keywordRepository;
    private final ShorthandRepository shorthandRepository;
    private final DocumentationRepository documentationRepository;
    private final ErrorEntryRepository errorRepository;
    private final TaskCategoryRepository taskCategoryRepository;

    public ReferenceDataService(
        KeywordRepository keywordRepository,
        ShorthandRepository shorthandRepository,
        DocumentationRepository documentationRepository,
        ErrorEntryRepository errorRepository,
        TaskCategoryRepository taskCategoryRepository) {
        this.keywordRepository = keywordRepository;
        this.shorthandRepository = shorthandRepository;
        this.documentationRepository = documentationRepository;
        this.errorRepository = errorRepository;
        this.taskCategoryRepository = taskCategoryRepository;
    }

    public List<KeywordDto> getKeywords() {
        return keywordRepository.findAll().stream().map(DtoMapper::toDto).toList();
    }

    public List<ShorthandDto> getShorthands() {
        return shorthandRepository.findAll().stream().map(DtoMapper::toDto).toList();
    }

    public Optional<DocumentationDto> getDocumentation(Long id) {
        try {
            return documentationRepository.findById(id)
                .map(DtoMapper::toDto);
        } catch (Exception e) {
            log.error("Failed to get documentation id={}", id, e);
            throw e; // Let the global exception handler catch it
        }
    }

    public Optional<ErrorDto> getError(Long id) {
        return errorRepository.findById(id).map(DtoMapper::toDto);
    }

    public List<TaskCategoryDto> getTaskCategories() {
        return taskCategoryRepository.findAll().stream().map(DtoMapper::toDto).toList();
    }
}

