# Migration to External Auth-Service

## Summary

The SwingTeacher service has been migrated from using a custom authorization implementation to using the external
auth-service deployed at `168.119.57.22` (or `localhost:8100` for local development).

## Changes Made

### 1. Auth-Service Client Integration

- **New File**: `service/src/main/java/.../infrastructure/client/AuthServiceClient.java`
    - HTTP client for communicating with auth-service
    - Methods: `login()`, `register()`, `refreshToken()`, `logout()`, `validateToken()`, `getUserIdFromToken()`

### 2. Updated Controllers

- **Modified**: `service/src/main/java/.../web/AuthController.java`
    - Now proxies all requests to auth-service instead of using local `AuthService`
    - Endpoints remain the same: `/api/auth/login`, `/api/auth/register`, `/api/auth/refresh`, `/api/auth/logout`

### 3. Updated Security Filter

- **Modified**: `service/src/main/java/.../infrastructure/security/JwtAuthenticationFilter.java`
    - Now validates tokens by calling auth-service API
    - Extracts user ID from auth-service response instead of parsing JWT locally

### 4. Configuration Profiles

Created three environment-specific configuration files:

- **`application-dev.yml`**: `http://localhost:8100` (local development)
- **`application-docker.yml`**: `http://auth-service:8100` (Docker containers)
- **`application-prod.yml`**: `http://auth-service.auth.svc.cluster.local:8100` (Kubernetes cluster)

### 5. Docker Compose Updates

- **Modified**: `docker-compose.yml`
    - Added `SPRING_PROFILES_ACTIVE: docker`
    - Added `AUTH_SERVICE_BASE_URL: http://auth-service:8100`
    - Added network configuration for cross-container communication

### 6. Kubernetes Deployment

Created `k8s/` directory with:

- **`deployment.yaml`**: Main deployment configuration
- **`service.yaml`**: Kubernetes service definition
- **`configmap.yaml`**: Configuration values
- **`secret.yaml.example`**: Example secret file
- **`network-policy.yaml`**: Network policy for cross-namespace communication
- **`README.md`**: Deployment instructions
- **`NETWORK.md`**: Network configuration and troubleshooting guide

## Configuration

### Environment Variables

| Variable                 | Description                      | Default                 |
|--------------------------|----------------------------------|-------------------------|
| `AUTH_SERVICE_BASE_URL`  | Base URL for auth-service        | `http://localhost:8100` |
| `SPRING_PROFILES_ACTIVE` | Spring profile (dev/docker/prod) | `dev`                   |

### Auth-Service URLs by Environment

- **Localhost**: `http://localhost:8100`
- **Docker**: `http://auth-service:8100` (assumes auth-service container in same network)
- **Production**: `http://auth-service.auth.svc.cluster.local:8100` (Kubernetes service DNS)

## Network Connectivity

### Cross-Namespace Communication

Kubernetes allows pods to communicate across namespaces by default using DNS service discovery:

- **Format**: `<service-name>.<namespace>.svc.cluster.local`
- **Example**: `auth-service.auth.svc.cluster.local:8100`

If Network Policies are enabled, ensure they allow traffic between namespaces. See `k8s/NETWORK.md` for detailed network
configuration and troubleshooting.

### Docker Network

For Docker, ensure both services are on the same network (e.g., `user-web-network`). The docker-compose.yml has been
updated to include network configuration.

## Removed Components

The following components have been removed as they are no longer needed:

- ✅ `service/src/main/java/.../application/AuthService.java` - Replaced by `AuthServiceClient`
- ✅ `service/src/main/java/.../application/JwtService.java` - Token validation now handled by auth-service
- ✅ `service/src/main/java/.../domain/entity/RefreshTokenEntity.java` - Refresh tokens now managed by auth-service
- ✅ `service/src/main/java/.../infrastructure/jpa/RefreshTokenRepository.java` - No longer needed

## Note on PasswordEncoder

The `PasswordEncoder` bean in `SecurityConfig` is still present but no longer used for authentication. It may be removed
in a future cleanup if not needed elsewhere (e.g., if `UserService.register()` is completely removed).

## Testing

### Local Development

1. Start auth-service on `localhost:8100`
2. Start SwingTeacher service:
   ```bash
   ./mvnw clean run -pl service -Dmicronaut.environments=dev
   # or
   java -jar service/target/service-1.0-SNAPSHOT.jar --spring.profiles.active=dev
   ```

### Docker

1. Ensure auth-service container is running and accessible as `auth-service:8100`
2. Start services:
   ```bash
   docker-compose up
   ```

### Kubernetes

1. Deploy auth-service to `auth` namespace
2. Deploy SwingTeacher service:
   ```bash
   kubectl apply -f k8s/configmap.yaml
   kubectl apply -f k8s/secret.yaml  # Create from secret.yaml.example
   kubectl apply -f k8s/deployment.yaml
   kubectl apply -f k8s/service.yaml
   ```

## Verification

### Check Service Connectivity

```bash
# From service pod
curl http://auth-service.auth.svc.cluster.local:8100/health

# Test authentication
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"login":"test","password":"test"}'
```

### Check Logs

```bash
# Docker
docker-compose logs service

# Kubernetes
kubectl logs -f deployment/swingteacher-service
```

## Troubleshooting

### Cannot Connect to Auth-Service

1. Verify auth-service is running and accessible
2. Check network policies (Kubernetes)
3. Verify DNS resolution
4. Check firewall rules
5. See `k8s/NETWORK.md` for detailed troubleshooting

### Token Validation Fails

1. Verify auth-service `/users/me` endpoint is accessible
2. Check token format (should be Bearer token)
3. Verify auth-service is returning user info correctly

## Next Steps

1. Remove deprecated `AuthService` and `JwtService` if not needed
2. Consider adding retry logic for auth-service calls
3. Add circuit breaker pattern for resilience
4. Implement caching for token validation (optional)
5. Add metrics/monitoring for auth-service calls
