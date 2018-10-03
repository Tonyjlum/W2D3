require "deck"

describe "#deck" do
  describe "initialize" do
    subject(:deck) {Deck.new}

    it "makes a deck of 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "contains 13 of each suit" do
      expect(deck.cards.select {|c| c.suit == "Heart"}.length).to eq(13)

    end

    it " contains 4 of each number" do
      expect(deck.cards.select {|c| c.value == "4"}.length).to eq(4)
    end

    it "does not repeat cards" do
      expect(deck.cards.uniq.length).to eq(52)
    end


  end
end
