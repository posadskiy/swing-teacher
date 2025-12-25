package com.posadskiy.swingteacherdesktop.service.web;

import com.posadskiy.swingteacherdesktop.domain.request.AuthRequest;
import com.posadskiy.swingteacherdesktop.domain.request.RefreshTokenRequest;
import com.posadskiy.swingteacherdesktop.domain.request.RegisterRequest;
import com.posadskiy.swingteacherdesktop.domain.response.AuthResponse;
import com.posadskiy.swingteacherdesktop.domain.response.RefreshTokenResponse;
import com.posadskiy.swingteacherdesktop.service.application.AuthService;
import com.posadskiy.swingteacherdesktop.service.application.UserService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/auth")
public class AuthController {
    private final AuthService authService;
    private final UserService userService;

    public AuthController(AuthService authService, UserService userService) {
        this.authService = authService;
        this.userService = userService;
    }

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@Valid @RequestBody AuthRequest request) {
        return authService.authenticate(request)
            .map(ResponseEntity::ok)
            .orElseGet(() -> ResponseEntity.status(401).build());
    }

    @PostMapping("/register")
    public ResponseEntity<AuthResponse> register(@Valid @RequestBody RegisterRequest request) {
        try {
            userService.register(request);
            AuthRequest authRequest = new AuthRequest(request.login(), request.password());
            return authService.authenticate(authRequest)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.status(500).build());
        } catch (IllegalArgumentException ex) {
            return ResponseEntity.badRequest().build();
        }
    }

    @PostMapping("/refresh")
    public ResponseEntity<RefreshTokenResponse> refresh(@Valid @RequestBody RefreshTokenRequest request) {
        return authService.refreshToken(request.refreshToken())
            .map(
                authResponse ->
                    new RefreshTokenResponse(
                        authResponse.accessToken(),
                        authResponse.refreshToken(),
                        authResponse.expiresAt()))
            .map(ResponseEntity::ok)
            .orElseGet(() -> ResponseEntity.status(401).build());
    }

    @PostMapping("/logout")
    public ResponseEntity<Void> logout(@Valid @RequestBody RefreshTokenRequest request) {
        authService.revokeRefreshToken(request.refreshToken());
        return ResponseEntity.ok().build();
    }
}

