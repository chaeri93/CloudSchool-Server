FROM amazoncorretto:17-alpine

WORKDIR /app

COPY build/libs/*-SNAPSHOT.jar app.jar


EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]