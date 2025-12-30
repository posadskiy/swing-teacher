package com.posadskiy.swingteacherdesktop.service.web;

import com.posadskiy.swingteacherdesktop.domain.dto.LessonDto;
import com.posadskiy.swingteacherdesktop.service.application.LessonService;
import com.posadskiy.swingteacherdesktop.service.application.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/lessons")
public class LessonController {
    private final LessonService lessonService;
    private final UserService userService;

    public LessonController(LessonService lessonService, UserService userService) {
        this.lessonService = lessonService;
        this.userService = userService;
    }

    @GetMapping
    public List<LessonDto> getLessons(
        @RequestParam(name = "categoryId", required = false) Long categoryId,
        @RequestParam(name = "lang", required = false) String languageCode,
        Authentication authentication
    ) {
        String lang = determineLanguage(languageCode, authentication);
        return lessonService.getByCategory(categoryId, lang);
    }

    @GetMapping("/{id}")
    public ResponseEntity<LessonDto> getLesson(
        @PathVariable("id") Long id,
        @RequestParam(name = "lang", required = false) String languageCode,
        Authentication authentication
    ) {
        String lang = determineLanguage(languageCode, authentication);
        return lessonService.getById(id, lang)
            .map(ResponseEntity::ok)
            .orElseGet(() -> ResponseEntity.notFound().build());
    }

    private String determineLanguage(String languageCode, Authentication authentication) {
        if (languageCode != null && !languageCode.isBlank()) {
            return languageCode;
        }

        if (authentication != null && authentication.getPrincipal() != null) {
            try {
                Long userId = Long.parseLong(authentication.getPrincipal().toString());
                return userService.getPreferredLanguage(userId).orElse("en");
            } catch (NumberFormatException e) {
                // Fall through to default
            }
        }

        return "en";
    }
}

