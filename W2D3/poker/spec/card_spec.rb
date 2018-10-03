require "card"

describe "#card" do
  describe "initialize" do
    subject(:card) {Card.new("4", "Heart")}

    it "should make a card" do
      expect(card).to be_a(Card)
    end

    it "should have proper value" do
      expect(card.value).to eq("4")
    end

    it "should have proper suit" do
      expect(card.suit).to eq("Heart")
    end

  end
end
