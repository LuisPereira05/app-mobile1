package com.uncovering_history.api.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;

@Configuration
@ConfigurationProperties(prefix = "spring.data.mongodb")
public class MongoConfig {

    private String uri;
    private String database;

    public String getDatabaseName() {
        if (database == null || database.isEmpty()) {
            throw new IllegalStateException("Database name undefined");
        }
        return database;
    }

    @Bean
    public MongoClient mongoClient() {
        return MongoClients.create(uri);
    }

    // setters para inyectar desde application.properties
    public void setUri(String uri) {
        this.uri = uri;
    }

    public void setDatabase(String database) {
        this.database = database;
    }
}
