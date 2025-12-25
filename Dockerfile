FROM maven:3.9.12-eclipse-temurin-25-alpine AS build
WORKDIR /app
# Copy root POM and all module POMs
COPY pom.xml .
COPY domain/pom.xml ./domain/
COPY service/pom.xml ./service/
COPY desktop-client/pom.xml ./desktop-client/
# Copy source code for all modules
COPY domain/src ./domain/src
COPY service/src ./service/src
COPY desktop-client/src ./desktop-client/src
# Build the service module (which depends on domain)
RUN mvn -pl service -am -DskipTests clean package

FROM eclipse-temurin:25-jre
WORKDIR /app
COPY --from=build /app/service/target/service-1.0-SNAPSHOT.jar /app/app.jar
ENV JAVA_OPTS=""
EXPOSE 8080
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar /app/app.jar"]


