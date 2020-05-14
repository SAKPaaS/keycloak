FROM jboss/keycloak
COPY /theme/happyhamster/ /opt/jboss/keycloak/themes/happyhamster/
COPY /theme/happyhamster-base/ /opt/jboss/keycloak/themes/happyhamster-base/
