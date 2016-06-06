require './bars_restaurants.rb'

describe Bartender do
  before :each do
    @bartender = Bartender.new('John', 6)
  end

  describe '.new' do

    it 'should have a name' do
      expect(@bartender.name).to eql('John')
    end

    it 'should have a skill_level' do
      expect(@bartender.skill_level).to eql(6)
    end

    it 'should have skillz' do
      expect(@bartender.skillz).to eql('Good')
    end
  end

  describe 'skillz' do
    before do
      @horrible = Bartender.new('John', 1)
      @meh = Bartender.new('John', 3)
      @good = Bartender.new('John', 6)
      @awesome = Bartender.new('John', 9)
    end

    it 'skillz should match skill_level' do
      expect(@horrible.skillz).to eql('Horrible')
      expect(@meh.skillz).to eql('Meh')
      expect(@good.skillz).to eql('Good')
      expect(@awesome.skillz).to eql('Awesome!')
    end
  end

  describe 'skillz with stubbing' do
    before do
      @bartender = Bartender.new('John', 1)
    end

    it 'skillz should match skill_level' do
      # @bartender.instance_variable_set(:@skill_level, 6)
      expect(@bartender).to receive(:skill_level).and_return(6)
      expect(@bartender.skillz).to eql('Good')
    end
  end

  describe 'practice' do
    it 'increases skill_level with practice' do
      @bartender = Bartender.new('John', 1)
      expect(@bartender.skill_level).to eql(1)
      @bartender.practice
      expect(@bartender.skill_level).to eql(2)
    end

    it 'cannot increase skill level past 10' do
      @bartender = Bartender.new('Ace', 9)
      @bartender.practice
      expect(@bartender.skill_level).to eql(10)
      @bartender.practice
      expect(@bartender.skill_level).to eql(10)
    end
  end
end


# Mark tests you haven't written yet with `pending`

describe 'Restaurant' do
  before :each do
    @restaurant = Restaurant.new("McDonald's", "fast-food", '$', true, ['hamburgers', 'fries', 'trans-fats', 'heart attack'])
  end

  describe '.new' do

    it 'should have accessors that work' do
      expect(@restaurant.name).to eql("McDonald's")
      expect(@restaurant.style).to eql("fast-food")
      expect(@restaurant.price_range).to eql("$")
    end

    it '#kid_friendly?' do
      expect(@restaurant.kid_friendly?).to eql(true)
    end

    it 'should have formatted_tags' do
      expect(@restaurant.formatted_tags).to eql("hamburgers, fries, trans-fats, heart attack")
    end

  end

  describe 'reviews' do

    before do
      @restaurant = Restaurant.new("McDonald's", "fast-food", '$', true, ['hamburgers', 'fries', 'trans-fats', 'heart attack'])
    end

    it 'can add a review' do
      @review1 = Review.new(7, 'Pretty good.')
      @review2 = Review.new(5, 'Meh.')
      @restaurant.add_review(@review1)
      @restaurant.add_review(@review2)
      expect(@restaurant.reviews).to eq([@review1, @review2])
    end

    it 'should raise an exception if review is the wrong class' do
      expect {@restaurant.add_review("Not a review!")}.to raise_error(Restaurant::RestaurantError)
    end

  end

  describe '#average_rating' do

    before do
      @restaurant = Restaurant.new("Good'os", "good")
    end

    it 'returns nil if there are no ratings' do
      expect(@restaurant.average_rating).to eql(nil)
    end

    it 'returns the average rating if there are ratings' do
      @review1 = Review.new(0, 'Argh')
      @review2 = Review.new(10, 'Amazing!!!11!!eleven!')
      @restaurant.add_review(@review1)
      @restaurant.add_review(@review2)
      expect(@restaurant.average_rating).to eql(5.0)
    end

  end


end


describe 'Review' do

  before :each do
    @review = Review.new(6, "They tried, but mostly failed.")
  end

  describe '.new' do

    it 'should have accessors that work' do
      expect(@review.rating).to eq(6)
      expect(@review.comment).to eq("They tried, but mostly failed.")
    end
  end

end


describe 'Bar' do
  pending "TODO: Write some tests!"
end


describe 'SportsBar' do
  pending "TODO: Write some tests!"
end
