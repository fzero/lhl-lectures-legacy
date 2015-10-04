class Table

  @@default_weight = 20 # Kilos
  @@number_of_tables_created = 0

  attr_accessor :weight, :color, :material

  def initialize(options={})
    @weight = options[:weight] || @@default_weight
    @color = options[:color] || 'red'
    @material = options[:material] || 'Ikea mistery wood-like substance'
    @@number_of_tables_created += 1
  end

  def weight_in_pounds
    # Convert pounds to kilos
    @weight * 2.2
  end

  def flip(person_weight, anger)
    unless person_weight > @weight && anger > 9000
      raise TableError, "You cant't flip this table!"
    end
    puts "AAAARGH YOU FLIPPED THE TABLE!"
  rescue TableError => e
    puts e.message
  end

  def method_missing(method_name)
    puts "You can't #{method_name} a table."
  end

  def self.tables_created
    @@number_of_tables_created
  end

  class << self

    def tables_created_message
      "You've created #{@@number_of_tables_created} tables."
    end

  end

end


class CoffeeTable < Table

  def flip(person_weight, anger=nil)
    puts "THE COFFE IS HOT! IT BURNSSSSSS!"
    super
  end

end


class TableError < StandardError
end
