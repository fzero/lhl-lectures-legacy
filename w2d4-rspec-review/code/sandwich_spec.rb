require './sandwich.rb'

describe Sandwich do
  before do
    @sandwich = Sandwich.new("wheat", "turkey", true)
  end

  describe '.new' do
    it 'should return a new instance of a Sandwich' do
      expect(@sandwich).to be_a Sandwich
    end

    it 'should have wheat bread' do
      expect(@sandwich.bread).to eql("wheat")
    end

    it 'should have turkey meat' do
      expect(@sandwich.meat).to eql("turkey")
    end

    it 'should report itself as toasted' do
      expect(@sandwich.toasted).to be true
    end
  end

  describe '#cost' do
    it 'should cost $5 for wheat, turkey, and toasted' do
      expect(@sandwich.cost).to eql(5.0)
    end

    it 'should cost $4.50 for white, turkey, and toasted' do
      expect(@sandwich).to receive(:bread).and_return("white")
      expect(@sandwich.cost).to eql(4.5)
    end
  end
end
