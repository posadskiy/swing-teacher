package com.posadskiy.swingteacherdesktop.domain.repository;

import com.posadskiy.swingteacherdesktop.domain.model.User;

import java.sql.SQLException;
import java.util.Optional;

/**
 * Repository interface for User entities.
 */
public interface UserRepository {

    void addUser(User user) throws SQLException;

    void deleteUser(User user) throws SQLException;

    void deleteUser(int id) throws SQLException;

    Optional<User> getUser(int id) throws SQLException;

    Optional<User> getUserByLogin(String login) throws SQLException;

    Optional<User> getUserByLoginAndPassword(String login, String password) throws SQLException;
}

