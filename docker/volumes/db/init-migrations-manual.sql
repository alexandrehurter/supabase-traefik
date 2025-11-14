-- Manual initialization script for supabase_migrations schema
-- Run this script if the database already exists and the migrations schema is missing
-- Usage: psql -U postgres -d <your_database> -f init-migrations-manual.sql
-- Or: docker exec -i supabase-db psql -U postgres -d postgres -f - < init-migrations-manual.sql

-- Create schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS supabase_migrations;

-- Create the schema_migrations table if it doesn't exist
CREATE TABLE IF NOT EXISTS supabase_migrations.schema_migrations (
  version TEXT NOT NULL PRIMARY KEY,
  statements TEXT[],
  name TEXT
);

-- Grant necessary permissions
GRANT USAGE ON SCHEMA supabase_migrations TO supabase_admin;
GRANT ALL PRIVILEGES ON SCHEMA supabase_migrations TO supabase_admin;
GRANT ALL PRIVILEGES ON TABLE supabase_migrations.schema_migrations TO supabase_admin;

-- Set default privileges for future objects
ALTER DEFAULT PRIVILEGES IN SCHEMA supabase_migrations GRANT ALL ON TABLES TO supabase_admin;
ALTER DEFAULT PRIVILEGES IN SCHEMA supabase_migrations GRANT ALL ON SEQUENCES TO supabase_admin;

