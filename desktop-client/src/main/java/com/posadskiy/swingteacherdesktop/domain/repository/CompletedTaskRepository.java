package com.posadskiy.swingteacherdesktop.domain.repository;

import com.posadskiy.swingteacherdesktop.domain.model.CompletedTask;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

/**
 * Repository interface for CompletedTask entities.
 */
public interface CompletedTaskRepository {

    void addCompletedTask(CompletedTask completedTask) throws SQLException;

    Optional<CompletedTask> getCompletedTaskByUserIdByTaskId(int userId, int taskId) throws SQLException;

    List<CompletedTask> getCompletedTaskByUserId(int userId) throws SQLException;
}


