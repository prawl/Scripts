class Board

  attr_reader :game_slots

  BOARD_SIZE = 3
  
  def initialize(size = nil)
    @game_slots = Array.new((size || BOARD_SIZE)**2)
  end

  def available?(input)
    return false if input.is_a? String  
    game_slots[input].nil?
  end

  def available_moves
    available = []
    (0...9).each do |i|
      available << i if available?(i)
    end
    available
  end

  def size 
    game_slots.size
  end

  def grid_size
    Math.sqrt(game_slots.size).to_i
  end

  def play_position(position, game_piece)
     game_slots[position] = game_piece
  end

  def tie?
    game_slots.all? { |pos| pos == 'X' || pos ==  'O' }
  end

  def vertical_wins
    winning_positions = []
    (0...grid_size).each do |i|
      temp = []
      target = i
      while target < size
        temp << target
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
    target = 0 
    while target <= size
     temp << target
     target += grid_size + 1
    end
    winning_positions << temp
    temp = []

    target = grid_size - 1
    while target < size - 1
     temp << target
     target +=  grid_size - 1
    end
    winning_positions << temp
    winning_positions
  end

  def winning_positions
   [vertical_wins, horizontal_wins, diagonal_wins]
  end

  def winning_piece
    (winner?)? winning_combo[0] : false
  end

  def winner?
    winning_combo ? true : false
  end

  private

  def winning_combo
    winning_positions.flatten(1).each do |win|
      return win if game_slots[0] == game_slots[1] && game_slots[1] == game_slots[2] && game_slots[0] != nil
    end
    false
  end
end
