class Board
  BOARD_SIZE = 3

  attr_accessor :game_slots

  #Requirements:
  #1) Must scale with size
  #2) Must hold game pieces
  
  def print
    (0..size).each do |i|
    end
  end

  def initialize(size=nil)
    @game_slots = Array.new((size || BOARD_SIZE)**2)
  end

  def size 
    @game_slots.size
  end

end
