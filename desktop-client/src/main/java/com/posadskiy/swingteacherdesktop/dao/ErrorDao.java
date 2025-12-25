package com.posadskiy.swingteacherdesktop.dao;

import com.posadskiy.swingteacherdesktop.tables.Error;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author DPosadsky
 */
public interface ErrorDao {

    public void addError(Error error) throws SQLException;

    public void deleteError(Error error) throws SQLException;

    public void deleteError(int id) throws SQLException;

    public Error getError(int id) throws SQLException;

    public List<Error> getAllErrors() throws SQLException;

}
