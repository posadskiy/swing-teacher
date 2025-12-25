package com.posadskiy.swingteacherdesktop.dao;

import com.posadskiy.swingteacherdesktop.tables.Task;

import java.sql.SQLException;
import java.util.List;

public interface TaskDao {

    public void addTask(Task task) throws SQLException;

    public void deleteTask(Task task) throws SQLException;

    public void deleteTask(int id) throws SQLException;

    public Task getTask(int id) throws SQLException;

    public List<Task> getTasks() throws SQLException;

    public List<Task> getTasksByLesson(int lesson) throws SQLException;

}
