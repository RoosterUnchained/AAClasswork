require "player"

describe "player" do
  let(:deck) {Deck.new}
  subject(:player) {Player.new(100, deck)}

  it "takes a hand of 5 from the deck" do
    expect(player.hand.cards.length).to eq(5)
  end

  
end