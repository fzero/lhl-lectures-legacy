class Sandwich
  attr_reader :bread, :meat, :toasted

  BREAD_PRICES = {:wheat => 2, :white => 1.5}
  MEAT_PRICES = {:turkey => 2.5, :ham => 2, :meatball => 2}

  def initialize(bread, meat, toasted)
    @bread = bread
    @meat = meat
    @toasted = toasted
  end

  def cost
    #Wheat bread = $2
    #White bread = $1.50
    #Turkey = $2.50
    #Ham = $2.00
    #Meatball = $2.00
    #Toasted = +$0.50

    bread_cost + meat_cost + toasted_cost
  end

  private
    def bread_cost
      BREAD_PRICES[bread.to_sym]
    end

    def meat_cost
      MEAT_PRICES[meat.to_sym]
    end

    def toasted_cost
      @toasted ? 0.5 : 0
    end
end