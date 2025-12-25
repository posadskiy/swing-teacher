package com.posadskiy.swingteacherdesktop.domain.repository;

import com.posadskiy.swingteacherdesktop.domain.model.Documentation;

import java.sql.SQLException;
import java.util.Optional;

/**
 * Repository interface for Documentation entities.
 */
public interface DocumentationRepository {

    Optional<Documentation> getDocumentation(int id) throws SQLException;
}

