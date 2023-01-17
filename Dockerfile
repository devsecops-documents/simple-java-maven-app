#git
FROM alpine/git as git

WORKDIR /app
RUN git clone -b 2.11 https://github.com/devsecops-documents/simple-java-maven-app.git

#Maven
FROM maven:3.8.5-openjdk-17 as build
WORKDIR /app
COPY --from=git /app/simple-java-maven-app  /app
RUN java -version
RUN mvn package

#java
FROM openjdk:17.0.2-jdk
WORKDIR /
COPY --from=build /app/target/my-app-1.0-SNAPSHOT.jar /my-app-1.0-SNAPSHOT.jar
CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
