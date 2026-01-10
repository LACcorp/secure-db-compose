#!/bin/bash
set -e

echo ">>> Applying custom PostgreSQL configuration..."

# Copy custom configuration files to the PostgreSQL data directory
cp /custom-config/postgresql.conf /var/lib/postgresql/data/postgresql.conf
cp /custom-config/pg_hba.conf /var/lib/postgresql/data/pg_hba.conf

# Set appropriate ownership and permissions
chown postgres:postgres /var/lib/postgresql/data/postgresql.conf
chown postgres:postgres /var/lib/postgresql/data/pg_hba.conf
chmod 600 /var/lib/postgresql/data/pg_hba.conf

echo ">>> Custom configuration applied successfully."
echo ">>> PostgreSQL will now start with your settings."