-- Pizza Token System Database Schema
-- Run this SQL in your Supabase SQL Editor

-- Create tokens table
CREATE TABLE IF NOT EXISTS tokens (
    id BIGSERIAL PRIMARY KEY,
    token_no INTEGER NOT NULL UNIQUE,
    status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'ready')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()) NOT NULL
);

-- Create index for faster queries
CREATE INDEX IF NOT EXISTS idx_tokens_status ON tokens(status);
CREATE INDEX IF NOT EXISTS idx_tokens_token_no ON tokens(token_no);

-- Enable Row Level Security (RLS) - Allow public read/write for MVP simplicity
-- For production, you should restrict this properly
ALTER TABLE tokens ENABLE ROW LEVEL SECURITY;

-- Create policy to allow all operations (for MVP - adjust for production)
CREATE POLICY "Allow all operations on tokens" ON tokens
    FOR ALL
    USING (true)
    WITH CHECK (true);

-- Enable Realtime for the tokens table
ALTER PUBLICATION supabase_realtime ADD TABLE tokens;

-- Create function to auto-update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = TIMEZONE('utc', NOW());
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger to automatically update updated_at
CREATE TRIGGER update_tokens_updated_at
    BEFORE UPDATE ON tokens
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

