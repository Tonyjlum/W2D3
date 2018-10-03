require "byebug"
class Towers_of_Hanoi

  attr_accessor :tower1 , :tower2, :tower3

  def initialize

    @tower1 = [3,2,1] #where 1 is the smallest ring
    @tower2 = []
    @tower3 = []

  end

  def move(start_tower, end_tower)
    return unless valid_move?(start_tower,end_tower)
    end_tower << start_tower.pop
  end

  def valid_move? (start_tower, end_tower)
    return false if start_tower.empty?
    return true if end_tower.empty?
    return false if start_tower.last > end_tower.last
    true
  end

  def over?
    return tower3.length == 3 || tower2.length == 3
  end

  def play

    until over?
      take_turn
    end
    puts "You done did it. You have won the game"
  end


  def take_turn
    # puts "Enter the tower you are taking a disk from"
    start_tower = string_to_tower(gets.chomp)
    # puts "Enter the tower you are putting the tower"
    end_tower = string_to_tower(gets.chomp)

    move(start_tower,end_tower)
  end

  def string_to_tower(str)
    if str == "1"
      return self.tower1
    elsif str == "2"
      return self.tower2
    elsif str == "3"
      return self.tower3
    end
  end


end
