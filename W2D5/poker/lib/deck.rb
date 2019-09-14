require_relative "card"
class Deck

  attr_accessor :all_cards

  SUITS = ["hearts", "spades", "clubs", "diamonds"]
  VALUES = ['kings', 'queens', 'jacks', 'ace', '2', '3', '4', '5', '6', '7', '8', '9', '10']

  def initialize(cards = Deck.populate)
    @all_cards = cards
  end

  def self.populate
    cards = [] 
    SUITS.each do |suit|
      VALUES.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards.shuffle
  end

end