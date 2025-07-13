package com.uncovering_history.api.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.mongodb.core.MongoTemplate;

import io.mongock.driver.api.driver.ConnectionDriver;
import io.mongock.driver.mongodb.springdata.v4.SpringDataMongoV4Driver;
import io.mongock.driver.mongodb.sync.v4.driver.MongoSync4Driver;
import io.mongock.runner.springboot.MongockSpringboot;
import io.mongock.runner.springboot.base.MongockInitializingBeanRunner;

@Configuration
public class MongockConfig {

    @Autowired
    private MongoConfig mongoConfig;

    @Autowired
    private ApplicationContext applicationContext;

    @Bean
    @Primary
    public ConnectionDriver mongockConnectionDriver(MongoTemplate mongoTemplate) {
        return SpringDataMongoV4Driver.withDefaultLock(mongoTemplate);
    }

    @Bean
    public MongockInitializingBeanRunner mongockInitializingBeanRunner() {
        MongoSync4Driver driver = MongoSync4Driver.withDefaultLock(mongoConfig.mongoClient(),
                mongoConfig.getDatabaseName());
        driver.disableTransaction();
        return MongockSpringboot.builder()
                .setDriver(driver)
                .addMigrationScanPackage("com.uncovering_history.api.migrations")
                .setSpringContext(applicationContext)
                .buildInitializingBeanRunner();
    }
}
