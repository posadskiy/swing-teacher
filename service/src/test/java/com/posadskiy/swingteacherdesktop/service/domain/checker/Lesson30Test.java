package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson30Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JScrollPane-add";
        String userSolution = "String[] columns = {\"Name\", \"Age\"};\nString[][] data = {{\"Иван\", \"25\"}, {\"Мария\", \"30\"}};\nJTable table = new JTable(data, columns);\nJScrollPane scrollPane = new JScrollPane(table);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

