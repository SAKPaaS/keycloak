FROM jboss/keycloak
COPY /theme/ /opt/jboss/keycloak/themes/happyhamster/
COPY /template/ /opt/jboss/keycloak/themes/happyhamster-base/
