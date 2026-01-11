# Secure Database Environments with SSL/TLS

This repository provides ready-to-use Docker Compose configurations for running **databases with mandatory SSL/TLS encryption**.  
All sensitive artifacts (certificates, keys) are generated at build time—**nothing is committed to source control**.

> 🔒 **For local development and testing only**  
> This setup uses **self-signed certificates** (no CA configured). Do not use in production environments.

# 🐘 Postgres
## 1. Start the Database

From the `v10.5/` directory, run:

```bash
docker compose down -v && docker compose up --build -d
```
## 2. Verify SSL-Only Access

The setup enforces SSL for all TCP/IP connections via `hostssl` in `pg_hba.conf`.

### ✅ Connect with SSL (should succeed)

```bash
psql "host=localhost port=5432 dbname=lditest user=postgres password=testPassword sslmode=require"
```

### ❌ Connect without SSL (should fail)
```bash
psql "host=localhost port=5432 dbname=lditest user=postgres password=testPassword sslmode=disable"
```

### Expected error:
```bash
FATAL: no pg_hba.conf entry for host "...", user "...", database "...", SSL off
```

## 3. Optional: Confirm SSL at runtime
```sql
-- Query
SHOW ssl;

-- Result
 ssl 
-----
 on
```
