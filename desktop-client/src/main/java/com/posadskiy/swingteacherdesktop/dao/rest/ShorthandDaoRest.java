package com.posadskiy.swingteacherdesktop.dao.rest;

import com.posadskiy.swingteacherdesktop.dao.ShorthandDao;
import com.posadskiy.swingteacherdesktop.domain.dto.ShorthandDto;
import com.posadskiy.swingteacherdesktop.tables.Shorthand;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

public class ShorthandDaoRest implements ShorthandDao {
    private final RestClient client;

    public ShorthandDaoRest(RestClient client) {
        this.client = client;
    }

    @Override
    public void addShorthand(Shorthand shorthand) {
        throw new UnsupportedOperationException("addShorthand is not supported over REST");
    }

    @Override
    public void deleteShorthand(Shorthand shorthand) {
        throw new UnsupportedOperationException("deleteShorthand is not supported over REST");
    }

    @Override
    public void deleteShorthand(int id) {
        throw new UnsupportedOperationException("deleteShorthand is not supported over REST");
    }

    @Override
    public Shorthand getShorthand(int id) throws SQLException {
        return getAllShorthands().stream()
            .filter(s -> s.getId() != null && s.getId() == id)
            .findFirst()
            .orElse(null);
    }

    @Override
    public List<Shorthand> getAllShorthands() throws SQLException {
        try {
            ShorthandDto[] response = client.get()
                .uri("/api/ref/shorthands")
                .retrieve()
                .body(ShorthandDto[].class);
            return response == null ? List.of() :
                Arrays.stream(response)
                    .map(RestDtoMapper::toShorthand)
                    .toList();
        } catch (RestClientException ex) {
            throw new SQLException("Failed to load shorthands", ex);
        }
    }
}

