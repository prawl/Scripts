class TicTacToe
  def self.initalize_board
    ['1', '2', '3', '4', '5', '6', '7', '8', '9']
  end

  def self.draw_board(game_board)
  puts "
  #{game_board[0]} | #{game_board[1]} | #{game_board[2]}
  ----------
  #{game_board[3]} | #{game_board[4]} | #{game_board[5]}
  ----------
  #{game_board[6]} | #{game_board[7]} | #{game_board[8]}
  "
  end

  def self.extract_horizontal(game_board)
    [game_board.values_at(0,1,2), game_board.values_at(3,4,5), game_board.values_at(6,7,8)]
  end

  def self.extract_veritical(game_board)
    [game_board.values_at(0,3,6), game_board.values_at(1,4,7), game_board.values_at(2,5,8)]
  end

  def self.extract_diagonal(game_board)
    [game_board.values_at(0,4,8), game_board.values_at(2,4,6)]
  end

  def self.winning_condition(values)
    values.count("O") == 3
  end

  def self.play_spot(game_board, user_input, value)
    game_board[user_input.to_i - 1] = value
    game_board
  end

  def self.game_complete?(game_board)
    extract_horizontal(game_board).each do |row|
      return true if winning_condition(row)
    end

    extract_veritical(game_board).each do |column|
      return true if winning_condition(column)
    end

    extract_diagonal(game_board).each do |diag|
      return true if winning_condition(diag)
    end
    board_full?(game_board)
  end

  def self.board_full?(game_board)
     game_board.all? { |i| i == 'X' || i == 'O' }
  end

  def self.check_win(values)
    if values.count("O") == 2 && values.count("X") != 1
      values.delete("O")
      return values.first.to_s
    end
  end

  def self.check_block(values)
    if values.count("X") == 2 && values.count("O") != 1
      values.delete("X")
      return values.first.to_s
    end
    nil
  end

  def self.all_possible_moves(game_board, method)
    extract_horizontal(game_board).each do |row|
      computer_input = send(method, row)
      return computer_input if computer_input
    end

    extract_veritical(game_board).each do |column|
      computer_input = send(method, column)
      return computer_input if computer_input
    end

    extract_diagonal(game_board).each do |diag|
      computer_input = send(method, diag)
      return computer_input if computer_input
    end
    nil
  end

  def self.determine_computers_move(game_board)
    computer_input = all_possible_moves(game_board, :check_win)
    return computer_input if computer_input

    computer_input = all_possible_moves(game_board, :check_block)
    return computer_input if computer_input

    computer_input = '5' if game_board[4] == "5"
    return computer_input if computer_input

    computer_input = special_case(game_board)
    return computer_input if computer_input

    available_spots(game_board)
  end

  def self.special_case(game_board)
    # Player controls two corners, need a side
    return available_spots([game_board[1], game_board[3], game_board[5], game_board[7]]) if (((game_board[0] && game_board[8]) == 'X' || (game_board[2] && game_board[6])  == 'X') && (game_board[3] == '4'))
    # Player controls the middle, need a corner
    return available_spots([game_board[0], game_board[2], game_board[6], game_board[8]]) if game_board[4] == 'X'
  end

  def self.available_spots(game_board)
    board = game_board.dup
    board.delete("X")
    board.delete("O")
    board.compact.sample.to_s
  end

  def self.valid_move?(game_board, user_input)
    game_board.include?(user_input)
  end

  def self.prompt_text(text)
    puts text
    user_input = gets.chomp.upcase
  end

  def self.play_game
    user_input = prompt_text "Welcome to unbeatable Tic Tac Toe, prepare to cry.  Not like it matters but do you want to go first? [Y/N]"
    player_first = (user_input == 'Y')
    game_board = initalize_board
    until game_complete?(game_board)
      if player_first
        draw_board(game_board)
        until valid_move?(game_board, user_input)
          user_input = prompt_text "Enter a number between 1 and 9 to make your move"
        end
        game_board = play_spot(game_board, user_input.to_s.strip, "X")
        computer_input = determine_computers_move(game_board)
        game_board = play_spot(game_board, computer_input.to_s, "O")
      else # computer goes first
        computer_input = determine_computers_move(game_board)
        game_board = play_spot(game_board, computer_input, "O")
        draw_board(game_board)
        break if game_complete?(game_board) # Check if computer has won before allowing player to move
        until valid_move?(game_board, user_input)
          user_input = prompt_text "Enter a number between 1 and 9 to make your move"
        end
        game_board = play_spot(game_board, user_input.to_s.strip, "X")
      end
    end
    draw_board(game_board) if player_first
    user_input = prompt_text "Of course you didn't win, want to try again? [Y/N]"
    play_game if user_input == "Y"
  end
end
# TicTacToe.play_game
