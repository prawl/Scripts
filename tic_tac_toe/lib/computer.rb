class Computer
  attr_accessor :game_piece

  #Requirements
  #computer movement
  #mixmax
  #minmax - score
  #switch players
  #game over
  # Add a super class to this? 
  def initialize(piece=nil)
    @game_piece = piece
  end

  def swap_pieces(piece)
    piece == "X"? "O" : "X" 
  end

  def game_over?(board)
  end
end
