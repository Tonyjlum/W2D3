require 'towers_of_hanoi'


describe "Towers of Hanoi Game" do
  subject(:game) {Towers_of_Hanoi.new}
  describe "initialize" do

    it "puts all pieces in the first array upon initialization" do
      expect(game.tower1.length).to eq(3)
    end

    it "does not put any rings in the other two arrays" do
      expect(game.tower2).to eq([])
      expect(game.tower3).to eq([])
    end

    it "puts the rings in the array with the biggest on the bottom and smallest on top" do
      expect(game.tower1).to eq([3,2,1])
    end
  end


  describe "valid_move?" do
    before do
      game.tower1 = [3,2]; game.tower2 = []; game.tower3 = [1]
    end
    it "should not place larger piece over smaller piece" do
      expect(game.valid_move?(game.tower1, game.tower3)).to eq(false)
      expect(game.valid_move?(game.tower3, game.tower1)).to eq(true)
    end

    it "does not try to take from an empty tower" do
      expect(game.valid_move?(game.tower2, game.tower1)).to eq(false)
    end

  end

  describe "move" do
    before do
      game.tower1 = [3,2,1]; game.tower2 = []; game.tower3 = []
    end
    it "calls valid_move " do
      expect(game).to receive(:valid_move?)
      game.move(game.tower1, game.tower2)
    end

    it "moves the last piece from the start tower to end tower" do
      # before do
        game.tower1 = [3,2,1]; game.tower2 = []; game.tower3 = []
      # end
      game.move(game.tower1, game.tower2)
      expect(game.tower2).to eq([1])
    end

  end

  describe "over?" do
    it "returns true when tower3 has 3 rings" do
      game.tower1 = []; game.tower2 = []; game.tower3 = [3,2,1]
        expect(game.over?).to eq(true)
    end

    it "returns true when tower2 has 3 rings" do
      game.tower1 = []; game.tower2 = [3,2,1]; game.tower3 = []
        expect(game.over?).to eq(true)
    end

    it "returns false if tower1 has 3 rings" do
      game.tower1 = [3,2,1]; game.tower2 = []; game.tower3 = []
      expect(game.over?).to eq(false)
    end

    it "returns false if towers2 or tower 3 does not have 3 rings" do
      game.tower1 = [3]; game.tower2 = [2]; game.tower3 = [1]
      expect(game.over?).to eq(false)
    end
  end

  describe "take_turn" do
    it "game receive make_move" do
      expect(game).to receive(:move)
      game.take_turn
    end

  end

  describe "play" do

    # it "calls take turn" do
    #   expect(game).to receive(:take_turn)
    #   # game.play
    # end

    it "checks to see if the game is over" do
      game.tower1 = []; game.tower2 = []; game.tower3 = [3,2,1]
      expect(game).to receive(:over?).and_call_original
      game.play
    end
  end
end
