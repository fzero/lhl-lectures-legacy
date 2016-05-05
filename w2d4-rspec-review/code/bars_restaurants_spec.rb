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

end
