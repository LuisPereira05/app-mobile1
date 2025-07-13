# Como debugar:

## Abrir a API 

1. No cmd (No diretorio "uncovering-history-spring") executar `docker compose up`
2. Abrir Docker Desktop e abrir o container "api" na terminal
3. Executar `./mvnw spring-boot:run`

## Executar a app (Recomendo por USB em dispositivo Android)

1. Abrir com Visual Studio Code a pasta "historiador-app"
2. Fazer Forward Port no VSCode do porto 8080 com visibilidade pública
3. Copiar o endereço do devtunnels para o arquivo .env dentro do mesmo diretório (**IMPORTANTE**: que o endereço não finalize com "/")
4. Executar:
   ```
   flutter clean
   flutter pub get
   flutter run
   ```
  (Isso vai tentar executar no dispositivo configurado, a app foi testada somente em um dispositivo Android via USB)

Se tudo dar certo, a app devería estar rodando.
