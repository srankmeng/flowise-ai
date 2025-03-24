-- Enable the pgvector extension
CREATE EXTENSION IF NOT EXISTS vector;

-- Create a table for storing embeddings
CREATE TABLE IF NOT EXISTS embeddings (
  id SERIAL PRIMARY KEY,
  content TEXT NOT NULL,
  embedding vector(1536) NOT NULL,  -- Adjust dimension to match your embeddings
  metadata JSONB
);

-- Create an index for similarity search
CREATE INDEX IF NOT EXISTS embedding_idx ON embeddings USING ivfflat (embedding vector_l2_ops) WITH (lists = 100);
