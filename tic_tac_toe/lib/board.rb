class Board

  attr_accessor :game_slots

  BOARD_SIZE = 3
  
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

  def tie?
    @game_slots.all? { |pos| pos == 'X' || pos ==  'O' }
  end

  def vertical_wins
    winning_positions = []
    (1..grid_size).each do |i|
      temp = []
      target = i
      while target <= size
        temp << game_slots[target-1]
        target += grid_size
      end
    winning_positions << temp
    end
    winning_positions
  end

  def horizontal_wins
    vertical_wins.transpose
  end

  def diagonal_wins
    winning_positions = []
    temp = []
    target = 1
    while target <= size
     temp << game_slots[target-1]
     target += grid_size + 1
    end
    winning_positions << temp
    temp = []

    target = grid_size
    while target < size
     temp << game_slots[target-1]
     target +=  grid_size - 1
    end
    winning_positions << temp
    winning_positions
  end

  def winning_positions
   [vertical_wins, horizontal_wins, diagonal_wins]
  end

  def winner?
    winning_positions.flatten(1).map { |pos| pos.all? { |win| win == 'X' || win == 'O' } }.any?
  end

  def available?(user_input)
    @game_slots.include?(user_input)
  end
end
