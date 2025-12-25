package com.posadskiy.swingteacherdesktop.service;

import com.posadskiy.swingteacherdesktop.domain.request.AuthRequest;
import com.posadskiy.swingteacherdesktop.domain.request.RefreshTokenRequest;
import com.posadskiy.swingteacherdesktop.domain.request.RegisterRequest;
import com.posadskiy.swingteacherdesktop.domain.response.AuthResponse;
import com.posadskiy.swingteacherdesktop.domain.response.RefreshTokenResponse;
import com.posadskiy.swingteacherdesktop.utils.TokenStorage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

@Slf4j
@Service
public class AuthService {
    private final RestClient restClient;
    private final TokenStorage tokenStorage;

    public AuthService(RestClient restClient, TokenStorage tokenStorage) {
        this.restClient = restClient;
        this.tokenStorage = tokenStorage;
    }

    public boolean login(String login, String password) {
        try {
            AuthRequest request = new AuthRequest(login, password);
            log.debug("Attempting login for user: {}", login);
            AuthResponse response =
                restClient
                    .post()
                    .uri("/api/auth/login")
                    .contentType(org.springframework.http.MediaType.APPLICATION_JSON)
                    .accept(org.springframework.http.MediaType.APPLICATION_JSON)
                    .body(request)
                    .retrieve()
                    .body(AuthResponse.class);

            if (response != null) {
                tokenStorage.saveTokens(
                    response.accessToken(), response.refreshToken(), response.expiresAt());
                log.debug("Login successful for user: {}", login);
                return true;
            }
            log.warn("Login returned null response for user: {}", login);
            return false;
        } catch (HttpClientErrorException ex) {
            log.error("Login failed for user: {} with status: {} and body: {}",
                login, ex.getStatusCode(), ex.getResponseBodyAsString(), ex);
            if (ex.getStatusCode() == HttpStatus.UNAUTHORIZED) {
                return false;
            }
            throw new RuntimeException("Login failed", ex);
        } catch (RestClientException ex) {
            log.error("Login failed for user: {} due to client error", login, ex);
            throw new RuntimeException("Login failed", ex);
        }
    }

    public boolean register(String login, String password, String email) {
        try {
            RegisterRequest request = new RegisterRequest(login, password, email);
            AuthResponse response =
                restClient
                    .post()
                    .uri("/api/auth/register")
                    .contentType(org.springframework.http.MediaType.APPLICATION_JSON)
                    .body(request)
                    .retrieve()
                    .body(AuthResponse.class);

            if (response != null) {
                tokenStorage.saveTokens(
                    response.accessToken(), response.refreshToken(), response.expiresAt());
                return true;
            }
            return false;
        } catch (HttpClientErrorException ex) {
            if (ex.getStatusCode() == HttpStatus.BAD_REQUEST) {
                return false;
            }
            throw new RuntimeException("Registration failed", ex);
        } catch (RestClientException ex) {
            throw new RuntimeException("Registration failed", ex);
        }
    }

    public boolean refreshToken() {
        String refreshToken = tokenStorage.getRefreshToken();
        if (refreshToken == null) {
            return false;
        }

        try {
            RefreshTokenRequest request = new RefreshTokenRequest(refreshToken);
            RefreshTokenResponse response =
                restClient
                    .post()
                    .uri("/api/auth/refresh")
                    .contentType(org.springframework.http.MediaType.APPLICATION_JSON)
                    .body(request)
                    .retrieve()
                    .body(RefreshTokenResponse.class);

            if (response != null) {
                tokenStorage.saveTokens(
                    response.accessToken(),
                    response.refreshToken(),
                    response.expiresAt());
                return true;
            }
            return false;
        } catch (HttpClientErrorException ex) {
            if (ex.getStatusCode() == HttpStatus.UNAUTHORIZED) {
                tokenStorage.clear();
                return false;
            }
            throw new RuntimeException("Token refresh failed", ex);
        } catch (RestClientException ex) {
            throw new RuntimeException("Token refresh failed", ex);
        }
    }

    public void logout() {
        String refreshToken = tokenStorage.getRefreshToken();
        if (refreshToken != null) {
            try {
                RefreshTokenRequest request = new RefreshTokenRequest(refreshToken);
                restClient
                    .post()
                    .uri("/api/auth/logout")
                    .contentType(org.springframework.http.MediaType.APPLICATION_JSON)
                    .body(request)
                    .retrieve()
                    .toBodilessEntity();
            } catch (RestClientException ex) {
                // Ignore errors during logout
            }
        }
        tokenStorage.clear();
    }
}

