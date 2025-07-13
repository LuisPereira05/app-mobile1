package com.uncovering_history.api.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDateTime;

@Data
@Document(collection = "photo")
public class Photo {

    @Id
    private String objectId;

    private String url;
    private String description;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
