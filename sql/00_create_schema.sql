-- 00_create_schema.sql
-- Create a dedicated schema and a raw staging table for the supplied Sample Superstore CSV.
-- Run with psql against your local PostgreSQL database.

CREATE SCHEMA IF NOT EXISTS staging;

DROP TABLE IF EXISTS staging.sample_superstore_sales;

CREATE TABLE staging.sample_superstore_sales (
    row_id          INTEGER PRIMARY KEY,
    order_id        TEXT NOT NULL,
    order_date      DATE NOT NULL,
    ship_date       DATE,
    ship_mode       TEXT,
    customer_id     TEXT,
    customer_name   TEXT,
    segment         TEXT,
    country         TEXT,
    city            TEXT,
    state           TEXT,
    postal_code     TEXT,
    region          TEXT,
    product_id      TEXT,
    category        TEXT,
    sub_category    TEXT,
    product_name    TEXT,
    sales           NUMERIC(14, 2),
    quantity        INTEGER,
    discount        NUMERIC(6, 4),
    profit          NUMERIC(14, 2)
);

-- From the repository root, use psql's copy command (client-side file path):
-- \copy staging.sample_superstore_sales FROM 'data/raw/Sample - Superstore.csv' WITH (FORMAT csv, HEADER true, ENCODING 'WIN1252');
--
-- The CSV column order must match the table definition above. Validate row count
-- and numeric/date ranges after loading. Do not commit the raw CSV unless its
-- licence explicitly permits redistribution.
