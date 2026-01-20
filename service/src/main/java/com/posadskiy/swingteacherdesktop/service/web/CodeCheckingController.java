package com.posadskiy.swingteacherdesktop.service.web;

import com.posadskiy.swingteacherdesktop.domain.dto.CheckerResultDto;
import com.posadskiy.swingteacherdesktop.domain.request.CodeCheckRequest;
import com.posadskiy.swingteacherdesktop.domain.request.ValidationRequest;
import com.posadskiy.swingteacherdesktop.service.application.CodeCheckingService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/code-checking")
public class CodeCheckingController {

    private final CodeCheckingService codeCheckingService;

    public CodeCheckingController(CodeCheckingService codeCheckingService) {
        this.codeCheckingService = codeCheckingService;
    }

    @PostMapping("/check")
    public List<CheckerResultDto> checkCode(@RequestBody CodeCheckRequest request) {
        // Handle null/blank solutions - convert to empty strings
        String expectedSolution = request.expectedSolution() != null ? request.expectedSolution() : "";
        String userSolution = request.userSolution() != null ? request.userSolution() : "";
        return codeCheckingService.checkCode(expectedSolution, userSolution);
    }

    @PostMapping("/validate/login")
    public boolean validateLogin(@Valid @RequestBody ValidationRequest request) {
        return codeCheckingService.isValidLogin(request.value());
    }

    @PostMapping("/validate/password")
    public boolean validatePassword(@Valid @RequestBody ValidationRequest request) {
        return codeCheckingService.isValidPassword(request.value(), request.value2());
    }

    @PostMapping("/validate/email")
    public boolean validateEmail(@Valid @RequestBody ValidationRequest request) {
        return codeCheckingService.isValidEmail(request.value());
    }
}

