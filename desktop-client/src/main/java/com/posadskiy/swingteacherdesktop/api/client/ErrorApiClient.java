package com.posadskiy.swingteacherdesktop.api.client;

import com.posadskiy.swingteacherdesktop.api.mapper.DtoMapper;
import com.posadskiy.swingteacherdesktop.domain.dto.ErrorDto;
import com.posadskiy.swingteacherdesktop.domain.model.Error;
import com.posadskiy.swingteacherdesktop.domain.repository.ErrorRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;
import java.util.Optional;

/**
 * REST API client for Error operations.
 */
@Slf4j
public class ErrorApiClient implements ErrorRepository {
    
    private final RestClient client;
    
    public ErrorApiClient(RestClient client) {
        this.client = client;
    }
    
    @Override
    public Optional<Error> getError(int id) throws SQLException {
        try {
            return Optional.ofNullable(
                    client.get()
                        .uri("/api/ref/errors/{id}", id)
                        .retrieve()
                        .body(ErrorDto.class)
                )
                .map(DtoMapper::toError);
        } catch (HttpClientErrorException | HttpServerErrorException ex) {
            // Handle HTTP errors gracefully - return empty instead of throwing
            log.debug("HTTP error fetching error {}: {}", id, ex.getStatusCode());
            return Optional.empty();
        } catch (RestClientException ex) {
            log.warn("Failed to fetch error by id: {}", id, ex);
            throw new SQLException("Failed to fetch error by id: " + id, ex);
        }
    }
}

