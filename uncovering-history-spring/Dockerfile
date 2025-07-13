FROM eclipse-temurin:21

WORKDIR /app

COPY . /app

# Dá permissão de execução ao mvnw
RUN chmod +x ./mvnw

# Compila o projeto e instala dependências
RUN ./mvnw clean package -DskipTests

EXPOSE 8080

# Inicia a aplicação com Spring Boot
CMD ["./mvnw", "spring-boot:run"]
