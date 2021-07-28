FROM maven:3.5.4-jdk-8-alpine as maven
RUN mkdir -p /app/src
WORKDIR /app
COPY pom.xml .pom.xml
COPY src src
#RUN mvn dependency:go-offline -B
RUN mvn package

FROM openjdk:8u171-jre-alpine
COPY --from=maven /app/target/users-*.jar ./users.jar
CMD ["java", "-jar", "users.jar"]