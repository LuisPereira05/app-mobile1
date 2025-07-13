package com.uncovering_history.api.model;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;

@Data
@Document(collection = "interest_point")
public class InterestPoint {

    @Id
    private String objectId;

    @Indexed
    private String name;
    private String tipo;

    private String endereco;
    private String descripcion;
    private String bairro;
    private String contato;
    private String personalizados;
    private List<String> fotos;
    private List<String> elementos;
    private String idAuthor;
    private Double lat;
    private Double lon;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;


}
