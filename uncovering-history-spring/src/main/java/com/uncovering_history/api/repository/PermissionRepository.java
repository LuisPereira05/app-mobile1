package com.uncovering_history.api.repository;

import com.uncovering_history.api.model.Permission;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PermissionRepository extends MongoRepository<Permission, String> {
}
