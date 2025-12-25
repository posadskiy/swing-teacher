# SwingTeacherDesktop

Modern Java 25 + Spring Boot 4.0.1 refactored application with multi-module architecture.

## Architecture

- **`domain`**: Shared DTOs and request models
- **`service`**: Spring Boot REST API backend
- **`desktop-client`**: Swing desktop UI client

## Requirements

- **JDK 25**
- **Maven 3.9+**
- **Docker & Docker Compose** (for database and backend service)

## Quick Start

### 1. Start Backend Service and Database

```bash
docker compose up --build
```

This will:
- Start PostgreSQL database on port 5432
- Run Flyway migrations
- Build and start the Spring Boot service on port 8080

The service will be available at `http://localhost:8080`

### 2. Build Desktop Client

```bash
mvn clean package -pl desktop-client -am
```

This produces a runnable jar:
- `desktop-client/target/desktop-client-1.0-SNAPSHOT.jar`

### 3. Run Desktop Client

```bash
java -jar desktop-client/target/desktop-client-1.0-SNAPSHOT.jar
```

The client is configured to connect to the backend service at `http://localhost:8080` by default.

## Configuration

### Environment Variables

**Desktop Client:**
- `SWINGTEACHER_SERVICE_URL`: Backend service URL (default: `http://localhost:8080`)
- `SWINGTEACHER_USE_REMOTE`: Use REST API (default: `true`)
- `SWINGTEACHER_USE_DB`: Fallback to direct DB access (default: `false`)
- `SWINGTEACHER_SMTP_USERNAME`: SMTP username for email verification (optional)
- `SWINGTEACHER_SMTP_PASSWORD`: SMTP password for email verification (optional)

**Backend Service:**
- `SWINGTEACHER_DB_URL`: Database URL (default: `jdbc:postgresql://localhost:5432/swingteacher`)
- `SWINGTEACHER_DB_USER`: Database username (default: `postgres`)
- `SWINGTEACHER_DB_PASSWORD`: Database password (default: `postgres`)
- `SWINGTEACHER_SERVICE_PORT`: Service port (default: `8080`)

### Local Development

**Run Backend Service Locally:**

```bash
# Start database only
docker compose up db flyway

# In another terminal, run the service
cd service
mvn spring-boot:run
```

**Run Desktop Client Locally:**

```bash
# Build client
mvn clean package -pl desktop-client -am

# Run client (connects to backend at http://localhost:8080)
java -jar desktop-client/target/desktop-client-1.0-SNAPSHOT.jar
```

## Project Structure

```
.
├── domain/              # Shared DTOs and request models
├── service/             # Spring Boot REST API
│   ├── src/main/java/
│   │   └── com/posadskiy/swingteacherdesktop/service/
│   │       ├── application/    # Application services
│   │       ├── domain/         # Domain entities and mappers
│   │       ├── infrastructure/ # JPA repositories
│   │       └── web/            # REST controllers
│   └── src/main/resources/
│       ├── application.yml
│       └── db/migration/       # Flyway migrations
├── desktop-client/      # Swing UI client
│   └── src/main/java/
│       └── com/posadskiy/swingteacherdesktop/
│           ├── controllers/    # UI controllers
│           ├── dao/            # DAO interfaces and REST implementations
│           └── views/          # Swing UI components
└── docker-compose.yml   # Docker services configuration
```

## API Endpoints

The backend service exposes REST APIs at `http://localhost:8080/api`:

- `POST /api/auth/login` - User authentication
- `POST /api/auth/register` - User registration
- `GET /api/users` - List users
- `GET /api/lessons?categoryId={id}` - Get lessons by category
- `GET /api/tasks?lessonId={id}` - Get tasks by lesson
- `GET /api/keywords` - Get keywords
- `GET /api/shorthands` - Get shorthands
- `GET /api/documentation/{id}` - Get documentation
- `GET /api/errors/{id}` - Get error details
- `GET /api/completed-tasks?userId={id}` - Get completed tasks
- `POST /api/completed-tasks` - Mark task as completed

## Database

Flyway migrations are located in:
- `service/src/main/resources/db/migration/`

Database credentials (Docker):
- Database: `swingteacher`
- User: `swingteacher`
- Password: `swingteacher`
- Port: `5432`

## Build All Modules

```bash
# Build everything
mvn clean package

# Build specific module
mvn clean package -pl service
mvn clean package -pl desktop-client
```

## Notes

- The desktop client connects to the backend via REST API by default
- Email verification for registration is optional (requires SMTP credentials)
- The backend service runs in Docker; the desktop client runs on your host machine
- All modules use Java 25 and Spring Boot 4.0.1
