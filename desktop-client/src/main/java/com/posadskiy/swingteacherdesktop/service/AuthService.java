package com.posadskiy.swingteacherdesktop.service;

import com.posadskiy.swingteacherdesktop.domain.request.AuthRequest;
import com.posadskiy.swingteacherdesktop.domain.request.RefreshTokenRequest;
import com.posadskiy.swingteacherdesktop.domain.request.RegisterRequest;
import com.posadskiy.swingteacherdesktop.domain.response.AuthResponse;
import com.posadskiy.swingteacherdesktop.domain.response.RefreshTokenResponse;
import com.posadskiy.swingteacherdesktop.utils.TokenStorage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.util.Optional;

/**
 * Modern authentication service using Optional and functional error handling.
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AuthService {
    
    private final RestClient restClient;
    private final TokenStorage tokenStorage;
    
    /**
     * Authenticates user and stores tokens.
     *
     * @return true if login successful, false otherwise
     */
    public boolean login(String login, String password) {
        log.debug("Attempting login for user: {}", login);
        
        return executeAuthRequest(
            new AuthRequest(login, password),
            "/api/auth/login"
        ).map(response -> {
            saveTokens(response);
            log.debug("Login successful for user: {}", login);
            return true;
        }).orElseGet(() -> {
            log.warn("Login failed for user: {}", login);
            return false;
        });
    }
    
    /**
     * Registers new user and stores tokens.
     *
     * @return true if registration successful, false otherwise
     */
    public boolean register(String login, String password, String email) {
        log.debug("Attempting registration for user: {}", login);
        
        return executeAuthRequest(
            new RegisterRequest(login, password, email),
            "/api/auth/register"
        ).map(response -> {
            saveTokens(response);
            log.debug("Registration successful for user: {}", login);
            return true;
        }).orElse(false);
    }
    
    /**
     * Refreshes the access token using the refresh token.
     *
     * @return true if refresh successful, false otherwise
     */
    public boolean refreshToken() {
        var refreshToken = tokenStorage.getRefreshToken();
        if (refreshToken == null) {
            log.debug("No refresh token available");
            return false;
        }
        
        try {
            var response = restClient.post()
                .uri("/api/auth/refresh")
                .contentType(MediaType.APPLICATION_JSON)
                .body(new RefreshTokenRequest(refreshToken))
                .retrieve()
                .body(RefreshTokenResponse.class);
            
            return Optional.ofNullable(response)
                .map(r -> {
                    tokenStorage.saveTokens(r.accessToken(), r.refreshToken(), r.expiresAt());
                    log.debug("Token refresh successful");
                    return true;
                })
                .orElse(false);
                
        } catch (HttpClientErrorException ex) {
            if (ex.getStatusCode() == HttpStatus.UNAUTHORIZED) {
                log.warn("Token refresh failed - unauthorized");
                tokenStorage.clear();
                return false;
            }
            log.error("Token refresh failed with status: {}", ex.getStatusCode(), ex);
            throw new AuthenticationException("Token refresh failed", ex);
        } catch (RestClientException ex) {
            log.error("Token refresh failed due to client error", ex);
            throw new AuthenticationException("Token refresh failed", ex);
        }
    }
    
    /**
     * Logs out the current user and clears tokens.
     */
    public void logout() {
        Optional.ofNullable(tokenStorage.getRefreshToken())
            .ifPresent(this::sendLogoutRequest);
        
        tokenStorage.clear();
        log.debug("User logged out");
    }
    
    /**
     * Checks if user has valid (non-expired) tokens.
     */
    public boolean hasValidSession() {
        return tokenStorage.hasValidTokens();
    }
    
    private Optional<AuthResponse> executeAuthRequest(Object request, String uri) {
        try {
            var response = restClient.post()
                .uri(uri)
                .contentType(MediaType.APPLICATION_JSON)
                .accept(MediaType.APPLICATION_JSON)
                .body(request)
                .retrieve()
                .body(AuthResponse.class);
            
            return Optional.ofNullable(response);
            
        } catch (HttpClientErrorException ex) {
            var status = ex.getStatusCode();
            if (status == HttpStatus.UNAUTHORIZED || status == HttpStatus.BAD_REQUEST) {
                log.debug("Auth request failed with status: {}", status);
                return Optional.empty();
            }
            log.error("Auth request failed with status: {} and body: {}", 
                ex.getStatusCode(), ex.getResponseBodyAsString(), ex);
            throw new AuthenticationException("Authentication failed", ex);
        } catch (RestClientException ex) {
            log.error("Auth request failed due to client error", ex);
            throw new AuthenticationException("Authentication failed", ex);
        }
    }
    
    private void saveTokens(AuthResponse response) {
        tokenStorage.saveTokens(
            response.accessToken(),
            response.refreshToken(),
            response.expiresAt()
        );
    }
    
    private void sendLogoutRequest(String refreshToken) {
        try {
            restClient.post()
                .uri("/api/auth/logout")
                .contentType(MediaType.APPLICATION_JSON)
                .body(new RefreshTokenRequest(refreshToken))
                .retrieve()
                .toBodilessEntity();
        } catch (RestClientException ex) {
            log.debug("Logout request failed (ignoring): {}", ex.getMessage());
        }
    }
    
    /**
     * Custom exception for authentication errors.
     */
    public static final class AuthenticationException extends RuntimeException {
        public AuthenticationException(String message, Throwable cause) {
            super(message, cause);
        }
    }
}
