require './human'
require './computer'
require './ui'
require './board'

class TicTacToe
  attr_accessor :ui, :player, :computer, :board

  def initialize
    @ui = UI.new
    @player = Human.new 'X'
    @computer = Computer.new 'O'
    @board = Board.new
  end

  def play
    ui.exposition
    ui.display_board(board)

    player_one = player
    player_two = computer 

    while true
      ui.prompt_move(board)
      player.play_piece(board, ui, player.game_piece)
      ui.display_board(board)
     #  player.game_piece = computer.swap_pieces(player.game_piece)

      ui.tie if board.tie?
      ui.winner if board.winner?
    end

  end
end

TicTacToe.new.play
