# Define a imagem base
FROM openjdk:17-jdk-slim AS build

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo JAR para o diretório de trabalho
COPY target/to-do-list-0.0.1-SNAPSHOT.jar /app/to-do-list.jar

# Define o comando padrão para executar o aplicativo Spring Boot
CMD ["java", "-jar", "to-do-list.jar"]