package com.posadskiy.swingteacherdesktop.dao.rest;

import com.posadskiy.swingteacherdesktop.dao.TaskDao;
import com.posadskiy.swingteacherdesktop.domain.dto.TaskDto;
import com.posadskiy.swingteacherdesktop.tables.Task;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

/**
 * Modern REST-based task DAO using Optional and streams.
 */
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
            return Optional.ofNullable(
                    client.get()
                        .uri("/api/tasks/{id}", id)
                        .retrieve()
                        .body(TaskDto.class)
                )
                .map(RestDtoMapper::toTask)
                .orElse(null);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch task by id: " + id, ex);
        }
    }
    
    @Override
    public List<Task> getTasks() throws SQLException {
        try {
            return fetchTasks("/api/tasks");
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch tasks", ex);
        }
    }
    
    @Override
    public List<Task> getTasksByLesson(int lessonId) throws SQLException {
        try {
            var response = client.get()
                .uri(uriBuilder -> uriBuilder
                    .path("/api/tasks")
                    .queryParam("lessonId", lessonId)
                    .build())
                .retrieve()
                .body(TaskDto[].class);
            
            return mapToTasks(response);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch tasks by lesson: " + lessonId, ex);
        }
    }
    
    private List<Task> fetchTasks(String uri) {
        var response = client.get()
            .uri(uri)
            .retrieve()
            .body(TaskDto[].class);
        
        return mapToTasks(response);
    }
    
    private List<Task> mapToTasks(TaskDto[] response) {
        return Optional.ofNullable(response)
            .map(arr -> Arrays.stream(arr)
                .map(RestDtoMapper::toTask)
                .toList())
            .orElse(List.of());
    }
}
