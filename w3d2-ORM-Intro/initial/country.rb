require_relative "db"

# Schema reference:
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

  attr_accessor :name, :population, :capital, :area  # Accessors for all columns
  attr_reader :id  # `id` is defined by the database, so it should be read-only

  # I'm using a hash to initialize objects, so I don't need to remember the
  # order of parameters. This pattern is also used by ActiveRecord.
  def initialize(params={})
    @id = params[:id]
    @name = params[:name]
    @population = params[:population]
    @capital = params[:capital]
    @area = params[:area]
  end

  def save
  end

  def delete
  end

  # Methods to find, create and deal with collections of data should be
  # class methods.
  class << self

    def all
    end

    def find(id)
    end

    def find_by_name(name)
    end

    def create(data)
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
