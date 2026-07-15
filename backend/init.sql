CREATE TABLE IF NOT EXISTS destinations (
    id SERIAL PRIMARY KEY,
    country TEXT NOT NULL,
    capital TEXT NOT NULL,
    population BIGINT NOT NULL,
    region TEXT NOT NULL
);