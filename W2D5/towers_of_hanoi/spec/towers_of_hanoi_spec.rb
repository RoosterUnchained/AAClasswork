require "board"

describe "#Move" do
  it "moves a ring to a legal position" do 
    rods = [[1,2,3],[],[]]
    expect(rods.move())
  end
end