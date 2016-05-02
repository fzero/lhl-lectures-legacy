class Character

  @@characters_created = 0

  attr_reader :name, :health, :weapons, :strength

  def initialize(name, health=20, strength=15)
    @name = name
    @health = health
    @weapons = []
    @strength = strength
    @attack_power = 10
    @@characters_created += 1
  end

  def attack_power
    return @attack_power if @weapons.empty?
    total_attack_power = @attack_power
    @weapons.each do |weapon|
      total_attack_power += weapon.attack_power
    end
    total_attack_power
  end

  def equip(weapon)
    return if @weapons.size >= 2
    @weapons << weapon
  end

  def attack(character)
    character.wound(attack_power)
  end

  def wound(health_points)
    @health -= health_points
  end

  def lose_weapon
    @weapons.pop
  end

  class << self

    def characters_created
      @@characters_created
    end

  end

  protected

  def secret_method
    "heyo"
  end

end


class Hero < Character

  @@heroes_created = 0

  attr_reader :alignment

  def initialize(name)
    super(name)
    @alignment = 'Good'
    @@heroes_created += 1
  end

  def self.heroes_created
    @@heroes_created
  end

end


class Villain < Character

  @@villains_created = 0

  attr_reader :alignment

  def initialize(name)
    super(name)
    @alignment = 'Evil'
    @@villains_created += 1
  end

  def steal(character)
    @weapons << character.lose_weapon if character.weapons.size > 0
  end

  class << self
    def villains_created
      @@villains_created
    end

    def characters_created
      @@villains_created
    end
  end

end


class Weapon

  attr_reader :name, :attack_power

  def initialize(name, attack_power)
    @name = name
    @attack_power = attack_power
  end

end





# ----

@poe_dameron = Hero.new('Poe Dameron')
@han_solo = Hero.new('Han Solo')
@kylo_ren = Villain.new('Kylo Ren')
@angry_stormtrooper = Villain.new('White dude 17')

@pistol = Weapon.new('Pistol', 10)
@lightsaber = Weapon.new('Light saber', 15)

