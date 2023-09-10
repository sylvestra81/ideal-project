FROM openjdk:11
EXPOSE 8080
ADD target/ideal-project-1.0-SNAPSHOT.jar ideal-project-1.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/ideal-project-1.0-SNAPSHOT.jar"]