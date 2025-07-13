package com.uncovering_history.api.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.uncovering_history.api.model.InterestPoint;

public interface InterestPointRepository extends MongoRepository<InterestPoint, String> {
    List<InterestPoint> findByName(String name);
}
