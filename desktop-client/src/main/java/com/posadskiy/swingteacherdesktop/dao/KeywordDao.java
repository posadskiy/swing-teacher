package com.posadskiy.swingteacherdesktop.dao;

import com.posadskiy.swingteacherdesktop.tables.Keyword;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author DPosadsky
 */
public interface KeywordDao {

    public void addKeyword(Keyword keyword) throws SQLException;

    public void deleteKeyword(Keyword keyword) throws SQLException;

    public void deleteKeyword(int id) throws SQLException;

    public Keyword getKeyword(int id) throws SQLException;

    public List<Keyword> getAllKeywords() throws SQLException;

}
