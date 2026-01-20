package com.posadskiy.swingteacherdesktop.infrastructure.config;

import com.posadskiy.swingteacherdesktop.infrastructure.auth.AccessTokenProvider;
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

    private final AccessTokenProvider accessTokenProvider;
    
    @Override
    public ClientHttpResponse intercept(
        HttpRequest request, 
        byte[] body, 
        ClientHttpRequestExecution execution
    ) throws IOException {
        String path = request.getURI().getPath();
        if (path != null && path.startsWith("/api/auth/")) {
            return execution.execute(request, body);
        }

        var accessToken = accessTokenProvider.getAccessToken()
            .orElseThrow(() -> new IOException("Access token missing for authenticated request"));
        request.getHeaders().setBearerAuth(accessToken);
        
        return execution.execute(request, body);
    }
}




