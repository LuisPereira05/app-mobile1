package com.uncovering_history.api.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.uncovering_history.api.model.ElementPI;
import com.uncovering_history.api.repository.ElementPIRepository;

@Service
public class ElementPIService {

    private final ElementPIRepository elementoPIRepository;

    public ElementPIService(ElementPIRepository elementoPIRepository) {
        this.elementoPIRepository = elementoPIRepository;
    }

    public List<ElementPI> findAll() {
        return elementoPIRepository.findAll();
    }

    public Optional<ElementPI> findById(String id) {
        return elementoPIRepository.findById(id);
    }

    public ElementPI save(ElementPI elemento) {
        return elementoPIRepository.save(elemento);
    }

    public void deleteById(String id) {
        elementoPIRepository.deleteById(id);
    }

    public List<ElementPI> searchByParentId(String pId) {
        return elementoPIRepository.findByParentId(pId);
    }
    
    public List<ElementPI> searchByName(String name) {
        return elementoPIRepository.findByNameContainingIgnoreCase(name);
    }
}
