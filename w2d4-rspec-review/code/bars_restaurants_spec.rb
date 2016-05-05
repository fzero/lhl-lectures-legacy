require './bars_restaurants.rb'

describe Bartender do
  before do
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
  pending "TODO: Write some tests!"
end


describe 'Bar' do
  pending "TODO: Write some tests!"
end


describe 'SportsBar' do
  pending "TODO: Write some tests!"
end
