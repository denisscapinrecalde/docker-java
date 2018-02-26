FROM openjdk:8-jdk-alpine
VOLUME /tmp

ARG JAR_NAME

ADD ${JAR_NAME} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]