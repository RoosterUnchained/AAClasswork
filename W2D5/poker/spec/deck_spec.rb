require "deck"
describe "deck" do
  subject (:deck) {Deck.new}

  it "makes a deck of unique cards" do
    expect(deck.all_cards).to eq(deck.all_cards.uniq)
  end
  it "makes a full deck of 52 cards" do 
    expect(deck.all_cards.count).to eq(52)
  end
end