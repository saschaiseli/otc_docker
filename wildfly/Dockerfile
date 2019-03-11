FROM jboss/wildfly:14.0.0.Final
LABEL maintainer="Sascha Iseli"

ARG USER="default_user"
ARG PASS="secret"
ARG HOST="host"
ARG PORT=3306
ARG DATABASE="dbname"

ENV DB_USERNAME=${USER}
ENV DB_PASSWORD=${PASS}
ENV DB_HOST=${HOST}
ENV DB_PORT=${PORT}
ENV DB_DATABASE=${DATABASE}


ENV INSTALL_DIR=/opt/jboss/wildfly \
    CONFIG_DIR=/opt/jboss/wildfly/standalone/configuration \
    DEPLOYMENT_DIR=/opt/jboss/wildfly/standalone/deployments

RUN /opt/jboss/wildfly/bin/add-user.sh admin secret --silent

USER root
RUN mkdir -p $INSTALL_DIR/modules/system/layers/base/org/mariadb/main
COPY resources/mariadb/module.xml $INSTALL_DIR/modules/system/layers/base/org/mariadb/main
COPY resources/mariadb/mariadb-java-client-2.3.0.jar $INSTALL_DIR/modules/system/layers/base/org/mariadb/main
RUN chown -R jboss  /opt/jboss/wildfly/modules/system/layers/base/org/mariadb


RUN mkdir -p $INSTALL_DIR/modules/system/layers/base/org/postgresql/main
COPY resources/postgres/module.xml $INSTALL_DIR/modules/system/layers/base/org/postgresql/main
COPY resources/postgres/postgresql-42.2.5.jar $INSTALL_DIR/modules/system/layers/base/org/postgresql/main
RUN chown -R jboss  /opt/jboss/wildfly/modules/system/layers/base/org/postgresql

COPY standalone.xml $CONFIG_DIR
USER jboss
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]