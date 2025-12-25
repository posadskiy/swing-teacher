package com.posadskiy.swingteacherdesktop.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.posadskiy.swingteacherdesktop.dao.*;
import com.posadskiy.swingteacherdesktop.dao.rest.*;
import com.posadskiy.swingteacherdesktop.main.Checker;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.core.env.StandardEnvironment;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestClient;

/**
 * Spring Java configuration (replaces legacy context.xml and Factory singleton).
 */
@Configuration
@ComponentScan(basePackages = "com.posadskiy.swingteacherdesktop")
public class AppConfig {

    @Bean
    public Environment environment() {
        return new StandardEnvironment();
    }

    @Bean
    public Checker checker() {
        return new Checker();
    }

    @Bean
    public ObjectMapper objectMapper() {
        return new ObjectMapper()
            .registerModule(new JavaTimeModule())
            .disable(com.fasterxml.jackson.databind.SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
    }

    @Bean
    public RestClient restClient(
        Environment env, BearerTokenInterceptor bearerTokenInterceptor, ObjectMapper objectMapper) {
        String baseUrl = env.getProperty("SWINGTEACHER_SERVICE_URL", "http://localhost:8080");
        // Configure Jackson converter with JavaTimeModule support
        MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
        converter.setObjectMapper(objectMapper);
        return RestClient.builder()
            .baseUrl(baseUrl)
            .messageConverters(converters -> {
                // Replace or add Jackson converter with proper configuration
                converters.removeIf(c -> c instanceof MappingJackson2HttpMessageConverter);
                converters.add(converter);
            })
            .requestInterceptors(interceptors -> interceptors.add(bearerTokenInterceptor))
            .build();
    }

    @Bean
    public UserDao userDao(RestClient restClient, com.posadskiy.swingteacherdesktop.service.AuthService authService) {
        return new UserDaoRest(restClient, authService);
    }

    @Bean
    public LessonDao lessonDao(RestClient restClient) {
        return new LessonDaoRest(restClient);
    }

    @Bean
    public TaskDao taskDao(RestClient restClient) {
        return new TaskDaoRest(restClient);
    }

    @Bean
    public DocumentationDao documentationDao(RestClient restClient) {
        return new DocumentationDaoRest(restClient);
    }

    @Bean
    public ErrorDao errorDao(RestClient restClient) {
        return new ErrorDaoRest(restClient);
    }

    @Bean
    public KeywordDao keywordDao(RestClient restClient) {
        return new KeywordDaoRest(restClient);
    }

    @Bean
    public ShorthandDao shorthandDao(RestClient restClient) {
        return new ShorthandDaoRest(restClient);
    }

    @Bean
    public CompletedTaskDao completedTaskDao(RestClient restClient) {
        return new CompletedTaskDaoRest(restClient);
    }
}
