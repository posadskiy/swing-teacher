package com.posadskiy.swingteacherdesktop.service.web;

import com.posadskiy.swingteacherdesktop.domain.dto.UserDto;
import com.posadskiy.swingteacherdesktop.service.infrastructure.client.UserServiceClient;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
public class UserController {
    private final UserServiceClient userServiceClient;

    public UserController(UserServiceClient userServiceClient) {
        this.userServiceClient = userServiceClient;
    }

    @GetMapping("/me")
    public ResponseEntity<UserDto> getCurrentUser(
        Authentication authentication, HttpServletRequest request) {
        if (authentication == null || authentication.getPrincipal() == null) {
            return ResponseEntity.status(401).build();
        }
        try {
        Long userId = Long.parseLong(authentication.getPrincipal().toString());
            String token = extractToken(request);
            return userServiceClient
                .getUserById(userId, token)
            .map(ResponseEntity::ok)
            .orElseGet(() -> ResponseEntity.notFound().build());
        } catch (NumberFormatException e) {
            return ResponseEntity.status(401).build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<UserDto> getUser(
        @PathVariable("id") Long id, HttpServletRequest request) {
        String token = extractToken(request);
        return userServiceClient
            .getUserById(id, token)
            .map(ResponseEntity::ok)
            .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PutMapping("/me/language")
    public ResponseEntity<Void> updatePreferredLanguage(
        @RequestParam("lang") String languageCode,
        Authentication authentication,
        HttpServletRequest request) {
        if (authentication == null || authentication.getPrincipal() == null) {
            return ResponseEntity.status(401).build();
        }
        try {
            Long userId = Long.parseLong(authentication.getPrincipal().toString());
            String token = extractToken(request);
            userServiceClient.setPreferredLanguage(userId, languageCode, token);
            return ResponseEntity.ok().build();
        } catch (NumberFormatException e) {
            return ResponseEntity.status(401).build();
        }
    }

    private String extractToken(HttpServletRequest request) {
        String authHeader = request.getHeader("Authorization");
        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            return authHeader.substring(7);
        }
        return null;
    }
}

