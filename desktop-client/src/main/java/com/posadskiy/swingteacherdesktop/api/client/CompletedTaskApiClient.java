package com.posadskiy.swingteacherdesktop.api.client;

import com.posadskiy.swingteacherdesktop.api.mapper.DtoMapper;
import com.posadskiy.swingteacherdesktop.domain.dto.CompletedTaskDto;
import com.posadskiy.swingteacherdesktop.domain.model.CompletedTask;
import com.posadskiy.swingteacherdesktop.domain.repository.CompletedTaskRepository;
import com.posadskiy.swingteacherdesktop.domain.request.CompletedTaskRequest;
import org.springframework.http.MediaType;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

/**
 * REST API client for CompletedTask operations.
 */
public class CompletedTaskApiClient implements CompletedTaskRepository {
    
    private final RestClient client;
    
    public CompletedTaskApiClient(RestClient client) {
        this.client = client;
    }
    
    @Override
    public void addCompletedTask(CompletedTask completedTask) throws SQLException {
        try {
            var request = new CompletedTaskRequest(
                completedTask.userId() != null ? completedTask.userId().longValue() : null,
                completedTask.taskId() != null ? completedTask.taskId().longValue() : null
            );
            
            client.post()
                .uri("/api/completed-tasks")
                .contentType(MediaType.APPLICATION_JSON)
                .body(request)
                .retrieve()
                .toBodilessEntity();
        } catch (RestClientException ex) {
            throw new SQLException("Failed to add completed task", ex);
        }
    }
    
    @Override
    public Optional<CompletedTask> getCompletedTaskByUserIdByTaskId(int userId, int taskId) throws SQLException {
        try {
            var response = client.get()
                .uri(uriBuilder -> uriBuilder
                    .path("/api/completed-tasks")
                    .queryParam("userId", userId)
                    .queryParam("taskId", taskId)
                    .build())
                .retrieve()
                .body(CompletedTaskDto.class);
            
            return Optional.ofNullable(response)
                .map(DtoMapper::toCompletedTask);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch completed task", ex);
        }
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
                    .map(DtoMapper::toCompletedTask)
                    .toList())
                .orElse(List.of());
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch completed tasks for user: " + userId, ex);
        }
    }
}

