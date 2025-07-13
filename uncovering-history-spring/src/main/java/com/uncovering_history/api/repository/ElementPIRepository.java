package com.uncovering_history.api.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.uncovering_history.api.model.ElementPI;

public interface ElementPIRepository extends MongoRepository<ElementPI, String> {
    List<ElementPI> findByParentId(String parentId);
    List<ElementPI> findByNameContainingIgnoreCase(String name);
}
