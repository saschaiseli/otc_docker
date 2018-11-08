FROM jboss/wildfly:14.0.0.Final
LABEL maintainer="Sascha Iseli"

ARG USER="default_user"
ARG PASS="secret"
ARG HOST="host"
ARG PORT=3306
ARG DATABASE="dbname"
ARG DATASOURCE_NAME="DS"
ARG POOL_NAME="pool"

ENV DB_USERNAME=${USER}
ENV DB_PASSWORD=${PASS}
ENV DB_HOST=${HOST}
ENV DB_PORT=${PORT}
ENV DB_DATABASE=${DATABASE}
ENV DB_DATASOURCE_NAME=${DATASOURCE_NAME}
ENV DB_POOL_NAME=${POOL_NAME}

ENV INSTALL_DIR=/opt/jboss/wildfly \
    CONFIG_DIR=/opt/jboss/wildfly/standalone/configuration \
    DEPLOYMENT_DIR=/opt/jboss/wildfly/standalone/deployments

RUN /opt/jboss/wildfly/bin/add-user.sh admin secret --silent

RUN mkdir -p $INSTALL_DIR/modules/system/layers/base/org/mariadb/main
COPY resources/module.xml $INSTALL_DIR/modules/system/layers/base/org/mariadb/main
COPY resources/mariadb-java-client-2.3.0.jar $INSTALL_DIR/modules/system/layers/base/org/mariadb/main
COPY standalone.xml $CONFIG_DIR

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]