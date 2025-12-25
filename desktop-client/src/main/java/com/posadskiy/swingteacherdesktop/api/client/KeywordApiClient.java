package com.posadskiy.swingteacherdesktop.api.client;

import com.posadskiy.swingteacherdesktop.api.mapper.DtoMapper;
import com.posadskiy.swingteacherdesktop.domain.dto.KeywordDto;
import com.posadskiy.swingteacherdesktop.domain.model.Keyword;
import com.posadskiy.swingteacherdesktop.domain.repository.KeywordRepository;
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
 * REST API client for Keyword operations.
 */
@Slf4j
public class KeywordApiClient implements KeywordRepository {
    
    private final RestClient client;
    
    public KeywordApiClient(RestClient client) {
        this.client = client;
    }
    
    @Override
    public List<Keyword> getAllKeywords() throws SQLException {
        try {
            var response = client.get()
                .uri("/api/ref/keywords")
                .retrieve()
                .body(KeywordDto[].class);
            
            return Optional.ofNullable(response)
                .map(arr -> Arrays.stream(arr)
                    .map(DtoMapper::toKeyword)
                    .toList())
                .orElse(List.of());
        } catch (HttpClientErrorException | HttpServerErrorException ex) {
            // Handle HTTP errors gracefully - return empty list instead of throwing
            log.debug("HTTP error fetching keywords: {}", ex.getStatusCode());
            return List.of();
        } catch (RestClientException ex) {
            log.warn("Failed to fetch keywords", ex);
            throw new SQLException("Failed to fetch keywords", ex);
        }
    }
}

