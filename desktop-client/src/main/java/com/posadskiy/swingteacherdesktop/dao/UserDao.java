package com.posadskiy.swingteacherdesktop.dao;


import com.posadskiy.swingteacherdesktop.tables.User;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author DPosadsky
 */
public interface UserDao {

    public void addUser(User user) throws SQLException;

    public void deleteUser(User user) throws SQLException;

    public void deleteUser(int id) throws SQLException;

    public User getUserById(int id) throws SQLException;

    public User getUserByLoginAndPassword(String login, String pass) throws SQLException;

    public List<User> getUsers() throws SQLException;

}
