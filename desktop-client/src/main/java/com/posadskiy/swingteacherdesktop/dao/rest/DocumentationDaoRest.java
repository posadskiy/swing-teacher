package com.posadskiy.swingteacherdesktop.dao.rest;

import com.posadskiy.swingteacherdesktop.dao.DocumentationDao;
import com.posadskiy.swingteacherdesktop.domain.dto.DocumentationDto;
import com.posadskiy.swingteacherdesktop.tables.Documentation;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;

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
            DocumentationDto dto = client.get()
                .uri("/api/ref/documentation/{id}", id)
                .retrieve()
                .body(DocumentationDto.class);
            return RestDtoMapper.toDocumentation(dto);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to load documentation", ex);
        }
    }

    @Override
    public java.util.List<Documentation> getAllDocumentation() throws SQLException {
        try {
            DocumentationDto[] dtos = client.get()
                .uri("/api/ref/documentation")
                .retrieve()
                .body(DocumentationDto[].class);
            if (dtos == null) {
                return java.util.Collections.emptyList();
            }
            return java.util.Arrays.stream(dtos)
                .map(RestDtoMapper::toDocumentation)
                .collect(java.util.stream.Collectors.toList());
        } catch (RestClientException ex) {
            throw new SQLException("Failed to load all documentation", ex);
        }
    }
}

