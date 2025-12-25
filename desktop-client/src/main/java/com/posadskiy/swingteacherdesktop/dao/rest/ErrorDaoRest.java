package com.posadskiy.swingteacherdesktop.dao.rest;

import com.posadskiy.swingteacherdesktop.dao.ErrorDao;
import com.posadskiy.swingteacherdesktop.domain.dto.ErrorDto;
import com.posadskiy.swingteacherdesktop.tables.Error;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;

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
            ErrorDto dto = client.get()
                .uri("/api/ref/errors/{id}", id)
                .retrieve()
                .body(ErrorDto.class);
            return RestDtoMapper.toError(dto);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to load error by id", ex);
        }
    }

    @Override
    public java.util.List<Error> getAllErrors() {
        throw new UnsupportedOperationException("Fetching all errors is not supported over REST");
    }
}

