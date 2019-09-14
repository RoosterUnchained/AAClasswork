require "my_transpose"
describe "my_transpose" do
  it "transposes rows and collumns" do
    rows = [[0, 1, 2],[3, 4, 5],[6, 7, 8]]
    expect(my_transpose(rows)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end