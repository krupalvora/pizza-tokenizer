-- Migration: Add 'served' status and pizza_type column
-- Run this SQL in your Supabase SQL Editor if you already have the tokens table

-- Add pizza_type column if it doesn't exist
ALTER TABLE tokens ADD COLUMN IF NOT EXISTS pizza_type TEXT DEFAULT 'Regular Pizza';

-- Update status constraint to include 'served'
ALTER TABLE tokens DROP CONSTRAINT IF EXISTS tokens_status_check;
ALTER TABLE tokens ADD CONSTRAINT tokens_status_check CHECK (status IN ('pending', 'ready', 'served'));

-- Update any existing NULL pizza_type values
UPDATE tokens SET pizza_type = 'Regular Pizza' WHERE pizza_type IS NULL;

