package com.posadskiy.swingteacherdesktop.dao;

import com.posadskiy.swingteacherdesktop.tables.Shorthand;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author DPosadsky
 */
public interface ShorthandDao {

    public void addShorthand(Shorthand shorthand) throws SQLException;

    public void deleteShorthand(Shorthand shorthand) throws SQLException;

    public void deleteShorthand(int id) throws SQLException;

    public Shorthand getShorthand(int id) throws SQLException;

    public List<Shorthand> getAllShorthands() throws SQLException;

}
