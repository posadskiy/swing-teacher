package com.posadskiy.swingteacherdesktop.domain.repository;

import com.posadskiy.swingteacherdesktop.domain.model.Lesson;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

/**
 * Repository interface for Lesson entities.
 */
public interface LessonRepository {

    void addLesson(Lesson lesson) throws SQLException;

    void deleteLesson(Lesson lesson) throws SQLException;

    void deleteLesson(int id) throws SQLException;

    Optional<Lesson> getLesson(int id) throws SQLException;

    List<Lesson> getLessons() throws SQLException;

    List<Lesson> getLessonsByCategory(int category) throws SQLException;
}


