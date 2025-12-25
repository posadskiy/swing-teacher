package com.posadskiy.swingteacherdesktop.domain.repository;

import com.posadskiy.swingteacherdesktop.domain.model.Keyword;

import java.sql.SQLException;
import java.util.List;

/**
 * Repository interface for Keyword entities.
 */
public interface KeywordRepository {

    List<Keyword> getAllKeywords() throws SQLException;
}

