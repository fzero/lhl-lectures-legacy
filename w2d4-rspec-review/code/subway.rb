class Subway
  class NoAddressError < StandardError
  end
  
  attr_reader :address, :revenue 

  def initialize(address)
    raise NoAddressError, "Subways must have a physical address" if address.empty?
    @address = address
    @revenue = 0
  end

  def sell_sandwich(bread, meat, toasted)
    sub = Sandwich.new(bread, meat, toasted)
    @revenue += sub.cost
    sub
  end
end