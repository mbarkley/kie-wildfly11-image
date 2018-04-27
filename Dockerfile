FROM docker.io/openshift/wildfly-110-centos7

ADD application-users.properties /wildfly/standalone/configuration/application-users.properties
ADD application-roles.properties /wildfly/standalone/configuration/application-roles.properties
ADD standalone.xml /wildfly/standalone/configuration/standalone.xml
ADD standalone.conf /wildfly/bin/standalone.conf

# Fix permissions -- copied from wildfly image
USER root
RUN chown -R 1001:0 /wildfly && \
    chmod -R ug+rwX /wildfly

USER 1001
