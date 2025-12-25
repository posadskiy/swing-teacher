package com.posadskiy.swingteacherdesktop.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Comprehensive unit tests for CodeChecker class to verify its logic.
 */
class CodeCheckerTest {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    // ============================================================================
    // Tests for check() method - Main validation logic
    // ============================================================================

    @Test
    void testCheck_NullSolutions_ReturnsEmpty() {
        ArrayList<CheckerResult> results = checker.check(null, null);
        assertTrue(results.isEmpty(), "Both null should return empty list");
    }

    @Test
    void testCheck_EmptySolutions_ReturnsEmpty() {
        ArrayList<CheckerResult> results = checker.check("", "");
        assertTrue(results.isEmpty(), "Both empty should return empty list");
    }

    @Test
    void testCheck_SimpleButtonCreation_ShouldPass() {
        String rightSolution = "JButton-add";
        String userSolution = "JButton button = new JButton();\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "Simple button creation with add should pass");
    }

    @Test
    void testCheck_ButtonWithSetText_ShouldPass() {
        String rightSolution = "JButton-setText,add";
        String userSolution = "JButton button = new JButton();\nbutton.setText(\"Hi\");\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "Button with setText and add should pass");
    }

    @Test
    void testCheck_ButtonWithSetBackground_ShouldPass() {
        String rightSolution = "JButton-setBackground,add";
        String userSolution = "JButton button = new JButton();\nbutton.setBackground(Color.YELLOW);\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "Button with setBackground and add should pass");
    }

    @Test
    void testCheck_ButtonWithSetSize_ShouldPass() {
        String rightSolution = "JButton-setSize,add";
        String userSolution = "JButton button = new JButton();\nbutton.setSize(320, 200);\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "Button with setSize and add should pass");
    }

    @Test
    void testCheck_MissingConstructor_ShouldFailWithErrorCode3() {
        String rightSolution = "JButton-add";
        String userSolution = "add(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertEquals(1, results.size(), "Should have one error");
        assertEquals("JButton", results.get(0).getClassName());
        assertEquals(3, results.get(0).getErrorCode(), "Missing constructor should return error code 3");
    }

    @Test
    void testCheck_MissingMethod_ShouldFailWithErrorCode2() {
        String rightSolution = "JButton-setText,add";
        String userSolution = "JButton button = new JButton();\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertEquals(1, results.size(), "Should have one error");
        assertEquals("JButton", results.get(0).getClassName());
        assertEquals(2, results.get(0).getErrorCode(), "Missing required method should return error code 2");
    }

    @Test
    void testCheck_WrongMethod_ShouldFailWithErrorCode1() {
        String rightSolution = "JButton-setText,add";
        String userSolution = "JButton button = new JButton();\nbutton.setBackground(Color.RED);\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertEquals(1, results.size(), "Should have one error");
        assertEquals("JButton", results.get(0).getClassName());
        assertEquals(1, results.get(0).getErrorCode(), "Wrong method should return error code 1");
    }

    @Test
    void testCheck_MultipleComponents_ShouldPass() {
        String rightSolution = "JButton-add;JLabel-add";
        String userSolution = "JButton button = new JButton();\nJLabel label = new JLabel();\nadd(button);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "Multiple components should pass");
    }

