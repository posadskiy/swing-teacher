package com.posadskiy.swingteacherdesktop.dao.rest;

import com.posadskiy.swingteacherdesktop.dao.UserDao;
import com.posadskiy.swingteacherdesktop.domain.dto.UserDto;
import com.posadskiy.swingteacherdesktop.service.AuthService;
import com.posadskiy.swingteacherdesktop.tables.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

@Slf4j
public class UserDaoRest implements UserDao {
    private final RestClient client;
    private final AuthService authService;

    public UserDaoRest(RestClient client, AuthService authService) {
        this.client = client;
        this.authService = authService;
    }

    @Override
    public void addUser(User user) throws SQLException {
        try {
            // Use AuthService to register, which handles AuthResponse and stores tokens
            boolean registered = authService.register(user.getLogin(), user.getPassword(), user.getEmail());
            if (!registered) {
                throw new SQLException("Failed to register user via service");
            }
        } catch (RestClientException ex) {
            throw new SQLException("Failed to register user via service", ex);
        }
    }

    @Override
    public void deleteUser(User user) {
        throw new UnsupportedOperationException("deleteUser is not supported over REST");
    }

    @Override
    public void deleteUser(int id) {
        throw new UnsupportedOperationException("deleteUser is not supported over REST");
    }

    @Override
    public User getUserById(int id) throws SQLException {
        try {
            UserDto dto = client.get()
                .uri("/api/users/{id}", id)
                .retrieve()
                .body(UserDto.class);
            return RestDtoMapper.toUser(dto);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to load user by id", ex);
        }
    }

    @Override
    public User getUserByLoginAndPassword(String login, String pass) throws SQLException {
        try {
            // Authenticate and get tokens
            if (!authService.login(login, pass)) {
                log.debug("Authentication failed for user: {}", login);
                return null;
            }

            // Get current user info using the token
            UserDto dto = client.get()
                .uri("/api/users/me")
                .retrieve()
                .body(UserDto.class);

            log.debug("Login successful for user: {}", login);
            return dto == null ? null : RestDtoMapper.toUser(dto);
        } catch (RestClientException ex) {
            log.error("Login failed for user: {} due to client error", login, ex);
            return null;
        }
    }

    @Override
    public List<User> getUsers() throws SQLException {
        try {
            UserDto[] response = client.get()
                .uri("/api/users")
                .retrieve()
                .body(UserDto[].class);
            return response == null ? List.of() :
                Arrays.stream(response)
                    .map(RestDtoMapper::toUser)
                    .toList();
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch users", ex);
        }
    }
}

