FROM openjdk:8
ADD target/*.jar biom.jar
EXPOSE 9090
ENTRYPORT java -jar biom.jar