package com.posadskiy.swingteacherdesktop.dao.rest;

import com.posadskiy.swingteacherdesktop.dao.KeywordDao;
import com.posadskiy.swingteacherdesktop.domain.dto.KeywordDto;
import com.posadskiy.swingteacherdesktop.tables.Keyword;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

public class KeywordDaoRest implements KeywordDao {
    private final RestClient client;

    public KeywordDaoRest(RestClient client) {
        this.client = client;
    }

    @Override
    public void addKeyword(Keyword keyword) {
        throw new UnsupportedOperationException("addKeyword is not supported over REST");
    }

    @Override
    public void deleteKeyword(Keyword keyword) {
        throw new UnsupportedOperationException("deleteKeyword is not supported over REST");
    }

    @Override
    public void deleteKeyword(int id) {
        throw new UnsupportedOperationException("deleteKeyword is not supported over REST");
    }

    @Override
    public Keyword getKeyword(int id) throws SQLException {
        return getAllKeywords().stream()
            .filter(k -> k.getId() != null && k.getId() == id)
            .findFirst()
            .orElse(null);
    }

    @Override
    public List<Keyword> getAllKeywords() throws SQLException {
        try {
            KeywordDto[] response = client.get()
                .uri("/api/ref/keywords")
                .retrieve()
                .body(KeywordDto[].class);
            return response == null ? List.of() :
                Arrays.stream(response)
                    .map(RestDtoMapper::toKeyword)
                    .toList();
        } catch (RestClientException ex) {
            throw new SQLException("Failed to load keywords", ex);
        }
    }
}

