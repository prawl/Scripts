class Human
  attr_accessor :game_piece

  def initialize(piece=nil)
    @game_piece = piece
  end

  def play_piece(board, ui)
    valid = false

    until valid
      input = get_input
      exit if quit?(input)
      valid = valid_move?(ui, input, board)
    end
    board.play_position(input, @game_piece)
  end

  def get_input
    gets.upcase.chomp
  end

  def quit?(user_input)
    user_input.upcase == "Q"
  end

  def valid_move?(ui, user_input, board)
    ap board
    valid_move = board.available?(user_input)
    ui.invalid_input unless valid_move
    valid_move
  end
end
