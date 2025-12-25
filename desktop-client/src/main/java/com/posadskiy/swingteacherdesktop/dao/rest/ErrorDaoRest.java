package com.posadskiy.swingteacherdesktop.dao.rest;

import com.posadskiy.swingteacherdesktop.dao.ErrorDao;
import com.posadskiy.swingteacherdesktop.domain.dto.ErrorDto;
import com.posadskiy.swingteacherdesktop.tables.Error;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

/**
 * Modern REST-based error DAO using Optional.
 */
public class ErrorDaoRest implements ErrorDao {
    
    private final RestClient client;
    
    public ErrorDaoRest(RestClient client) {
        this.client = client;
    }
    
    @Override
    public void addError(Error error) {
        throw new UnsupportedOperationException("addError is not supported over REST");
    }
    
    @Override
    public void deleteError(Error error) {
        throw new UnsupportedOperationException("deleteError is not supported over REST");
    }
    
    @Override
    public void deleteError(int id) {
        throw new UnsupportedOperationException("deleteError is not supported over REST");
    }
    
    @Override
    public Error getError(int id) throws SQLException {
        try {
            return Optional.ofNullable(
                    client.get()
                        .uri("/api/ref/errors/{id}", id)
                        .retrieve()
                        .body(ErrorDto.class)
                )
                .map(RestDtoMapper::toError)
                .orElse(null);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to load error by id: " + id, ex);
        }
    }
    
    @Override
    public List<Error> getAllErrors() {
        throw new UnsupportedOperationException("Fetching all errors is not supported over REST");
    }
}
