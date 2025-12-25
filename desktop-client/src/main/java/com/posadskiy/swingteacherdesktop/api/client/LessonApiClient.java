package com.posadskiy.swingteacherdesktop.api.client;

import com.posadskiy.swingteacherdesktop.api.mapper.DtoMapper;
import com.posadskiy.swingteacherdesktop.domain.dto.LessonDto;
import com.posadskiy.swingteacherdesktop.domain.model.Lesson;
import com.posadskiy.swingteacherdesktop.domain.repository.LessonRepository;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

/**
 * REST API client for Lesson operations.
 */
public class LessonApiClient implements LessonRepository {
    
    private final RestClient client;
    
    public LessonApiClient(RestClient client) {
        this.client = client;
    }
    
    @Override
    public void addLesson(Lesson lesson) {
        throw new UnsupportedOperationException("addLesson is not supported over REST");
    }
    
    @Override
    public void deleteLesson(Lesson lesson) {
        throw new UnsupportedOperationException("deleteLesson is not supported over REST");
    }
    
    @Override
    public void deleteLesson(int id) {
        throw new UnsupportedOperationException("deleteLesson is not supported over REST");
    }
    
    @Override
    public Optional<Lesson> getLesson(int id) throws SQLException {
        try {
            return Optional.ofNullable(
                    client.get()
                        .uri("/api/lessons/{id}", id)
                        .retrieve()
                        .body(LessonDto.class)
                )
                .map(DtoMapper::toLesson);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch lesson by id: " + id, ex);
        }
    }
    
    @Override
    public List<Lesson> getLessons() throws SQLException {
        try {
            var response = client.get()
                .uri("/api/lessons")
                .retrieve()
                .body(LessonDto[].class);
            
            return mapToLessons(response);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch lessons", ex);
        }
    }
    
    @Override
    public List<Lesson> getLessonsByCategory(int category) throws SQLException {
        try {
            var response = client.get()
                .uri(uriBuilder -> uriBuilder
                    .path("/api/lessons")
                    .queryParam("categoryId", category)
                    .build())
                .retrieve()
                .body(LessonDto[].class);
            
            return mapToLessons(response);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch lessons by category: " + category, ex);
        }
    }
    
    private List<Lesson> mapToLessons(LessonDto[] response) {
        return Optional.ofNullable(response)
            .map(arr -> Arrays.stream(arr)
                .map(DtoMapper::toLesson)
                .toList())
            .orElse(List.of());
    }
}


