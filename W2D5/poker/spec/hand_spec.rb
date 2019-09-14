require "hand"

describe "hand" do 
  let(:deck) {Deck.new}
  subject(:hand) {Hand.new(deck)}

  it "forms a hand of 5 from the deck" do 
    expect(hand.cards.length).to eq(5)
  end

  it "lowers deck size by 5 when a hand is dealt" do
    Hand.new(deck)
    expect(deck.all_cards.length).to eq(47)
  end

end