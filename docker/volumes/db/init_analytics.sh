#!/bin/bash
# Script to initialize the _supabase database and _analytics schema for Logflare
# This script can be run manually or added to docker-entrypoint-initdb.d

set -e

POSTGRES_USER="${POSTGRES_USER:-postgres}"
POSTGRES_PASSWORD="${POSTGRES_PASSWORD}"
POSTGRES_HOST="${POSTGRES_HOST:-localhost}"
POSTGRES_PORT="${POSTGRES_PORT:-5432}"

export PGPASSWORD="${POSTGRES_PASSWORD}"

echo "Creating _supabase database if it doesn't exist..."
psql -h "${POSTGRES_HOST}" -p "${POSTGRES_PORT}" -U "${POSTGRES_USER}" -d postgres <<-EOSQL
    SELECT 'CREATE DATABASE _supabase'
    WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '_supabase')\gexec
    
    GRANT ALL PRIVILEGES ON DATABASE _supabase TO supabase_admin;
EOSQL

echo "Creating _analytics schema in _supabase database..."
psql -h "${POSTGRES_HOST}" -p "${POSTGRES_PORT}" -U "${POSTGRES_USER}" -d _supabase <<-EOSQL
    CREATE SCHEMA IF NOT EXISTS _analytics;
    GRANT ALL PRIVILEGES ON SCHEMA _analytics TO supabase_admin;
    ALTER DEFAULT PRIVILEGES IN SCHEMA _analytics GRANT ALL ON TABLES TO supabase_admin;
    ALTER DEFAULT PRIVILEGES IN SCHEMA _analytics GRANT ALL ON SEQUENCES TO supabase_admin;
EOSQL

echo "Analytics database and schema initialized successfully!"

