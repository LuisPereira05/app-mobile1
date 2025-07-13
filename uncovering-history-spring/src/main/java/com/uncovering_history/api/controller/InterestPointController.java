package com.uncovering_history.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.uncovering_history.api.model.InterestPoint;
import com.uncovering_history.api.repository.InterestPointRepository;
import com.uncovering_history.api.service.InterestPointService;

@RestController
@RequestMapping("/api/interest-points")
public class InterestPointController {

    @Autowired
    private InterestPointService interestPointService;

    @Autowired
    private InterestPointRepository repository;

    @PostMapping
    public ResponseEntity<InterestPoint> create(@RequestBody InterestPoint interestPoint) {
        InterestPoint created = interestPointService.createInterestPoint(interestPoint);
        return ResponseEntity.ok(created);
    }

    @GetMapping
    public ResponseEntity<List<InterestPoint>> getAll() {
        return ResponseEntity.ok(interestPointService.getAllInterestPoints());
    }

    @GetMapping("/{id}")
    public ResponseEntity<InterestPoint> getById(@PathVariable String id) {
        InterestPoint interestPoint = interestPointService.getInterestPointById(id);
        if (interestPoint == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok(interestPoint);
    }

    @PutMapping("/{id}")
    public ResponseEntity<InterestPoint> update(@PathVariable String id, @RequestBody InterestPoint updatedData) {
        InterestPoint updated = interestPointService.updateInterestPoint(id, updatedData);
        if (updated == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok(updated);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable String id) {
        boolean deleted = interestPointService.deleteInterestPoint(id);
        if (!deleted) return ResponseEntity.notFound().build();
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/search")
    public ResponseEntity<List<InterestPoint>> getByName(@RequestParam String name) {
        List<InterestPoint> results = repository.findByName(name);
        if (results.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(results);
    }
}

