package com.posadskiy.swingteacherdesktop.domain.dto;

public record UserDto(
    Long id,
    String email,
    String login,
    Integer logins,
    Integer lastLogin,
    Boolean completeTraining
) {
}


