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

public class CompletedTaskDaoRest implements CompletedTaskDao {
    private final RestClient client;

    public CompletedTaskDaoRest(RestClient client) {
        this.client = client;
    }

    @Override
    public void addCompletedTask(CompletedTask completedTask) throws SQLException {
        CompletedTaskRequest request = new CompletedTaskRequest(
            completedTask.getUserId() == null ? null : completedTask.getUserId().longValue(),
            completedTask.getTaskId() == null ? null : completedTask.getTaskId().longValue());
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
    public List<CompletedTask> getCompletedTaskByUserId(int id) throws SQLException {
        try {
            CompletedTaskDto[] response = client.get()
                .uri(uriBuilder -> uriBuilder.path("/api/completed-tasks")
                    .queryParam("userId", id)
                    .build())
                .retrieve()
                .body(CompletedTaskDto[].class);

            return response == null ? List.of() : Arrays.stream(response)
                .map(RestDtoMapper::toCompletedTask)
                .toList();
        } catch (RestClientException ex) {
            throw new SQLException("Failed to load completed tasks by user", ex);
        }
    }

    @Override
    public CompletedTask getCompletedTaskByUserIdByTaskId(int userId, int taskId) throws SQLException {
        try {
            CompletedTaskDto response = client.get()
                .uri("/api/completed-tasks/{userId}/{taskId}", userId, taskId)
                .retrieve()
                .body(CompletedTaskDto.class);
            return RestDtoMapper.toCompletedTask(response);
        } catch (RestClientException ex) {
            return null;
        }
    }

    @Override
    public List<CompletedTask> getAllCompletedTask() {
        throw new UnsupportedOperationException("Fetching all completed tasks is not supported over REST");
    }
}

