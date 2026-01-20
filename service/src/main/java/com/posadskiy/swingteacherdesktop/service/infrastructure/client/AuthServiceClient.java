package com.posadskiy.swingteacherdesktop.service.infrastructure.client;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.posadskiy.swingteacherdesktop.domain.request.AuthRequest;
import com.posadskiy.swingteacherdesktop.domain.request.RefreshTokenRequest;
import com.posadskiy.swingteacherdesktop.domain.request.RegisterRequest;
import com.posadskiy.swingteacherdesktop.domain.response.AuthResponse;
import com.posadskiy.swingteacherdesktop.domain.response.RefreshTokenResponse;
import com.posadskiy.swingteacherdesktop.service.infrastructure.client.dto.AuthServiceResponse;
import com.posadskiy.swingteacherdesktop.service.infrastructure.client.dto.AuthServiceUserResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.time.Instant;
import java.util.Base64;
import java.util.Map;
import java.util.Optional;

@Component
public class AuthServiceClient {
    private final RestTemplate restTemplate;
    private final String authServiceBaseUrl;

    public AuthServiceClient(
        @Value("${auth.service.base-url:http://localhost:8100}") String authServiceBaseUrl) {
        this.restTemplate = new RestTemplate();
        this.authServiceBaseUrl = authServiceBaseUrl;
    }

    public Optional<AuthResponse> login(AuthRequest request) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            HttpEntity<AuthRequest> entity = new HttpEntity<>(request, headers);
            ResponseEntity<AuthServiceResponse> response =
                restTemplate.exchange(
                    authServiceBaseUrl + "/login",
                    HttpMethod.POST,
                    entity,
                    AuthServiceResponse.class);

            if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
                AuthServiceResponse authServiceResponse = response.getBody();

                // Convert expires_in (milliseconds) to expiresAt (Instant)
                Instant expiresAt = authServiceResponse.expiresIn() != null
                    ? Instant.now().plusMillis(authServiceResponse.expiresIn())
                    : Instant.now().plusSeconds(3600); // Default to 1 hour

                return Optional.of(new AuthResponse(
                    authServiceResponse.accessToken(),
                    authServiceResponse.refreshToken(),
                    expiresAt));
            }
            return Optional.empty();
        } catch (HttpClientErrorException e) {
            return Optional.empty();
        } catch (RestClientException e) {
            throw new RuntimeException("Failed to communicate with auth-service", e);
        }
    }

    public Optional<AuthResponse> register(RegisterRequest request) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            HttpEntity<RegisterRequest> entity = new HttpEntity<>(request, headers);
            ResponseEntity<Map<String, Object>> response =
                restTemplate.exchange(
                    authServiceBaseUrl + "/users",
                    HttpMethod.POST,
                    entity,
                    new org.springframework.core.ParameterizedTypeReference<Map<String, Object>>() {
                    });

            if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
                // After registration, login the user
                return login(new AuthRequest(request.login(), request.password()));
            }
            return Optional.empty();
        } catch (HttpClientErrorException e) {
            return Optional.empty();
        } catch (RestClientException e) {
            throw new RuntimeException("Failed to communicate with auth-service", e);
        }
    }

    public Optional<RefreshTokenResponse> refreshToken(String refreshToken) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            RefreshTokenRequest request = new RefreshTokenRequest(refreshToken);
            HttpEntity<RefreshTokenRequest> entity = new HttpEntity<>(request, headers);
            ResponseEntity<AuthServiceResponse> response =
                restTemplate.exchange(
                    authServiceBaseUrl + "/refresh",
                    HttpMethod.POST,
                    entity,
                    AuthServiceResponse.class);

            if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
                AuthServiceResponse authServiceResponse = response.getBody();

                // Convert expires_in (milliseconds) to expiresAt (Instant)
                Instant expiresAt = authServiceResponse.expiresIn() != null
                    ? Instant.now().plusMillis(authServiceResponse.expiresIn())
                    : Instant.now().plusSeconds(3600); // Default to 1 hour

                return Optional.of(
                    new RefreshTokenResponse(
                        authServiceResponse.accessToken(),
                        authServiceResponse.refreshToken(),
                        expiresAt));
            }
            return Optional.empty();
        } catch (HttpClientErrorException e) {
            return Optional.empty();
        } catch (RestClientException e) {
            throw new RuntimeException("Failed to communicate with auth-service", e);
        }
    }

    public void logout(String refreshToken) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            RefreshTokenRequest request = new RefreshTokenRequest(refreshToken);
            HttpEntity<RefreshTokenRequest> entity = new HttpEntity<>(request, headers);
            restTemplate.exchange(
                authServiceBaseUrl + "/logout", HttpMethod.POST, entity, Void.class);
        } catch (RestClientException e) {
            // Log but don't throw - logout is best effort
        }
    }

    public boolean validateToken(String token) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setBearerAuth(token);
            headers.setContentType(MediaType.APPLICATION_JSON);

            HttpEntity<Void> entity = new HttpEntity<>(headers);
            ResponseEntity<AuthServiceUserResponse> response =
                restTemplate.exchange(
                    authServiceBaseUrl + "/users/me",
                    HttpMethod.GET,
                    entity,
                    AuthServiceUserResponse.class);

            return response.getStatusCode().is2xxSuccessful();
        } catch (HttpClientErrorException e) {
            return false;
        } catch (RestClientException e) {
            // If validation fails, assume token is invalid
            return false;
        }
    }

    public Optional<Long> getUserIdFromToken(String token) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setBearerAuth(token);
            headers.setContentType(MediaType.APPLICATION_JSON);

            HttpEntity<Void> entity = new HttpEntity<>(headers);
            ResponseEntity<AuthServiceUserResponse> response =
                restTemplate.exchange(
                    authServiceBaseUrl + "/users/me",
                    HttpMethod.GET,
                    entity,
                    AuthServiceUserResponse.class);

            if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
                AuthServiceUserResponse body = response.getBody();
                Optional<Long> idFromBody = parseLongSafely(body.id())
                    .or(() -> parseLongSafely(body.username()));
                if (idFromBody.isPresent()) {
                    return idFromBody;
                }
            }
            return parseUserIdFromJwt(token);
        } catch (Exception e) {
            return parseUserIdFromJwt(token);
        }
    }

    private Optional<Long> parseUserIdFromJwt(String token) {
        try {
            String[] parts = token.split("\\.");
            if (parts.length < 2) {
                return Optional.empty();
            }
            byte[] decoded = Base64.getUrlDecoder().decode(parts[1]);
            String payloadJson = new String(decoded);
            ObjectMapper mapper = new ObjectMapper();
            @SuppressWarnings("unchecked")
            Map<String, Object> payload = mapper.readValue(payloadJson, Map.class);
            Object sub = payload.get("sub");
            return parseLongSafely(sub);
        } catch (Exception e) {
            return Optional.empty();
        }
    }

    private Optional<Long> parseLongSafely(Object value) {
        if (value == null) {
            return Optional.empty();
        }
        if (value instanceof Number) {
            return Optional.of(((Number) value).longValue());
        }
        try {
            return Optional.of(Long.parseLong(value.toString()));
        } catch (NumberFormatException e) {
            return Optional.empty();
        }
    }
}
