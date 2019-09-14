require "stock_picker"
describe "stock_picker" do 
  it "returns the pair of most profitable buy and sell days" do 
    prices = [100, 14, 20, 84, 2, 12, 39, 5]
    expect(stock_picker(prices)).to eq([1, 3])
  end
end