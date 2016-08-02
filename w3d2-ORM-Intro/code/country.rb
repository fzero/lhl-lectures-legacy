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

  # Let's create a constant to hold the table name. This way we can quickly
  # update all queries if this changes.
  TABLE = 'countries'

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
    # TODO: check for errors
    if saved?
      # If we have an id, it means the object is already saved to the
      # database, so we need to do an UPDATE
      DB.exec_params(
        "UPDATE #{TABLE} SET name=$1, population=$2, capital=$3, area=$4 " +
        "WHERE id=$5;",
        [@name, @population, @capital, @area, @id]
      )
    else
      # There are two ways to create new records:
      # - Create a new instance, add data and then save it or...
      # - ...insert data in the table right away.
      # The code below deals with option one, e.g.:
      # c = Country.new(name: 'Brazil')
      # c.save
      result = DB.exec_params(
        "INSERT into #{TABLE} (name, population, capital, area) VALUES " +
        "($1, $2, $3, $4) RETURNING id;",
        [@name, @population, @capital, @area]
      )
      @id = result[0]['id'].to_i
    end
    # If everything goes well, we'll return the updated Country instance.
    self
  end

  def delete
    return unless saved? # We can only proceed if we have an id
    DB.exec("DELETE from #{TABLE} where id=#{@id};")
    self
  end

  def saved?
    !@id.nil?
  end

  # Methods to find, create and deal with collections of data should be
  # class methods.
  class << self

    def all
      # PG will returns something that looks like an array of hashes, but our class
      # should always return an array of Country objects. The line below will
      # use the instance_from_row method to convert each result before
      # returning it.
      DB.exec("SELECT * from #{TABLE};").map {|country| instance_from_row(country)}
      # it's the same as:
      # output = []
      # DB.exec("SELECT * from countries;").each |country|
      #   output << instance_from_row(country)
      # end
      # output
    end

    def find(id)
      result = DB.exec_params("SELECT * from #{TABLE} where id=$1;", [id])
      return nil if result.values.empty?
      instance_from_row(result.first)
    end

    def find_by_name(name)
      result = DB.exec_params("SELECT * from #{TABLE} where name ILIKE $1;", ["%#{name}%"])
      return [] if result.values.empty?
      result.map {|country| instance_from_row(country)}
    end

    # This is the other way of creating objects in the database.
    # It's a class method that takes a hash containing country data,
    # inserts it on the table and returns a new country instance.
    def create(data)
      result = DB.exec_params(
        "INSERT into #{TABLE} (name, population, capital, area) VALUES " +
        "($1, $2, $3, $4) RETURNING id;",
        [data[:name], data[:population], data[:capital], data[:area]]
      )
      Country.new(data.merge(id: result[0]['id'].to_i))
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
