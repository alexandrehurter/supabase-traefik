-- Create the _analytics schema in the _supabase database
-- This script should be executed while connected to the _supabase database
-- Usage: psql -U postgres -d _supabase -f _supabase_schema.sql

-- Create schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS _analytics;

-- Grant privileges to supabase_admin
GRANT ALL PRIVILEGES ON SCHEMA _analytics TO supabase_admin;

-- Set default privileges for future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA _analytics GRANT ALL ON TABLES TO supabase_admin;
ALTER DEFAULT PRIVILEGES IN SCHEMA _analytics GRANT ALL ON SEQUENCES TO supabase_admin;

