package com.uncovering_history.api.controller;

import java.util.List;

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

import com.uncovering_history.api.model.ElementPI;
import com.uncovering_history.api.service.ElementPIService;

@RestController
@RequestMapping("/api/elements")
public class ElementPIController {

    private final ElementPIService elementPIService;

    public ElementPIController(ElementPIService elementPIService) {
        this.elementPIService = elementPIService;
    }

    @GetMapping
    public List<ElementPI> findAll() {
        return elementPIService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<ElementPI> findById(@PathVariable String id) {
        return elementPIService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<ElementPI> update(@PathVariable String id, @RequestBody ElementPI updatedElement) {
        return elementPIService.findById(id)
                .map(existing -> {
                    updatedElement.setObjectId(id);
                    ElementPI saved = elementPIService.save(updatedElement);
                    return ResponseEntity.ok(saved);
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ElementPI save(@RequestBody ElementPI elemento) {
        return elementPIService.save(elemento);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable String id) {
        elementPIService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
    @GetMapping("/search")
    public ResponseEntity<List<ElementPI>> searchByParentId(@RequestParam("parentId") String parentId) {
        List<ElementPI> elementos = elementPIService.searchByParentId(parentId);
        return ResponseEntity.ok(elementos);
    }
}
