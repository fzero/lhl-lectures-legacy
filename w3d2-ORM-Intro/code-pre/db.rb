require "pg"

DB = PG.connect({
  host: 'localhost',
  dbname: 'w3d2'
})
