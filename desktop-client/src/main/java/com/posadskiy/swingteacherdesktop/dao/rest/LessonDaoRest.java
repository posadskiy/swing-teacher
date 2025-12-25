package com.posadskiy.swingteacherdesktop.dao.rest;

import com.posadskiy.swingteacherdesktop.dao.LessonDao;
import com.posadskiy.swingteacherdesktop.domain.dto.LessonDto;
import com.posadskiy.swingteacherdesktop.tables.Lesson;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

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
            LessonDto dto = client.get()
                .uri("/api/lessons/{id}", id)
                .retrieve()
                .body(LessonDto.class);
            return dto == null ? null : RestDtoMapper.toLesson(dto);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch lesson by id", ex);
        }
    }

    @Override
    public List<Lesson> getAllLessons() throws SQLException {
        try {
            LessonDto[] response = client.get()
                .uri("/api/lessons")
                .retrieve()
                .body(LessonDto[].class);
            return response == null ? List.of() :
                Arrays.stream(response)
                    .map(RestDtoMapper::toLesson)
                    .toList();
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch lessons", ex);
        }
    }

    @Override
    public List<Lesson> getLessonsByCategory(int category) throws SQLException {
        try {
            LessonDto[] response = client.get()
                .uri(uriBuilder -> uriBuilder.path("/api/lessons")
                    .queryParam("categoryId", category)
                    .build())
                .retrieve()
                .body(LessonDto[].class);
            return response == null ? List.of() :
                Arrays.stream(response)
                    .map(RestDtoMapper::toLesson)
                    .toList();
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch lessons by category", ex);
        }
    }
}

