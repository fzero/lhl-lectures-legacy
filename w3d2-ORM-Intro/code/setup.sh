# Quick shell script to create the database, define the schema and load seed data.

createdb w3d2
psql w3d2 < schema.sql
psql w3d2 < seed.sql
