
FROM jenkins/jenkins
LABEL maintainer="adesoji@blick.ng"
COPY . /data
WORKDIR /data
RUN mvn clean package
RUN cp target/*.jar /tmp/direction.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/tmp/direction.jar"]