require_relative "db"

class Country

  attr_accessor :name, :population, :capital, :area
  attr_reader :id

  def initialize(name, population, capital, area, id=nil)
    @name = name
    @population = population
    @capital = capital
    @area = area
    @id = id
  end

  def self.all
    results = []

    DB.exec("SELECT * FROM countries;") do |countries|
      countries.each do |country|
        results << create_from_row(country)
      end
    end

    results
  end

  def self.create_from_row(c)
    Country.new(c["name"], c["population"], c["capital"], c["area"], c["id"])
  end

  def self.find(id)
    DB.exec_params("SELECT * FROM countries WHERE id=$1;", [id]) do |results|
      return create_from_row(results[0])
    end
  end
end
