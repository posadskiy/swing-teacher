package com.posadskiy.swingteacherdesktop.domain.repository;

import com.posadskiy.swingteacherdesktop.domain.model.Task;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

/**
 * Repository interface for Task entities.
 */
public interface TaskRepository {

    void addTask(Task task) throws SQLException;

    void deleteTask(Task task) throws SQLException;

    void deleteTask(int id) throws SQLException;

    Optional<Task> getTask(int id) throws SQLException;

    List<Task> getTasks() throws SQLException;

    List<Task> getTasksByLesson(int lesson) throws SQLException;
}


