FROM openjdk:17
EXPOSE 8080
ADD target/springboot-sample-app-0.0.1-SNAPSHOT.jar springboot-sample-app.jar
ENTRYPOINT ["java","-jar","/springboot-sample-app.jar"] g