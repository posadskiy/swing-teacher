package com.posadskiy.swingteacherdesktop.infrastructure.config;

import com.posadskiy.swingteacherdesktop.infrastructure.storage.TokenStorage;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpRequest;
import org.springframework.http.client.ClientHttpRequestExecution;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * HTTP interceptor that adds Bearer token to outgoing requests.
 */
@Component
@RequiredArgsConstructor
public class BearerTokenInterceptor implements ClientHttpRequestInterceptor {
    
    private final TokenStorage tokenStorage;
    
    @Override
    public ClientHttpResponse intercept(
        HttpRequest request, 
        byte[] body, 
        ClientHttpRequestExecution execution
    ) throws IOException {
        var accessToken = tokenStorage.getAccessToken();
        
        if (accessToken != null && !accessToken.isBlank()) {
            request.getHeaders().setBearerAuth(accessToken);
        }
        
        return execution.execute(request, body);
    }
}

