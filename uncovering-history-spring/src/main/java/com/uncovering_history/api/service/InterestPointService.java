package com.uncovering_history.api.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uncovering_history.api.model.InterestPoint;
import com.uncovering_history.api.repository.InterestPointRepository;

@Service
public class InterestPointService {

    @Autowired
    private InterestPointRepository interestPointRepository;

    public InterestPoint createInterestPoint(InterestPoint interestPoint) {
        return interestPointRepository.save(interestPoint);
    }

    public List<InterestPoint> getAllInterestPoints() {
        return interestPointRepository.findAll();
    }

    public InterestPoint getInterestPointById(String id) {
        Optional<InterestPoint> optional = interestPointRepository.findById(id);
        return optional.orElse(null);
    }

    public InterestPoint updateInterestPoint(String id, InterestPoint updatedData) {
        Optional<InterestPoint> optional = interestPointRepository.findById(id);
        if (optional.isEmpty()) return null;

        InterestPoint existing = optional.get();
        existing.setName(updatedData.getName());
        existing.setTipo(updatedData.getTipo());
        existing.setEndereco(updatedData.getEndereco());
        existing.setDescripcion(updatedData.getDescripcion());
        existing.setBairro(updatedData.getBairro());
        existing.setContato(updatedData.getContato());
        existing.setPersonalizados(updatedData.getPersonalizados());
        existing.setFotos(updatedData.getFotos());
        existing.setElementos(updatedData.getElementos());
        existing.setIdAuthor(updatedData.getIdAuthor());
        existing.setLat(updatedData.getLat());
        existing.setLon(updatedData.getLon());
        existing.setCreatedAt(updatedData.getCreatedAt());
        existing.setUpdatedAt(updatedData.getUpdatedAt());

        return interestPointRepository.save(existing);
    }

    public boolean deleteInterestPoint(String id) {
        if (!interestPointRepository.existsById(id)) return false;
        interestPointRepository.deleteById(id);
        return true;
    }

    public List<InterestPoint> findByName(String name) {
        return interestPointRepository.findByName(name);
    }
}
