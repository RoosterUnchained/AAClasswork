require "card"
describe "card" do 
  subject(:card) {Card.new("hearts", 8)}
  it "sets suit to the argument given" do 
    expect(card.suit).to eq("hearts")
  end
  it "sets value to the argument given" do 
    expect(card.value).to eq(8)
  end
end