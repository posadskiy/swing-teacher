package com.posadskiy.swingteacherdesktop.infrastructure.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.posadskiy.swingteacherdesktop.api.client.*;
import com.posadskiy.swingteacherdesktop.application.service.AuthenticationService;
import com.posadskiy.swingteacherdesktop.domain.repository.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.core.env.StandardEnvironment;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestClient;

/**
 * Spring Java configuration for the application.
 * Configures beans and component scanning for all layers.
 */
@Configuration
@ComponentScan(basePackages = "com.posadskiy.swingteacherdesktop")
public class AppConfig {

    @Bean
    public Environment environment() {
        return new StandardEnvironment();
    }

    @Bean
    public ObjectMapper objectMapper() {
        return new ObjectMapper()
            .registerModule(new JavaTimeModule())
            .disable(com.fasterxml.jackson.databind.SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
    }

    @Bean
    public RestClient restClient(
        Environment env, 
        BearerTokenInterceptor bearerTokenInterceptor, 
        ObjectMapper objectMapper
    ) {
        String baseUrl = env.getProperty("SWINGTEACHER_SERVICE_URL", "http://localhost:8080");
        
        MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
        converter.setObjectMapper(objectMapper);
        
        return RestClient.builder()
            .baseUrl(baseUrl)
            .messageConverters(converters -> {
                converters.removeIf(c -> c instanceof MappingJackson2HttpMessageConverter);
                converters.add(converter);
            })
            .requestInterceptors(interceptors -> interceptors.add(bearerTokenInterceptor))
            .build();
    }

    // Repository beans using API clients
    
    @Bean
    public UserRepository userRepository(RestClient restClient, AuthenticationService authService) {
        return new UserApiClient(restClient, authService);
    }

    @Bean
    public LessonRepository lessonRepository(RestClient restClient) {
        return new LessonApiClient(restClient);
    }

    @Bean
    public TaskRepository taskRepository(RestClient restClient) {
        return new TaskApiClient(restClient);
    }

    @Bean
    public DocumentationRepository documentationRepository(RestClient restClient) {
        return new DocumentationApiClient(restClient);
    }

    @Bean
    public ErrorRepository errorRepository(RestClient restClient) {
        return new ErrorApiClient(restClient);
    }

    @Bean
    public KeywordRepository keywordRepository(RestClient restClient) {
        return new KeywordApiClient(restClient);
    }

    @Bean
    public ShorthandRepository shorthandRepository(RestClient restClient) {
        return new ShorthandApiClient(restClient);
    }

    @Bean
    public CompletedTaskRepository completedTaskRepository(RestClient restClient) {
        return new CompletedTaskApiClient(restClient);
    }

    @Bean
    public CodeCheckingApiClient codeCheckingApiClient(RestClient restClient) {
        return new CodeCheckingApiClient(restClient);
    }

    // API Client beans (for direct injection)

    @Bean
    public LessonApiClient lessonApiClient(RestClient restClient) {
        return new LessonApiClient(restClient);
    }

    @Bean
    public TaskApiClient taskApiClient(RestClient restClient) {
        return new TaskApiClient(restClient);
    }
}




