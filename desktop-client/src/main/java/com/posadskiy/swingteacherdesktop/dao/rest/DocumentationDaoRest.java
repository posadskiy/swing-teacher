package com.posadskiy.swingteacherdesktop.dao.rest;

import com.posadskiy.swingteacherdesktop.dao.DocumentationDao;
import com.posadskiy.swingteacherdesktop.domain.dto.DocumentationDto;
import com.posadskiy.swingteacherdesktop.tables.Documentation;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

/**
 * Modern REST-based documentation DAO using Optional and streams.
 */
public class DocumentationDaoRest implements DocumentationDao {
    
    private final RestClient client;
    
    public DocumentationDaoRest(RestClient client) {
        this.client = client;
    }
    
    @Override
    public void addDocumentation(Documentation documentation) {
        throw new UnsupportedOperationException("addDocumentation is not supported over REST");
    }
    
    @Override
    public void deleteDocumentation(Documentation documentation) {
        throw new UnsupportedOperationException("deleteDocumentation is not supported over REST");
    }
    
    @Override
    public void deleteDocumentation(int id) {
        throw new UnsupportedOperationException("deleteDocumentation is not supported over REST");
    }
    
    @Override
    public Documentation getDocumentation(int id) throws SQLException {
        try {
            return Optional.ofNullable(
                    client.get()
                        .uri("/api/ref/documentation/{id}", id)
                        .retrieve()
                        .body(DocumentationDto.class)
                )
                .map(RestDtoMapper::toDocumentation)
                .orElse(null);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to load documentation: " + id, ex);
        }
    }
    
    @Override
    public List<Documentation> getAllDocumentation() throws SQLException {
        try {
            var response = client.get()
                .uri("/api/ref/documentation")
                .retrieve()
                .body(DocumentationDto[].class);
            
            return Optional.ofNullable(response)
                .map(arr -> Arrays.stream(arr)
                    .map(RestDtoMapper::toDocumentation)
                    .toList())
                .orElse(List.of());
        } catch (RestClientException ex) {
            throw new SQLException("Failed to load all documentation", ex);
        }
    }
}
