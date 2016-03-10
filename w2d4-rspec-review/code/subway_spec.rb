require './subway.rb'

describe Subway do
  before do
    @shop = Subway.new("125 W Hastings St")
  end

  describe '.new' do
    it 'should return an instance of a Subway' do
      expect(@shop).to be_a Subway
    end

    it 'should throw an error if an empty string is passed' do
      expect {Subway.new("")}.to raise_error Subway::NoAddressError
    end
  end

  describe '#address' do
    it "should return the shop's address" do
      expect(@shop.address).to eql("125 W Hastings St")
    end
  end

  describe '#sell_sandwich' do
    it 'should return a new instance of a Sandwich object' do
      expect(@shop.sell_sandwich("wheat", "turkey", true)).to be_a Sandwich
    end
  end

  describe '#revenue' do
    it 'should be 0 when a store is created' do
      expect(@shop.revenue).to eql(0)
    end

    it 'should increase when a new sandwich is purchased' do
      @shop.sell_sandwich("wheat", "turkey", true)
      expect(@shop.revenue).to eql(5.0)
    end
  end
end
