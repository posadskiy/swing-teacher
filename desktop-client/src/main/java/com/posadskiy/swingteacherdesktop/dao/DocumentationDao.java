package com.posadskiy.swingteacherdesktop.dao;

import com.posadskiy.swingteacherdesktop.tables.Documentation;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author DPosadsky
 */
public interface DocumentationDao {

    public void addDocumentation(Documentation documentation) throws SQLException;

    public void deleteDocumentation(Documentation documentation) throws SQLException;

    public void deleteDocumentation(int id) throws SQLException;

    public Documentation getDocumentation(int id) throws SQLException;

    public List<Documentation> getAllDocumentation() throws SQLException;

}
