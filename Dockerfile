FROM maven:3.5.4-jdk-8-alpine as step1
RUN mkdir -p /app/src
WORKDIR /app
COPY src src
COPY pom.xml .
RUN mvn package

FROM openjdk:8u171-jre-alpine
COPY --from=step1 /app/target/users-*.jar ./users.jar
CMD ["java", "-jar", "users.jar"]