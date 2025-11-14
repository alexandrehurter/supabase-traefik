-- Create the _supabase database for analytics/logflare
-- This database is used by Logflare to store analytics data
-- 
-- Note: CREATE DATABASE cannot be executed in a transaction block
-- This script should be executed directly, not within a DO block

-- Create database (will fail silently if it already exists)
CREATE DATABASE _supabase;

-- Grant privileges to supabase_admin
GRANT ALL PRIVILEGES ON DATABASE _supabase TO supabase_admin;
