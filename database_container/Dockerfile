# Use the official PostgreSQL image from Docker Hub
FROM postgres:latest

# Copy the init.sql script to the appropriate directory
COPY init.sql /docker-entrypoint-initdb.d/
