# Dockerfile
FROM postgres:10.5

# 1. Create directory for SSL certificates
RUN mkdir -p /etc/ssl/pg && \
    openssl req -new -x509 -days 365 \
    -nodes -text -out /etc/ssl/pg/server.crt \
    -keyout /etc/ssl/pg/server.key \
    -subj "/CN=localhost" && \
    chown postgres:postgres /etc/ssl/pg/server.crt /etc/ssl/pg/server.key && \
    chmod 0644 /etc/ssl/pg/server.crt && \
    chmod 0600 /etc/ssl/pg/server.key

# 2. Copy custom configuration files
COPY conf/ /custom-config/

# 3. Copy initialization script to apply custom configurations
COPY init-scripts/custom-postgres-config.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/custom-postgres-config.sh
