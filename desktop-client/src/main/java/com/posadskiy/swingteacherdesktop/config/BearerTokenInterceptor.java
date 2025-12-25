package com.posadskiy.swingteacherdesktop.config;

import com.posadskiy.swingteacherdesktop.service.AuthService;
import com.posadskiy.swingteacherdesktop.utils.TokenStorage;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpRequest;
import org.springframework.http.client.ClientHttpRequestExecution;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class BearerTokenInterceptor implements ClientHttpRequestInterceptor {
    private final TokenStorage tokenStorage;
    private final AuthService authService;

    public BearerTokenInterceptor(TokenStorage tokenStorage, @Lazy AuthService authService) {
        this.tokenStorage = tokenStorage;
        this.authService = authService;
    }

    @Override
    public ClientHttpResponse intercept(
        HttpRequest request,
        byte[] body,
        ClientHttpRequestExecution execution)
        throws IOException {
        String uri = request.getURI().toString();

        // Skip token for auth endpoints - check both path and full URI
        if (uri.contains("/api/auth/") || request.getURI().getPath().contains("/api/auth/")) {
            // Ensure no Authorization header is set for auth endpoints
            request.getHeaders().remove("Authorization");
            return execution.execute(request, body);
        }

        // Refresh token if expired
        if (tokenStorage.isTokenExpired() && tokenStorage.hasTokens()) {
            authService.refreshToken();
        }

        // Add Bearer token if available
        String accessToken = tokenStorage.getAccessToken();
        if (accessToken != null) {
            request.getHeaders().set("Authorization", "Bearer " + accessToken);
        }

        ClientHttpResponse response = execution.execute(request, body);

        // If we got 401 or 403, try to refresh token and retry once (if we have tokens)
        int statusCode = response.getStatusCode().value();
        if ((statusCode == 401 || statusCode == 403) && tokenStorage.hasTokens()) {
            response.close();
            if (authService.refreshToken()) {
                request.getHeaders().set("Authorization", "Bearer " + tokenStorage.getAccessToken());
                return execution.execute(request, body);
            }
        }

        return response;
    }
}

