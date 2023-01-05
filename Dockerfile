FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM adoptopenjdk/openjdk11:jre-11.0.10_9-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar /app/*.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","*.jar"]
