-- ============================================================
-- PK Performance Test: Table Creation Script
-- Creates four tables with identical structure except for
-- the primary key column type.
-- ============================================================


-- INT table
-- Uses BIGINT with GENERATED ALWAYS AS IDENTITY.
-- This is the modern standard approach in Postgres.
-- The database assigns sequential integer values automatically.

CREATE TABLE pk_test_int (
    id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    label       TEXT        NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL
);


-- TEXT table
-- Uses a TEXT column as the primary key.
-- A value must be supplied on every insert.

CREATE TABLE pk_test_text (
    id          TEXT        PRIMARY KEY,
    label       TEXT        NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL
);


-- UUIDv4 table
-- Uses a UUID column with gen_random_uuid() as the default.
-- gen_random_uuid() is built into Postgres 13+. No extension needed.

CREATE TABLE pk_test_uuidv4 (
    id          UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
    label       TEXT        NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL
);


-- UUIDv7 table
-- Uses a UUID column with a time-ordered UUIDv7 value as the default.
-- Native UUIDv7 generation is available from Postgres 18.

CREATE TABLE pk_test_uuidv7 (
    id          UUID        PRIMARY KEY DEFAULT uuidv7(),
    label       TEXT        NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL
);


