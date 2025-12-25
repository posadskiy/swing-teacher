package com.posadskiy.swingteacherdesktop.api.client;

import com.posadskiy.swingteacherdesktop.api.mapper.DtoMapper;
import com.posadskiy.swingteacherdesktop.domain.dto.DocumentationDto;
import com.posadskiy.swingteacherdesktop.domain.model.Documentation;
import com.posadskiy.swingteacherdesktop.domain.repository.DocumentationRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;
import java.util.Optional;

/**
 * REST API client for Documentation operations.
 */
@Slf4j
public class DocumentationApiClient implements DocumentationRepository {
    
    private final RestClient client;
    
    public DocumentationApiClient(RestClient client) {
        this.client = client;
    }
    
    @Override
    public Optional<Documentation> getDocumentation(int id) throws SQLException {
        try {
            return Optional.ofNullable(
                    client.get()
                        .uri("/api/ref/documentation/{id}", id)
                        .retrieve()
                        .body(DocumentationDto.class)
                )
                .map(DtoMapper::toDocumentation);
        } catch (HttpClientErrorException | HttpServerErrorException ex) {
            // Handle HTTP errors gracefully - return empty instead of throwing
            log.debug("HTTP error fetching documentation {}: {}", id, ex.getStatusCode());
            return Optional.empty();
        } catch (RestClientException ex) {
            log.warn("Failed to fetch documentation by id: {}", id, ex);
            throw new SQLException("Failed to fetch documentation by id: " + id, ex);
        }
    }
}

