package com.uncovering_history.api.migrations;

import java.time.LocalDateTime;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;

import com.uncovering_history.api.model.ElementPI;
import com.uncovering_history.api.model.InterestPoint;
import com.uncovering_history.api.service.ElementPIService;
import com.uncovering_history.api.service.InterestPointService;

import io.mongock.api.annotations.BeforeExecution;
import io.mongock.api.annotations.ChangeUnit;
import io.mongock.api.annotations.Execution;
import io.mongock.api.annotations.RollbackBeforeExecution;
import io.mongock.api.annotations.RollbackExecution;

@ChangeUnit(id = "ip_seed", order = "002", author = "system")
public class IPSeed {

    private final MongoTemplate mongoTemplate;
    private final InterestPointService interestPointService;
    private final ElementPIService elementPIService;

    @Autowired
    public IPSeed(MongoTemplate mongoTemplate, InterestPointService interestPointService, ElementPIService elementPIService) {
        this.mongoTemplate = mongoTemplate;
        this.interestPointService = interestPointService;
        this.elementPIService = elementPIService;
    }

    @BeforeExecution
    public void before() {
        mongoTemplate.createCollection("elements");
    }

    @RollbackBeforeExecution
    public void rollbackBefore() {
        mongoTemplate.dropCollection("elements");
    }

    @Execution
    public void executeChange() {
        LocalDateTime now = LocalDateTime.now();

        // Criar InterestPoints SEM objectId (deixa Mongo gerar)
        InterestPoint ip1 = new InterestPoint();
        ip1.setName("Palácio Moysés Vianna");
        ip1.setTipo("Patrimônio histórico");
        ip1.setEndereco("Rua Principal, 100");
        ip1.setDescripcion("Prédio histórico centenário de arquitetura eclética, enriquecidos por elementos neoclássicos e românicos, símbolo do poder público local.");
        ip1.setBairro("Centro");
        ip1.setContato("palacio@moysesvianna.gov.br");
        ip1.setPersonalizados(null);
        ip1.setFotos(Arrays.asList("https://images.unsplash.com/photo-1568605114967-8130f3a36994?auto=format&fit=crop&w=800&q=80"));
        ip1.setIdAuthor("system");
        ip1.setLat(-30.8850);
        ip1.setLon(-55.5100);
        ip1.setCreatedAt(now);
        ip1.setUpdatedAt(now);

        mongoTemplate.save(ip1);

        InterestPoint ip2 = new InterestPoint();
        ip2.setName("Catedral de Santana");
        ip2.setTipo("Religioso");
        ip2.setEndereco("Praça da Catedral, s/n");
        ip2.setDescripcion("Datada de 1918 é uma construção religiosa imponente, sede da Diocese, com valor arquitetônico e religioso.");
        ip2.setBairro("Centro");
        ip2.setContato("contato@catedraldesantana.org");
        ip2.setPersonalizados(null);
        ip2.setFotos(Arrays.asList("https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80"));
        ip2.setIdAuthor("system");
        ip2.setLat(-30.8855);
        ip2.setLon(-55.5130);
        ip2.setCreatedAt(now);
        ip2.setUpdatedAt(now);

        mongoTemplate.save(ip2);

        InterestPoint savedIp1 = interestPointService.findByName(ip1.getName()).getFirst();

        // Criar elementos para o Palácio, usando savedIp1.getObjectId() como parentId
        ElementPI e1 = new ElementPI();
        e1.setParentId(savedIp1.getObjectId());
        e1.setName("Hall Principal");
        e1.setTipo("Escultura");
        e1.setDescripcion("O hall de entrada com detalhes ornamentais.");
        e1.setLat(-30.8850);
        e1.setLon(-55.5100);
        e1.setCreatedAt(now);
        e1.setUpdatedAt(now);
        e1.setIdAuthor("system");
        e1.setPhotos(Arrays.asList("https://images.unsplash.com/photo-1558979158-65a1eaa08691?auto=format&fit=crop&w=800&q=80"));
        ElementPI savedE1 = elementPIService.save(e1);



        ElementPI e2 = new ElementPI();
        e2.setParentId(savedIp1.getObjectId());
        e2.setName("Jardim Externo");
        e2.setTipo("Escultura");
        e2.setDescripcion("Jardim com esculturas e fonte central.");
        e2.setLat(-30.8851);
        e2.setLon(-55.5101);
        e2.setCreatedAt(now);
        e2.setUpdatedAt(now);
        e2.setIdAuthor("system");
        e2.setPhotos(Arrays.asList("https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80"));
        ElementPI savedE2 = elementPIService.save(e2);

        InterestPoint savedIp2 = interestPointService.findByName(ip2.getName()).getFirst();

        // Criar elementos para a Catedral, usando savedIp2.getObjectId() como parentId
        ElementPI e3 = new ElementPI();
        e3.setParentId(savedIp2.getObjectId());
        e3.setName("Altar Principal");
        e3.setTipo("Placa histórica");
        e3.setDescripcion("Altar com decoração barroca.");
        e3.setLat(-30.8855);
        e3.setLon(-55.5130);
        e3.setCreatedAt(now);
        e3.setUpdatedAt(now);
        e3.setIdAuthor("system");
        e3.setPhotos(Arrays.asList("https://images.unsplash.com/photo-1549887535-5bf195d32b42?auto=format&fit=crop&w=800&q=80"));
        ElementPI savedE3 = elementPIService.save(e3);

        ElementPI e4 = new ElementPI();
        e4.setParentId(savedIp2.getObjectId());
        e4.setName("Torre do Sino");
        e4.setTipo("Memorial");
        e4.setDescripcion("Torre histórica com o sino original.");
        e4.setLat(-30.8856);
        e4.setLon(-55.5131);
        e4.setCreatedAt(now);
        e4.setUpdatedAt(now);
        e4.setIdAuthor("system");
        e4.setPhotos(Arrays.asList("https://images.unsplash.com/photo-1494526585095-c41746248156?auto=format&fit=crop&w=800&q=80"));
        ElementPI savedE4 = elementPIService.save(e4);

        String e1ObjectId = elementPIService.searchByName(savedE1.getName()).getFirst().getObjectId();
        String e2ObjectId = elementPIService.searchByName(savedE2.getName()).getFirst().getObjectId();
        String e3ObjectId = elementPIService.searchByName(savedE3.getName()).getFirst().getObjectId();
        String e4ObjectId = elementPIService.searchByName(savedE4.getName()).getFirst().getObjectId();



        // Atualizar os InterestPoints com os objectIds dos elementos
        savedIp1.setElementos(Arrays.asList(e1ObjectId, e2ObjectId));
        interestPointService.updateInterestPoint(savedIp1.getObjectId(), savedIp1);
        // mongoTemplate.save(savedIp1); // <-- Salva diretamente no Mongo

        savedIp2.setElementos(Arrays.asList(e3ObjectId, e4ObjectId));
        // mongoTemplate.save(savedIp2); // <-- Salva diretamente no Mongo
        interestPointService.updateInterestPoint(savedIp2.getObjectId(), savedIp2);
    }

    @RollbackExecution
    public void rollbackChange() {
        // Implementar rollback se necessário
    }
}
