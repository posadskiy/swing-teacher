package com.posadskiy.swingteacherdesktop.service.web;

import com.posadskiy.swingteacherdesktop.domain.dto.*;
import com.posadskiy.swingteacherdesktop.service.application.ReferenceDataService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/ref")
public class ReferenceDataController {
    private final ReferenceDataService referenceDataService;

    public ReferenceDataController(ReferenceDataService referenceDataService) {
        this.referenceDataService = referenceDataService;
    }

    @GetMapping("/keywords")
    public List<KeywordDto> keywords() {
        return referenceDataService.getKeywords();
    }

    @GetMapping("/shorthands")
    public List<ShorthandDto> shorthands() {
        return referenceDataService.getShorthands();
    }

    @GetMapping("/documentation/{id}")
    public ResponseEntity<DocumentationDto> documentation(@PathVariable("id") Long id) {
        return referenceDataService.getDocumentation(id)
            .map(ResponseEntity::ok)
            .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping("/errors/{id}")
    public ResponseEntity<ErrorDto> error(@PathVariable("id") Long id) {
        return referenceDataService.getError(id)
            .map(ResponseEntity::ok)
            .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping("/task-categories")
    public List<TaskCategoryDto> categories() {
        return referenceDataService.getTaskCategories();
    }
}

