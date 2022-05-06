FROM jboss/keycloak:11.0.3

RUN curl -sL https://github.com/aerogear/keycloak-metrics-spi/releases/download/2.5.3/keycloak-metrics-spi-2.5.3.jar -o /opt/jboss/keycloak/standalone/deployments/keycloak-metrics-spi-2.5.3.jar

COPY ./themes /opt/jboss/keycloak/themes