# FROM maven:3.8.7-eclipse-temurin-17-focal as build
FROM maven:3.9.4-amazoncorretto-21-debian as build
# FROM vegardit/graalvm-maven:21.0.0 as build

WORKDIR /app
COPY pom.xml .
RUN --mount=type=cache,target=/root/.m2 --mount=type=cache,target=/root/.vaadin mvn clean package -Dmaven.main.skip -Dmaven.test.skip && rm -r target

COPY src ./src
RUN --mount=type=cache,target=/root/.m2 --mount=type=cache,target=/root/.vaadin --mount=type=cache,target=/root/.npm mvn clean package

FROM registry.access.redhat.com/ubi8/openjdk-21:1.18

ENV LANGUAGE='en_US:en'


# We make four distinct layers so if there are application changes the library layers can be re-used
COPY --chown=185 target/quarkus-app/lib/ /deployments/lib/
COPY --chown=185 target/quarkus-app/*.jar /deployments/
COPY --chown=185 target/quarkus-app/app/ /deployments/app/
COPY --chown=185 target/quarkus-app/quarkus/ /deployments/quarkus/

EXPOSE 8080
USER 185
ENV JAVA_OPTS_APPEND="-Dquarkus.http.host=0.0.0.0 -Djava.util.logging.manager=org.jboss.logmanager.LogManager"
ENV JAVA_APP_JAR="/deployments/quarkus-run.jar"

ENTRYPOINT [ "/opt/jboss/container/java/run/run-java.sh" ]
