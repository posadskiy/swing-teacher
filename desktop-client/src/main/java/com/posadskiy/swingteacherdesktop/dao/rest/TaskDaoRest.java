package com.posadskiy.swingteacherdesktop.dao.rest;

import com.posadskiy.swingteacherdesktop.dao.TaskDao;
import com.posadskiy.swingteacherdesktop.domain.dto.TaskDto;
import com.posadskiy.swingteacherdesktop.tables.Task;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

public class TaskDaoRest implements TaskDao {
    private final RestClient client;

    public TaskDaoRest(RestClient client) {
        this.client = client;
    }

    @Override
    public void addTask(Task task) {
        throw new UnsupportedOperationException("addTask is not supported over REST");
    }

    @Override
    public void deleteTask(Task task) {
        throw new UnsupportedOperationException("deleteTask is not supported over REST");
    }

    @Override
    public void deleteTask(int id) {
        throw new UnsupportedOperationException("deleteTask is not supported over REST");
    }

    @Override
    public Task getTask(int id) throws SQLException {
        try {
            TaskDto dto = client.get()
                .uri("/api/tasks/{id}", id)
                .retrieve()
                .body(TaskDto.class);
            return dto == null ? null : RestDtoMapper.toTask(dto);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch task by id", ex);
        }
    }

    @Override
    public List<Task> getTasks() throws SQLException {
        try {
            TaskDto[] response = client.get()
                .uri("/api/tasks")
                .retrieve()
                .body(TaskDto[].class);
            return response == null ? List.of() :
                Arrays.stream(response)
                    .map(RestDtoMapper::toTask)
                    .toList();
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch tasks", ex);
        }
    }

    @Override
    public List<Task> getTasksByLesson(int lesson) throws SQLException {
        try {
            TaskDto[] response = client.get()
                .uri(uriBuilder -> uriBuilder.path("/api/tasks")
                    .queryParam("lessonId", lesson)
                    .build())
                .retrieve()
                .body(TaskDto[].class);
            return response == null ? List.of() :
                Arrays.stream(response)
                    .map(RestDtoMapper::toTask)
                    .toList();
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch tasks by lesson", ex);
        }
    }
}

