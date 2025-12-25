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
import java.util.Optional;

/**
 * Modern REST-based user DAO using Optional and streams.
 */
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
            var registered = authService.register(user.login(), user.password(), user.email());
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
            return Optional.ofNullable(
                    client.get()
                        .uri("/api/users/{id}", id)
                        .retrieve()
                        .body(UserDto.class)
                )
                .map(RestDtoMapper::toUser)
                .orElse(null);
        } catch (RestClientException ex) {
            throw new SQLException("Failed to load user by id: " + id, ex);
        }
    }
    
    @Override
    public User getUserByLoginAndPassword(String login, String password) throws SQLException {
        try {
            // Authenticate and get tokens
            if (!authService.login(login, password)) {
                log.debug("Authentication failed for user: {}", login);
                return null;
            }
            
            // Get current user info using the token
            return fetchCurrentUser()
                .map(user -> {
                    log.debug("Login successful for user: {}", login);
                    return user;
                })
                .orElseGet(() -> {
                    log.warn("Login succeeded but failed to fetch user info for: {}", login);
                    return null;
                });
                
        } catch (RestClientException ex) {
            log.error("Login failed for user: {} due to client error", login, ex);
            return null;
        }
    }
    
    @Override
    public List<User> getUsers() throws SQLException {
        try {
            var response = client.get()
                .uri("/api/users")
                .retrieve()
                .body(UserDto[].class);
            
            return Optional.ofNullable(response)
                .map(arr -> Arrays.stream(arr)
                    .map(RestDtoMapper::toUser)
                    .toList())
                .orElse(List.of());
                
        } catch (RestClientException ex) {
            throw new SQLException("Failed to fetch users", ex);
        }
    }
    
    private Optional<User> fetchCurrentUser() {
        return Optional.ofNullable(
            client.get()
                .uri("/api/users/me")
                .retrieve()
                .body(UserDto.class)
        ).map(RestDtoMapper::toUser);
    }
}
