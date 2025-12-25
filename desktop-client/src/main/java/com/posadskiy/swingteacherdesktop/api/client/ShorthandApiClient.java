package com.posadskiy.swingteacherdesktop.api.client;

import com.posadskiy.swingteacherdesktop.api.mapper.DtoMapper;
import com.posadskiy.swingteacherdesktop.domain.dto.ShorthandDto;
import com.posadskiy.swingteacherdesktop.domain.model.Shorthand;
import com.posadskiy.swingteacherdesktop.domain.repository.ShorthandRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

/**
 * REST API client for Shorthand operations.
 */
@Slf4j
public class ShorthandApiClient implements ShorthandRepository {
    
    private final RestClient client;
    
    public ShorthandApiClient(RestClient client) {
        this.client = client;
    }
    
    @Override
    public List<Shorthand> getAllShorthands() throws SQLException {
        try {
            var response = client.get()
                .uri("/api/ref/shorthands")
                .retrieve()
                .body(ShorthandDto[].class);
            
            return Optional.ofNullable(response)
                .map(arr -> Arrays.stream(arr)
                    .map(DtoMapper::toShorthand)
                    .toList())
                .orElse(List.of());
        } catch (HttpClientErrorException | HttpServerErrorException ex) {
            // Handle HTTP errors gracefully - return empty list instead of throwing
            log.debug("HTTP error fetching shorthands: {}", ex.getStatusCode());
            return List.of();
        } catch (RestClientException ex) {
            log.warn("Failed to fetch shorthands", ex);
            throw new SQLException("Failed to fetch shorthands", ex);
        }
    }
}

