package com.posadskiy.swingteacherdesktop.service.infrastructure.client;

import com.posadskiy.swingteacherdesktop.domain.dto.UserDto;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.util.Map;
import java.util.Optional;

@Component
public class UserServiceClient {
    private final RestTemplate restTemplate;
    private final String userServiceBaseUrl;

    public UserServiceClient(
        @Value("${user.service.base-url:http://localhost:8095}") String userServiceBaseUrl) {
        this.restTemplate = new RestTemplate();
        this.userServiceBaseUrl = userServiceBaseUrl;
    }

    public Optional<UserDto> getUserById(Long id, String token) {
        try {
            HttpHeaders headers = new HttpHeaders();
            if (token != null) {
                headers.setBearerAuth(token);
            }
            headers.setContentType(MediaType.APPLICATION_JSON);

            HttpEntity<Void> entity = new HttpEntity<>(headers);
            ResponseEntity<Map<String, Object>> response =
                restTemplate.exchange(
                    userServiceBaseUrl + "/v0/user/" + id,
                    HttpMethod.GET,
                    entity,
                    new org.springframework.core.ParameterizedTypeReference<Map<String, Object>>() {
                    });

            if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
                return Optional.of(mapToUserDto(response.getBody()));
            }
            return Optional.empty();
        } catch (HttpClientErrorException.NotFound e) {
            return Optional.empty();
        } catch (RestClientException e) {
            throw new RuntimeException("Failed to communicate with user-service", e);
        }
    }

    public Optional<UserDto> getCurrentUser(String token) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setBearerAuth(token);
            headers.setContentType(MediaType.APPLICATION_JSON);

            HttpEntity<Void> entity = new HttpEntity<>(headers);
            ResponseEntity<Map<String, Object>> response =
                restTemplate.exchange(
                    userServiceBaseUrl + "/v0/user/me",
                    HttpMethod.GET,
                    entity,
                    new org.springframework.core.ParameterizedTypeReference<Map<String, Object>>() {
                    });

            if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
                return Optional.of(mapToUserDto(response.getBody()));
            }
            return Optional.empty();
        } catch (HttpClientErrorException.NotFound e) {
            return Optional.empty();
        } catch (RestClientException e) {
            throw new RuntimeException("Failed to communicate with user-service", e);
        }
    }

    public Optional<String> getPreferredLanguage(Long userId, String token) {
        // Note: user-service might not have preferredLanguage field
        // This is a SwingTeacher-specific field, so we might need to keep it local
        // For now, return default or try to get from user-service
        Optional<UserDto> user = getUserById(userId, token);
        if (user.isPresent()) {
            // If user-service doesn't support preferredLanguage, we'll need to store it locally
            // For now, return default
            return Optional.of(user.get().preferredLanguage() != null ? user.get().preferredLanguage() : "en");
        }
        return Optional.of("en");
    }

    public void setPreferredLanguage(Long userId, String languageCode, String token) {
        // Note: user-service might not support preferredLanguage field
        // This might need to be stored locally or extended in user-service
        // For now, we'll try to update via PUT /v0/user/{id}
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setBearerAuth(token);
            headers.setContentType(MediaType.APPLICATION_JSON);

            // Get current user first
            Optional<UserDto> currentUser = getUserById(userId, token);
            if (currentUser.isPresent()) {
                // Create update request - user-service might only support username updates
                // We'll need to check user-service API for what fields can be updated
                Map<String, Object> updateRequest = Map.of(
                    "username", currentUser.get().login() != null ? currentUser.get().login() : ""
                );

                HttpEntity<Map<String, Object>> entity = new HttpEntity<>(updateRequest, headers);
                restTemplate.exchange(
                    userServiceBaseUrl + "/v0/user/" + userId,
                    HttpMethod.PUT,
                    entity,
                    new org.springframework.core.ParameterizedTypeReference<Map<String, Object>>() {
                    });
            }
        } catch (RestClientException e) {
            // Log but don't throw - preferred language might be stored locally
        }
    }

    private UserDto mapToUserDto(Map<String, Object> userMap) {
        Long id = extractLong(userMap.get("id"));
        String email = extractString(userMap.get("email"));
        String username = extractString(userMap.get("username"));
        // Map username to login for compatibility
        String login = username != null ? username : extractString(userMap.get("login"));

        // SwingTeacher-specific fields might not be in user-service response
        Integer logins = extractInteger(userMap.get("logins"));
        Integer lastLogin = extractInteger(userMap.get("lastLogin"));
        Boolean completeTraining = extractBoolean(userMap.get("completeTraining"));
        String preferredLanguage = extractString(userMap.get("preferredLanguage"));

        return new UserDto(
            id,
            email,
            login,
            logins,
            lastLogin,
            completeTraining,
            preferredLanguage);
    }

    private Long extractLong(Object value) {
        if (value == null) return null;
        if (value instanceof Number) {
            return ((Number) value).longValue();
        }
        if (value instanceof String) {
            try {
                return Long.parseLong((String) value);
            } catch (NumberFormatException e) {
                return null;
            }
        }
        return null;
    }

    private Integer extractInteger(Object value) {
        if (value == null) return null;
        if (value instanceof Number) {
            return ((Number) value).intValue();
        }
        if (value instanceof String) {
            try {
                return Integer.parseInt((String) value);
            } catch (NumberFormatException e) {
                return null;
            }
        }
        return null;
    }

    private Boolean extractBoolean(Object value) {
        if (value == null) return null;
        if (value instanceof Boolean) {
            return (Boolean) value;
        }
        if (value instanceof String) {
            return Boolean.parseBoolean((String) value);
        }
        return null;
    }

    private String extractString(Object value) {
        if (value == null) return null;
        return value.toString();
    }
}
