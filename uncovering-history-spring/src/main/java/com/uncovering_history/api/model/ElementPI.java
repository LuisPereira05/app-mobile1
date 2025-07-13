package com.uncovering_history.api.model;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;

@Data
@Document(collection = "elements")
public class ElementPI {

    @Id
    private String objectId;

    @Indexed
    private String parentId;

    private String name;
    private String tipo;
    private String descripcion;
    private Double lat;
    private Double lon;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private String personalizados;
    private String idAuthor;

    private List<String> photos;

    // Opcionais predefinidos
    private String historico;
    private String acessibilidade;
    private String horarioFuncionamento;
    private String imagensExtra;
    private String linksUteis;


}
