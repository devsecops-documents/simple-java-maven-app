#git
FROM alpine/git as git

WORKDIR /app
RUN git clone https://github.com/devsecops-documents/simple-java-maven-app.git

#Maven
FROM maven:3.8.6-openjdk-8 as build
WORKDIR /app
COPY --from=git /app/simple-java-maven-app  /app
RUN java -version
RUN mvn package

#java
FROM openjdk:11-jre
WORKDIR /
COPY --from=build /app/target/my-app-1.0-SNAPSHOT.jar /my-app-1.0-SNAPSHOT.jar
CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
