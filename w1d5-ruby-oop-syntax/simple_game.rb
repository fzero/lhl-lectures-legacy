class Character

  # Class variables are prefixed with @@
  # and are shared to all instances of a class
  @@characters_created = 0

  attr_reader :name, :health, :attack_power, :weapon
  # attr_reader :name # is the same as:
  # def name
  #   @name
  # end

  # attr_writer :name # is the same as:
  # def name=(new_name)
  #   @name = new_name
  # end

  # attr_accessor does both at the same time

  def initialize(name, health=25, attack_power=5)
    @name = name
    @health = health
    @attack_power = attack_power
    @weapon = nil
    @@characters_created += 1
  end


  def attack(character)
    if @weapon
      character.take_hit(@weapon.attack_power)
    else
      character.take_hit(@attack_power)
    end
  end


  def take_hit(attack_power)
    @health -= attack_power
  end


  def equip_weapon(weapon)
    @weapon = weapon
  end


  def drop_weapon
    @weapon = nil
  end


  def look_around
    "#{@name} sees #{@@characters_created - 1} people around."
  end


  # Class variables don't have attr_readers,
  # so you need to define a `self.` attr_reader manually.
  def self.characters_created
    @@characters_created
  end


  # `method_missing` is a "magical" method called when an instance
  # method isn't found. It's like a 404 page for your class.
  def method_missing(method_name, *arguments)
    puts "#{@name} tried to #{method_name}!"
  end


  # `to_s` is another special method that's used to convert the instance
  # to a string. It's used automatically by `puts`, for example.
  def to_s
    result = "My name is #{@name}."
    result += " I'm packing a #{@weapon.name}." if @weapon
  end

end


class Weapon

  attr_reader :name, :attack_power

  def initialize(name, attack_power)
    @name = name
    @attack_power = attack_power
  end

  def to_s
    "Weapon: #{@name}, attack power: #{@attack_power}"
  end
end


# Board is a singleton class; it only has class methods and no `initialize`.
class Board

  # all-caps variables are treated as constants. You can access them
  # automatically from the class by using ::, like this:
  # Board::MAX_X
  MAX_X = 100
  MAX_Y = 100

  @@characters = []

  # Use `self.method_name` to create a class method.
  # These methods are called on the class itself (e.g. Board.add_to_board)
  # instead of an instance.
  def self.add_to_board(character, x, y)
    if x > MAX_X || y > MAX_Y
      character.take_hit(character.health) # dead!
      puts "You've tried to add #{character.name} outside of the board."
      puts "#{character.name} falls into limbo and dies!"
      return
    end

    @@characters << {
      character: character,
      x: x,
      y: y
    }
  end

  # All methods defined inside a `class << self` block
  # will be class methods (just like `def self.method_name`)
  class << self

    def display_characters
      if @@characters.empty?
        puts "Board is empty!"
        return
      end

      @@characters.each do |character|
        puts "#{character[:character].name} is at #{character[:x]}, #{character[:y]}"
      end
    end

    def characters
      @@characters
    end

  end

end

# Create characters
@arnie = Character.new("Ahnold")
@predator = Character.new("Predator", 10, 40)

# Create weapons
@pistol = Weapon.new("Luger", 10)
@shotgun = Weapon.new("Double barrelled shotgun", 20)

# Add them to board
Board.add_to_board(@arnie, 10, 10)
Board.add_to_board(@predator, 15, 25)

# Arnie equips pistol and shoots at predator
@arnie.equip_weapon(@shotgun)
@arnie.attack(@predator)

# Create Mario
@mario = Character.new("Mario")

# Try to add Mario to the board, but oops!
Board.add_to_board(@mario, 10, 200)
