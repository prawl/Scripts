require './human'
require './computer'
require './ui'
require './board'

class TicTacToe
  attr_reader :ui, :human, :computer, :board

  def initialize
    @ui = UI.new
    @human = Human.new 'X'
    @computer = Computer.new 'O'
    @board = Board.new
  end

  def play
    ui.exposition
    ui.display_board(board)

    player, opponent = human, computer

    while true
     #  ui.prompt_move(board)

     #  ui.turn(player.to_s)

      player.play_piece(board, ui)

      ui.display_board(board)

      ui.winner if board.winner?
     #  ui.tie if board.tie?

      player, opponent = opponent, player
    end
  end
end

TicTacToe.new.play
