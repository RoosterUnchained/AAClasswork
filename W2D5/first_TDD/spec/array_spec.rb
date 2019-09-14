
require "array"
describe "my_unique" do 
  it "removes duplicate elements" do 
    list = [1, 2, 1, 3, 3]
    expect(my_unique(list)).to eq([1, 2, 3])
  end
end 