class Computer
  attr_accessor :game_piece

  #Requirements
  #computer movement
  #mixmax
  #minmax - score
  #switch players
  # Add a super class to this? 
  #
  def initialize(piece=nil)
    @game_piece = piece
  end

  def move(board)
  end

  def swap_pieces(piece)
    piece == "X"? "O" : "X"
  end

  def game_over?(board)
     board.winner? || board.tie?
  end

  def score(board)
    if board.winner? == piece
      return 10
    elsif  board.winner == opponent
      return -10
    end
    0
  end
end
