FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD ../docker-test/target/gs-spring-boot-docker-0.1.0.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]