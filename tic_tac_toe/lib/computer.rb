class Computer
  attr_reader :game_piece, :best_choice, :best_score

  def initialize(piece=nil)
    @game_piece = piece
    @opponent = swap_pieces(@game_piece)
  end

  def play_piece(board, ui)
     minmax(board, game_piece)
     board.play_position(@best_choice, game_piece)
  end

  def minmax(board, current_player)
    return score(board) if game_over?(board)

    scores = {}

    board.available_moves.each do |position|
     potential_board = board.dup

     potential_board.play_position(position, current_player)
     scores[position] = minmax(potential_board, swap_pieces(current_player))
    end

    @best_choice, best_score = best_move(current_player, scores)
    best_score
  end

  def swap_pieces(piece)
    piece == "X"? "O" : "X"
  end

  def best_move(piece, scores)
    if piece == game_piece
      scores.max_by { |_k, v| v }
    else
      scores.min_by { |_k, v| v }
    end
  end

  def game_over?(board)
     board.tie? || board.winning_piece
  end

  def score(board)
    if board.winning_piece == game_piece
      return 10
    elsif  board.winning_piece == @opponent
      return -10
    end
    0
  end
end
