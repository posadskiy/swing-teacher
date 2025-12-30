package com.posadskiy.swingteacherdesktop.service.application;

import com.posadskiy.swingteacherdesktop.domain.dto.UserDto;
import com.posadskiy.swingteacherdesktop.domain.request.RegisterRequest;
import com.posadskiy.swingteacherdesktop.service.domain.entity.UserEntity;
import com.posadskiy.swingteacherdesktop.service.domain.mapper.DtoMapper;
import com.posadskiy.swingteacherdesktop.service.infrastructure.jpa.UserRepository;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Transactional
    public UserDto register(RegisterRequest request) {
        UserEntity user = new UserEntity();
        user.setEmail(request.email());
        user.setLogin(request.login());
        user.setPassword(passwordEncoder.encode(request.password()));
        user.setLogins(0);
        user.setLastLogin(0);
        user.setCompleteTraining(Boolean.FALSE);
        user.setPreferredLanguage("en"); // Default to English

        try {
            return DtoMapper.toDto(userRepository.save(user));
        } catch (DataIntegrityViolationException e) {
            // Surface as a friendly error for the caller.
            throw new IllegalArgumentException("User with this login already exists", e);
        }
    }

    public Optional<UserDto> findByLogin(String login) {
        return userRepository.findByLoginIgnoreCase(login).map(DtoMapper::toDto);
    }

    public List<UserDto> findAll() {
        return userRepository.findAll()
            .stream()
            .map(DtoMapper::toDto)
            .toList();
    }

    public Optional<UserDto> findById(Long id) {
        return userRepository.findById(id).map(DtoMapper::toDto);
    }

    @Transactional
    public Optional<String> getPreferredLanguage(Long userId) {
        return userRepository.findById(userId)
            .map(UserEntity::getPreferredLanguage)
            .or(() -> Optional.of("en")); // Default to English if not set
    }

    @Transactional
    public void setPreferredLanguage(Long userId, String languageCode) {
        userRepository.findById(userId).ifPresent(user -> {
            user.setPreferredLanguage(languageCode);
            userRepository.save(user);
        });
    }
}

