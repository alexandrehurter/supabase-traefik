-- Initialize supabase_migrations schema and schema_migrations table
-- This script creates the schema and table needed by supabase-meta to track migrations
-- It should be executed early in the initialization process

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

