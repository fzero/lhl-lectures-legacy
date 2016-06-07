# The only purpose of this file is creating a database connection
# to Postgres using the pg gem. DB will be our point of contact with
# the `w3d2` database where the `countries` table is stored.

require "pg"

DB = PG.connect({
  host: 'localhost',
  dbname: 'w3d2'
})
