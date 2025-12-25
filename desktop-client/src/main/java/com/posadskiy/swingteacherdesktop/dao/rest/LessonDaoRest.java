package com.posadskiy.swingteacherdesktop.dao.rest;

import com.posadskiy.swingteacherdesktop.dao.LessonDao;
import com.posadskiy.swingteacherdesktop.domain.dto.LessonDto;
import com.posadskiy.swingteacherdesktop.tables.Lesson;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

/**
 * Modern REST-based lesson DAO using Optional and streams.
 */
public class LessonDaoRest implements LessonDao {
    
    private final RestClient client;
    
    public LessonDaoRest(RestClient client) {
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
    public Lesson getLesson(int id) throws SQLException {
        try {
            return Optional.ofNullable(
                    client.get()
                        .uri("/api/lessons/{id}", id)
                        .retrieve()
                        .body(LessonDto.class)
                )
                .map(RestDtoMapper::toLesson)
                .orElse(null);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch lesson by id: " + id, ex);
        }
    }
    
    @Override
    public List<Lesson> getAllLessons() throws SQLException {
        try {
            return fetchLessons("/api/lessons");
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
    
    private List<Lesson> fetchLessons(String uri) {
        var response = client.get()
            .uri(uri)
            .retrieve()
            .body(LessonDto[].class);
        
        return mapToLessons(response);
    }
    
    private List<Lesson> mapToLessons(LessonDto[] response) {
        return Optional.ofNullable(response)
            .map(arr -> Arrays.stream(arr)
                .map(RestDtoMapper::toLesson)
                .toList())
            .orElse(List.of());
    }
}
