require "two_sum"

describe "two_sum" do
  it "indexes of sums into sub arrays" do
    tester = [-1, 0, 2, -2, 1] 
    expect(tester.two_sum).to eq([[0, 4], [2, 3]])
  end
end