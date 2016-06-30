module Taggable

  def formatted_tags
    return 'No tags' if @tags.nil? || @tags.empty?
    @tags.join(', ')
    # Another way to write it:
    # if @tags.nil? || @tags.empty?
    #   'No tags'
    # else
    #   @tags.join(', ')
    # end
  end

end


class Bartender
  include Taggable

  attr_reader :name, :skill_level
  attr_accessor :tags

  def initialize(name, skill_level=5, tags=[])
    @name = name
    @skill_level = skill_level
    @tags = tags
  end

  def practice
    @skill_level += 1 if @skill_level < 10
  end

  def skillz
    case @skill_level
    when (0..2)
      'Horrible'
    when (3..5)
      'Meh'
    when (6..7)
      'Good'
    when (8..10)
      'Awesome!'
    end
  end
end


class Restaurant
  include Taggable

  class RestaurantError < StandardError
  end

  attr_reader :reviews
  attr_accessor :name, :style, :price_range, :tags
  attr_writer :kid_friendly

  def initialize(name, style, price_range='$$',
                 kid_friendly=false, tags=[])
    @name = name
    @style = style
    @price_range = price_range
    @kid_friendly = kid_friendly
    @tags = tags
    @reviews = []
  end

  def kid_friendly?
    @kid_friendly
  end

  def add_review(review)
    if !review.is_a?(Review)
      raise RestaurantError, "Review should be an instance of Review"
    end
    @reviews << review
  end

  def average_rating
    return nil if @reviews.empty?
    scores = @reviews.map {|review| review.rating}
    (scores.inject(:+) / scores.size).to_f
  end

end


class Bar
  class BartenderError < StandardError
  end

  include Taggable

  attr_accessor :name, :style, :price_range, :age_range, :music_style, :tags
  attr_reader :employees

  def initialize(name, style,  price_range='$$',
                 age_range=nil, music_style=nil, tags=[])
    @name = name
    @style = style
    @price_range = price_range
    @age_range = age_range
    @music_style = music_style
    @tags = tags
    @employees = []
  end

  def hire(bartender)
    if !bartender.is_a?(Bartender)
      raise BartenderError, "This scammer doesn't know how to mix a drink!"
    end
    @employees << bartender
  end

  def fire(bartender)
    @employees.delete(bartender)
  end

  def team_skillz
    total_skillz = 0
    @employees.each {|e| total_skillz += e.skill_level}
    total_skillz / @employees.size
  end

  def staff
    formatted_staff = employees.map {|e| e.name}.join(', ')
    "Our staff is: #{formatted_staff}."
  end
end


# class SportsBar < Bar
#   attr_reader :sportness

#   def initialize(name, style="sports", sportness=5)
#     super(name, style)
#     @sportness = sportness
#   end

#   def staff
#     "OUR STAFF IS AWESOME AND CRUSHING IT! #{super}"
#   end
# end

class Review

  attr_reader :rating, :comment

  def initialize(rating, comment)
    @rating = rating
    @comment = comment
  end

end


# @le_prete = Restaurant.new('Le Pretentious', 'French', '$$$$', false, ['expensive', 'pretentious', 'snooty', 'delicious'])
# @hooters = Restaurant.new('Hooters', 'Horrible', '$$', false, ['sexist', 'wings', 'bewbs', 'dontgothere'])
# @tone = Restaurant.new('To-ne', 'Sushi', '$$', true, ['delicious', 'sushi', 'fresh'])

# @handlebar = Bar.new('Handlebar', 'Hipster', '$', (19..35), 'electronic', ['awesome', 'craftbeers'])
# @track_and_field = SportsBar.new('Track & Field', 'Sports bar', '$$', (25..40), 'top40', ['sports', 'basketball', 'gojaysgo'])

# @jane = Bartender.new('Jane', 7)
# @bob = Bartender.new('Bob', 10)
# @scott = Bartender.new('Scott', 5)

# @handlebar.hire(@jane)
# @handlebar.hire(@scott)

# @track_and_field.hire(@bob)