    @Test
    void testCheck_ComponentWithExtraWhitespace_ShouldPass() {
        String rightSolution = "JButton-setText,add";
        String userSolution = "JButton  button  =  new  JButton( ) ;\n  button.setText( \"Hi\" ) ;\n  add( button ) ;";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "Extra whitespace should be handled correctly");
    }

    @Test
    void testCheck_ComponentWithDifferentVariableName_ShouldPass() {
        String rightSolution = "JButton-setText,add";
        String userSolution = "JButton btn = new JButton();\nbtn.setText(\"Hi\");\nadd(btn);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "Different variable name should be accepted");
    }

    @Test
    void testCheck_AddWithLayoutConstraint_ShouldPass() {
        String rightSolution = "JButton-add";
        String userSolution = "JButton button = new JButton();\nadd(button, BorderLayout.NORTH);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "add() with layout constraint should pass");
    }

    @Test
    void testCheck_ComponentWithoutRequiredMethods_ShouldFail() {
        String rightSolution = "JButton-setText,setBackground,add";
        String userSolution = "JButton button = new JButton();\nbutton.setText(\"Hi\");\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertEquals(1, results.size(), "Should have one error");
        assertEquals(2, results.get(0).getErrorCode(), "Missing setBackground should return error code 2");
    }

    @Test
    void testCheck_ComponentWithOnlyConstructor_ShouldFail() {
        String rightSolution = "JButton-setText,add";
        String userSolution = "JButton button = new JButton();";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertEquals(1, results.size(), "Should have one error");
        assertEquals(2, results.get(0).getErrorCode(), "Missing methods should return error code 2");
    }

    @Test
    void testCheck_ComponentWithExtraMethods_ShouldPass() {
        String rightSolution = "JButton-setText,add";
        String userSolution = "JButton button = new JButton();\nbutton.setText(\"Hi\");\nbutton.setBackground(Color.RED);\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "Extra methods should not cause failure");
    }

    // ============================================================================
    // Tests for checkMini() method
    // ============================================================================

    @Test
    void testCheckMini_ExactMatch_ShouldReturn0() {
        String rightSolution = "setText,add";
        String userSolution = "setText(\"Hi\");add(button);";

        int result = checker.checkMini(rightSolution, userSolution);

        assertEquals(0, result, "Exact match should return 0");
    }

    @Test
    void testCheckMini_WrongOrder_ShouldReturn0() {
        String rightSolution = "setText,add";
        String userSolution = "add(button);setText(\"Hi\");";

        int result = checker.checkMini(rightSolution, userSolution);

        assertEquals(0, result, "Wrong order should still return 0");
    }

    @Test
    void testCheckMini_WrongCount_ShouldReturn1() {
        String rightSolution = "setText,add";
        String userSolution = "setText(\"Hi\");";

        int result = checker.checkMini(rightSolution, userSolution);

        assertEquals(1, result, "Wrong count should return 1");
    }

    @Test
    void testCheckMini_MissingMethod_ShouldReturn2() {
        String rightSolution = "setText,setBackground,add";
        String userSolution = "setText(\"Hi\");add(button);";

        int result = checker.checkMini(rightSolution, userSolution);

        assertEquals(2, result, "Missing method should return 2");
    }

    @Test
    void testCheckMini_ExtraMethods_ShouldReturn0() {
        String rightSolution = "setText,add";
        String userSolution = "setText(\"Hi\");setBackground(Color.RED);add(button);";

        int result = checker.checkMini(rightSolution, userSolution);

        assertEquals(0, result, "Extra methods should still return 0");
    }

    // ============================================================================
    // Tests for checkHelper() method
    // ============================================================================

    @Test
    void testCheckHelper_ExactMatch_ShouldReturnTrue() {
        boolean result = checker.checkHelper("setText", "setText(\"Hi\")");
        assertTrue(result, "Exact match should return true");
    }

    @Test
    void testCheckHelper_WithWhitespace_ShouldReturnTrue() {
        boolean result = checker.checkHelper("setText", "setText( \"Hi\" )");
        assertTrue(result, "Whitespace in parameters should be accepted");
    }

    @Test
    void testCheckHelper_WrongMethod_ShouldReturnFalse() {
        boolean result = checker.checkHelper("setText", "setBackground(Color.RED)");
        assertFalse(result, "Wrong method should return false");
    }

    @Test
    void testCheckHelper_EmptyParams_ShouldReturnTrue() {
        boolean result = checker.checkHelper("setText", "setText()");
        assertTrue(result, "Empty parameters should be accepted");
    }

    @Test
    void testCheckHelper_ComplexParams_ShouldReturnTrue() {
        boolean result = checker.checkHelper("setSize", "setSize(320, 200)");
        assertTrue(result, "Complex parameters should be accepted");
    }

    // ============================================================================
    // Tests for checkLogin() method
    // ============================================================================

    @Test
    void testCheckLogin_ValidLogin_ShouldReturnTrue() {
        assertTrue(checker.checkLogin("user123"), "Valid login should return true");
        assertTrue(checker.checkLogin("test_user"), "Valid login with underscore should return true");
        assertTrue(checker.checkLogin("abc"), "Minimum length login should return true");
    }

    @Test
    void testCheckLogin_InvalidLogin_ShouldReturnFalse() {
        assertFalse(checker.checkLogin("ab"), "Too short login should return false");
        assertFalse(checker.checkLogin("user-name"), "Login with dash should return false");
        assertFalse(checker.checkLogin("user name"), "Login with space should return false");
        assertFalse(checker.checkLogin(""), "Empty login should return false");
    }

    // ============================================================================
    // Tests for checkPassword() method
    // ============================================================================

    @Test
    void testCheckPassword_ValidPassword_ShouldReturnTrue() {
        assertTrue(checker.checkPassword("password123", "password123"), 
            "Valid matching passwords should return true");
        assertTrue(checker.checkPassword("p".repeat(6), "p".repeat(6)), 
            "Minimum length password should return true");
    }

    @Test
    void testCheckPassword_Mismatched_ShouldReturnFalse() {
        assertFalse(checker.checkPassword("password123", "password456"), 
            "Mismatched passwords should return false");
    }

    @Test
    void testCheckPassword_TooShort_ShouldReturnFalse() {
        assertFalse(checker.checkPassword("short", "short"), 
            "Too short password should return false");
    }

    // ============================================================================
    // Tests for checkEMail() method
    // ============================================================================

    @Test
    void testCheckEMail_ValidEmail_ShouldReturnTrue() {
        assertTrue(checker.checkEMail("test@example.com"), "Valid email should return true");
        assertTrue(checker.checkEMail("user.name@domain.co.uk"), "Valid email with dots should return true");
    }

    @Test
    void testCheckEMail_InvalidEmail_ShouldReturnFalse() {
        assertFalse(checker.checkEMail("notanemail"), "Missing @ should return false");
        assertFalse(checker.checkEMail("@example.com"), "Missing local part should return false");
        assertFalse(checker.checkEMail("test@"), "Missing domain should return false");
        assertFalse(checker.checkEMail(""), "Empty email should return false");
    }

    // ============================================================================
    // Edge cases and potential bugs
    // ============================================================================

    @Test
    void testCheck_ComponentNameInString_ShouldNotMatch() {
        String rightSolution = "JButton-add";
        String userSolution = "String text = \"JButton is a class\";\nJButton button = new JButton();\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "JButton in string literal should not interfere");
    }

    @Test
    void testCheck_MultipleAddCalls_ShouldPass() {
        String rightSolution = "JButton-add";
        String userSolution = "JButton button = new JButton();\nadd(button);\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "Multiple add() calls should pass");
    }

    @Test
    void testCheck_ComponentWithComments_ShouldPass() {
        String rightSolution = "JButton-setText,add";
        String userSolution = "// Create button\nJButton button = new JButton();\n// Set text\nbutton.setText(\"Hi\");\n// Add to frame\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "Comments should not break validation");
    }

    @Test
    void testCheck_RealWorldExample_ButtonLesson1() {
        String rightSolution = "JButton-add";
        String userSolution = "JButton button = new JButton();\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "Real-world example should pass");
    }

    @Test
    void testCheck_RealWorldExample_ButtonLesson2() {
        String rightSolution = "JButton-setText,add";
        String userSolution = "JButton button = new JButton();\nbutton.setText(\"Let's go!\");\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "Real-world example with setText should pass");
    }

    @Test
    void testCheck_RealWorldExample_ButtonLesson3() {
        String rightSolution = "JButton-setBackground,add";
        String userSolution = "JButton button = new JButton();\nbutton.setBackground(Color.YELLOW);\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "Real-world example with setBackground should pass");
    }

    @Test
    void testCheck_RealWorldExample_ButtonLesson5() {
        String rightSolution = "JButton-setSize,add";
        String userSolution = "JButton button = new JButton();\nbutton.setSize(320, 200);\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);

        assertTrue(results.isEmpty(), "Real-world example with setSize should pass");
    }
}

