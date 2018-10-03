require '00_array.rb'

describe "#my_uniq" do
  subject(:arr) {[0,1,2,3,3,4,4]}
  it "removes duplicate values" do

    expect(arr.my_uniq).to eq([0,1,2,3,4])

  end

  it "returns the original array without modifying it" do
    arr.my_uniq
    expect(arr).to eq ([0,1,2,3,3,4,4])

  end
end


describe "two_sum" do
  subject(:arr) {[-1,0,2,-2,1]}

  it "does not modify the original" do
    arr.two_sum
    expect(arr).to eq([-1,0,2,-2,1])
  end

  it "returns an array of index pairs" do
    expect(arr.two_sum).to eq [[0,4],[2,3]]
  end

  it "does not return spurious pairs" do
    expect(arr.two_sum).to_not include([1,1])
  end

  describe "my_transpose" do
    subject(:arr) { [[0, 1, 2],[3, 4, 5],[6, 7, 8]] }
      it "does not modify the original" do
        arr.my_transpose
        expect(arr).to eq([[0, 1, 2],[3, 4, 5],[6, 7, 8]])
      end

      it "returns the transposition" do
        expect(arr.my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
      end

  end

  describe "stock_picker" do
    subject(:stocks) {[100,150,125,126,200,95]}

    it "returns the correct pair of days to buy and sell" do
      expect(stock_picker(stocks)).to eq([0,4])
    end

    it "does not modify the original array" do
      stock_picker(stocks)
      expect(stocks).to eq([100,150,125,126,200,95])
    end

    it "doesn't buy a stock from the future and sell it in the past" do
      expect(stock_picker(stocks).first).to be < (stock_picker(stocks).last)
    end

  end

end
