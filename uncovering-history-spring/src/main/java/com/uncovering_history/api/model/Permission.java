package com.uncovering_history.api.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@RequiredArgsConstructor
@Document(collection = "permission")
public class Permission {

    @Id
    private String objectId;

    @NonNull
    private String role;
    
    @NonNull
    private UserPermissions user;
    @NonNull
    private MonumentPermissions monument;
    
    @Data
    @AllArgsConstructor
    public static class UserPermissions {
        private boolean create;
        private boolean read;
        private boolean update;
        private boolean delete;
    }

    @Data
    @AllArgsConstructor
    public static class MonumentPermissions {
        private boolean create;
        private boolean read;
        private boolean update;
        private boolean delete;
        private boolean publish;
    }
}
