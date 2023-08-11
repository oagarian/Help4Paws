FROM postgres

WORKDIR /database

COPY ./database/schema.sql /docker-entrypoint-initdb.d/

USER root