package com.uncovering_history.api.migrations;

import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.uncovering_history.api.model.Permission;
import com.uncovering_history.api.model.User;

import io.mongock.api.annotations.BeforeExecution;
import io.mongock.api.annotations.ChangeUnit;
import io.mongock.api.annotations.Execution;
import io.mongock.api.annotations.RollbackBeforeExecution;
import io.mongock.api.annotations.RollbackExecution;

@ChangeUnit(id = "seed", order = "001", author = "system")
public class Seed {

    private final MongoTemplate mongoTemplate;

    public Seed(MongoTemplate mongoTemplate) {
        this.mongoTemplate = mongoTemplate;
    }

    @BeforeExecution
    public void before() {
        mongoTemplate.createCollection("user");
        mongoTemplate.createCollection("permission");
        mongoTemplate.createCollection("interest_point");
        mongoTemplate.createCollection("elements");
        mongoTemplate.createCollection("photo");
    }
    
    @RollbackBeforeExecution
    public void rollbackBefore() {
        mongoTemplate.dropCollection("user");
        mongoTemplate.dropCollection("permission");
        mongoTemplate.dropCollection("interest_point");
        mongoTemplate.dropCollection("elements");
        mongoTemplate.dropCollection("photo");
    }

    @Execution
    public void executeChange() {
        User user;
        Permission permission;
        Permission.UserPermissions userPermissions;
        Permission.MonumentPermissions monumentPermissions;

        userPermissions = new Permission.UserPermissions(true, true, true, true);
        monumentPermissions = new Permission.MonumentPermissions(true, true, true, true, true);

        permission = new Permission("admin", userPermissions, monumentPermissions);

        mongoTemplate.save(permission, "permission");

        user = new User(
                "super",
                "admin",
                "admin@example.com",
                new BCryptPasswordEncoder().encode("hashed_password"),
                "admin");

        mongoTemplate.save(user, "user");
    }

    @RollbackExecution
    public void rollbackChange() {
        mongoTemplate.remove(new Query(Criteria.where("email").is("admin@example.com")), User.class, "user");
    }
}
