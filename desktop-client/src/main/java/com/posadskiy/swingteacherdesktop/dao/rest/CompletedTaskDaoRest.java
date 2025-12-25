package com.posadskiy.swingteacherdesktop.dao.rest;

import com.posadskiy.swingteacherdesktop.dao.CompletedTaskDao;
import com.posadskiy.swingteacherdesktop.domain.dto.CompletedTaskDto;
import com.posadskiy.swingteacherdesktop.domain.request.CompletedTaskRequest;
import com.posadskiy.swingteacherdesktop.tables.CompletedTask;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

/**
 * Modern REST-based completed task DAO using Optional and streams.
 */
public class CompletedTaskDaoRest implements CompletedTaskDao {
    
    private final RestClient client;
    
    public CompletedTaskDaoRest(RestClient client) {
        this.client = client;
    }
    
    @Override
    public void addCompletedTask(CompletedTask completedTask) throws SQLException {
        var request = new CompletedTaskRequest(
            toLong(completedTask.userId()),
            toLong(completedTask.taskId())
        );
        
        try {
            client.post()
                .uri("/api/completed-tasks")
                .body(request)
                .retrieve()
                .toEntity(CompletedTaskDto.class);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to add completed task", ex);
        }
    }
    
    @Override
    public void deleteCompletedTask(CompletedTask completedTask) {
        throw new UnsupportedOperationException("deleteCompletedTask is not supported over REST");
    }
    
    @Override
    public void deleteCompletedTask(int id) {
        throw new UnsupportedOperationException("deleteCompletedTask is not supported over REST");
    }
    
    @Override
    public CompletedTask getCompletedTask(int id) {
        throw new UnsupportedOperationException("Lookup by id is not supported over REST");
    }
    
    @Override
    public List<CompletedTask> getCompletedTaskByUserId(int userId) throws SQLException {
        try {
            var response = client.get()
                .uri(uriBuilder -> uriBuilder
                    .path("/api/completed-tasks")
                    .queryParam("userId", userId)
                    .build())
                .retrieve()
                .body(CompletedTaskDto[].class);
            
            return Optional.ofNullable(response)
                .map(arr -> Arrays.stream(arr)
                    .map(RestDtoMapper::toCompletedTask)
                    .toList())
                .orElse(List.of());
        } catch (RestClientException ex) {
            throw new SQLException("Failed to load completed tasks by user: " + userId, ex);
        }
    }
    
    @Override
    public CompletedTask getCompletedTaskByUserIdByTaskId(int userId, int taskId) throws SQLException {
        try {
            return Optional.ofNullable(
                    client.get()
                        .uri("/api/completed-tasks/{userId}/{taskId}", userId, taskId)
                        .retrieve()
                        .body(CompletedTaskDto.class)
                )
                .map(RestDtoMapper::toCompletedTask)
                .orElse(null);
        } catch (RestClientException ex) {
            return null; // Not found is expected
        }
    }
    
    @Override
    public List<CompletedTask> getAllCompletedTask() {
        throw new UnsupportedOperationException("Fetching all completed tasks is not supported over REST");
    }
    
    private static Long toLong(Integer value) {
        return Optional.ofNullable(value)
            .map(Integer::longValue)
            .orElse(null);
    }
}
