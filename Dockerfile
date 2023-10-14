# Estágio 1: Configurar o ambiente de build
FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y

WORKDIR /app
COPY . .

RUN mvn clean install

# Estágio 2: Criar a imagem final
FROM ubuntu:latest

COPY --from=build /app/target/todolist-1.0.0.jar app.jar

EXPOSE 8080

ENTRYPOINT [ "java", "-jar", "app.jar" ]
