class Board
  BOARD_SIZE = 3

  attr_accessor :game_slots

  def initialize(size = nil)
    @game_slots = Array.new((size || BOARD_SIZE)**2)
    populate_slots
  end

  def populate_slots
    (1..size).map { |i| @game_slots[i-1] = i.to_s }
  end

  def size 
    @game_slots.size
  end

  def grid_size
    Math.sqrt(@game_slots.size).to_i
  end

  def play_position(board_position, game_piece)
     @game_slots[board_position.to_i-1] = game_piece
     @game_slots
  end

  def board_full?
    @game_slots.all? { |pos| pos == 'X' || pos ==  'O' }
  end

  def available?(user_input)
    @game_slots.include?(user_input)
  end
end
