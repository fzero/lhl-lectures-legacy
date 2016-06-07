require_relative "db"

# CREATE TABLE countries (
#   id          serial NOT NULL PRIMARY KEY,
#   name        varchar(40) NOT NULL,
#   population  integer,
#   capital     varchar(40),
#   area        integer
# );

class Country
  # This is a Model class.
  # A Model represent the table, while each instance of a model represents a row.
  # instance method.

  attr_accessor :name, :population, :capital, :area  # Accessors for all columns
  attr_reader :id  # defined by the database, so it should be read-only

  # I'm using a hash to initialize objects, so I don't need to remember the
  # order of parameters. This pattern is also used by ActiveRecord.
  def initialize(params={})
    data = {
      id: nil,
      name: nil,
      population: nil,
      capital: nil,
      area: nil
    }.merge(params)

    @id = data[:id]
    @name = data[:name]
    @population = data[:population]
    @capital = data[:capital]
    @area = data[:area]
  end

  # A quick way to find out if a record is saved is by checking if it has an id
  def saved?
    !!@id
  end

  def save
    # Right now we're only doing INSERTs. The logic will have to change a little
    # to figure out if you need to do an INSERT or an UPDATE.
    # HINT: Right now we're bailing if the record is already saved.
    #       Updating = changing data that's already saved. ;-)
    return false if saved?
    @id = DB.exec_params(
      "INSERT INTO countries (name, population, capital, area) " +
      "VALUES ($1, $2, $3, $4) RETURNING id",
      [@name, @population, @capital, @area]
    )
  end

  def delete
    return false unless saved?
    DB.exec_params("DELETE FROM countries WHERE id=$1 RETURNING id", [@id])
  end


  # Methods to find, create and deal with collections of data should be
  # class methods.
  class << self

    def all
      DB.exec('SELECT * FROM countries;').map do |row|
        instance_from_row(row)
      end
    end

    def find(id)
      result = DB.exec_params('SELECT * FROM countries WHERE id=$1;', [id]).map do |row|
        instance_from_row(row)
      end
      result.first
    end

    def find_by_name(name)
      DB.exec_params('SELECT * FROM countries WHERE name ILIKE $1;', ["%#{name}%"]).map do |row|
        instance_from_row(row)
      end
    end

    def create(data)
      c = Country.new(data)
      c.save
    end

    private

    # Utility method to convert the string hashes returned by PG into
    # actual instances of Country with proper type conversions.
    def instance_from_row(row)
      Country.new({
        id: row['id'].to_i,
        name: row['name'],
        capital: row['capital'],
        population: row['population'].to_i,
        area: row['area'].to_i
      })
    end

  end


end
