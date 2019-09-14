require_relative "deck"

class Hand

  attr_accessor :cards
  
  def initialize(deck)
    @cards = deck.all_cards.shift(5) 
  end

end