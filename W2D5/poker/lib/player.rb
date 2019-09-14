require_relative "hand"

class Player
  attr_reader :hand
  def initialize(cash_money, deck)
    @hand = Hand.new(deck)
    @cash_money = cash_money
  end

end