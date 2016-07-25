class Character

  # We're storing all characters we've created inside this class variable
  @@characters_created = []

  attr_reader :name, :health, :attack_power, :weapon

  def initialize(name, health=25, attack_power=5)
    @name = name
    @health = health
    @attack_power = attack_power
    @weapon = nil
    # `self` represents the current instance when used inside
    # an instance method.
    @@characters_created << self
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
    "#{@name} sees #{@@characters_created.size - 1} people around."
  end


  def to_s
    result = "My name is #{@name}."
    result += " I'm packing a #{@weapon.name}." if @weapon
    result
  end


  def heal(health_points)
    @health += health_points
  end


  def self.characters_created
    @@characters_created
  end

end


# Hero inherits from Character. This means ALL methods, accessors and instance
# variables will be available here.
class Hero < Character

  # This is an error class. All errors inherit from StandardError.
  # Usually you don't need to add any additional code here - StandardError
  # provides everything you need.
  #
  # Also note that, since we're defining this class INSIDE of Hero, it will
  # be automatically namespaced. When referring to it outide of Hero, you'll
  # have to use the Hero::HeroError notation. Inside Hero you can simply use
  # HeroError.
  class HeroError < StandardError
  end

  # Class variable with stupid hero phrases.
  @@heroic_things = [
    "Die you vile scum!",
    "I'll save you!!!!",
    "Not on my watch!!!",
    "Spoon!",
    "It's hard to say fork while you're running!",
    "LEEEEROYYYY JENKINNNNNSSSSSS"
  ]

  # Again, we already have the Character accessors, so we only need to
  # create the ones specific to heroes.
  attr_reader :magic_points

  def initialize(name, health=25, attack_power=5, magic_points=25)
    @magic_points = magic_points
    # Use super to reuse code from the parent class method.
    # Note the number of parameters is different (3 in Character vs. 4 in Hero).
    super(name, health, attack_power)
  end

  def say_heroic_things
    puts @@heroic_things.sample
  end

  # Here we're overriding the original Character#attack method so
  # heroes can't attack other heroes.
  def attack(character)
    if character.is_a?(Hero)
      puts "I'm so sorry bro!"
    else
      # When the number of parameters match, we DON'T need to repeat them
      # when calling super.
      super
    end
  end

  # We're using Exception handling here. If a hero doesn't have enough
  # magic_points, we raise a HeroError and rescue it at the end of the method.
  # Raising an error will stop the execution of the program unless
  # you rescue it.
  def cast_spell(spell)
    if @magic_points < spell.magic_points
      raise HeroError, "#{@name} doesn't have enough magic points"
    end
    @magic_points -= spell.magic_points
    spell.cast
  # In the block below we're rescuing ONLY HeroError and putting the
  # error instance inside the err variable. Since we're rescuing the error,
  # the program keeps running.
  rescue HeroError => err
    puts "Oops, that didn't work! Reason: #{err.message}"
  end

end


class Enemy < Character

  def monologue
    # This is called a HEREDOC. Use it to include long multi-line strings
    # in your code.
    monologue = <<-END.gsub(/^ {6}/, '')
      Crucifix mlkshk twee artisan cold-pressed. Green juice 8-bit quinoa
      freegan kinfolk knausgaard. Bitters next level aesthetic, kinfolk meggings
      sustainable narwhal brooklyn hashtag pickled quinoa everyday carry pug
      mumblecore cold-pressed. Slow-carb next level everyday carry, artisan tote
      bag health goth viral brunch selfies neutra meggings. Biodiesel normcore
      direct trade, neutra pickled pinterest tofu raw denim celiac
      intelligentsia gluten-free ennui aesthetic blog hoodie. Selvage keytar
      chicharrones portland. Twee brooklyn sartorial kitsch polaroid pitchfork
      single-origin coffee messenger bag.

      Twee williamsburg lo-fi, sustainable shabby chic tote bag wolf.
      Microdosing narwhal scenester leggings, pork belly lo-fi meggings tilde
      venmo keffiyeh health goth. Everyday carry hammock asymmetrical chia
      street art, slow-carb post-ironic paleo heirloom. Tilde hella pabst, fap
      celiac chicharrones art party. Sustainable irony chartreuse, narwhal
      pinterest tumblr meditation skateboard try-hard four loko godard. Keffiyeh
      offal direct trade, skateboard craft beer asymmetrical selfies gastropub
      crucifix hella beard master cleanse plaid vinyl gochujang. Plaid
      distillery cornhole PBR&B iPhone, umami blog shabby chic kale chips.

      Intelligentsia pabst meditation mumblecore, crucifix PBR&B pinterest cred
      hammock. Single-origin coffee kickstarter tacos YOLO, vinyl tattooed
      semiotics viral forage farm-to-table hella wolf heirloom. Gastropub 8-bit
      swag, pitchfork keytar synth polaroid flexitarian. Tofu lo-fi cred
      chillwave post-ironic. Franzen church-key crucifix, pop-up keytar master
      cleanse truffaut echo park bespoke shabby chic seitan readymade. Paleo
      roof party four dollar toast four loko, shabby chic semiotics irony put a
      bird on it thundercats cornhole PBR&B swag man bun seitan 90's. Next level
      biodiesel art party paleo, forage typewriter crucifix master cleanse
      hammock.

      Organic brooklyn brunch venmo sartorial, 90's bushwick scenester
      chartreuse flannel artisan. Slow-carb single-origin coffee fashion axe
      occupy, viral waistcoat synth offal banh mi forage franzen yuccie fixie
      blog bicycle rights. Typewriter selfies vinyl mlkshk austin meditation.
      Seitan readymade selfies farm-to-table, direct trade sriracha kickstarter
      typewriter four dollar toast helvetica. Retro cardigan microdosing,
      distillery pug yr cold-pressed hammock kitsch. Man bun marfa 3 wolf moon
      kickstarter farm-to-table, flannel asymmetrical microdosing bespoke
      dreamcatcher. Kale chips kinfolk try-hard wolf, tilde gochujang meditation
      kickstarter mumblecore stumptown lo-fi literally helvetica readymade.
    END
    puts monologue
  end

  # We're overriding Character#heal here to make enemies more powerful.
  def heal(health_points)
    @health += (health_points * 1.2).to_i
  end

  #
  def attack(character)
    if character.is_a?(Hero)
      puts "AAAAAARRRGHHHHH! LEEEROY JENKINS I GUESS!!!"

      # The if construct below works exactly like a ternary operator, but it's more legible:
      # attack_power = @weapon ? @weapon.attack_power : (@attack_power * 1.2).to_i
      attack_power = if @weapon
        @weapon.attack_power
      else
        (@attack_power * 1.2).to_i
      end

      character.take_hit(attack_power)
    else
      super(character)
    end
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


class Spell

  attr_reader :name, :magic_points

  def initialize(name, magic_points)
    @name = name
    @magic_points = magic_points
  end

  def cast
    puts "You casted #{@name} and used #{@magic_points} magic points!"
  end

end
