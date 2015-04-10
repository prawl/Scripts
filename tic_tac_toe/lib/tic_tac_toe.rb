require "tic_tac_toe/version"

module TicTacToe
  def self.draw_board(game_board)
  puts "
  #{game_board[0]} | #{game_board[1]}  | #{game_board[2]} 
  ----------
  #{game_board[3]} | #{game_board[4]}  | #{game_board[5]} 
  ----------
  #{game_board[6]} | #{game_board[7]}  | #{game_board[8]} 
  "
  end

  def self.initalize_board
    ['1', '2', '3', '4', '5', '6', '7', '8', '9']
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
    true if values.count("O") == 3
  end

  def self.play_spot(game_board, user_input, value)
    unless user_input.size != 1
      if user_input == '1'
        game_board[0] = value
      end
      if user_input == '2'
        game_board[1] = value
      end
      if user_input == '3'
        game_board[2] = value
      end
      if user_input == '4'
        game_board[3] = value
      end
      if user_input == '5'
        game_board[4] = value
      end
      if user_input == '6'
        game_board[5] = value
      end
      if user_input == '7'
        game_board[6] = value
      end
      if user_input == '8'
        game_board[7] = value
      end
      if user_input == '9'
        game_board[8] = value
      end
    else
      puts "Uh oh!  You need to enter a valid number between 1 and 9.  Try again"
    end
    game_board
  end

  def self.try_to_win(game_board)
    extract_horizontal(game_board).each do |row|
      computer_input = win_game(row)
      return computer_input if computer_input
    end

    extract_veritical(game_board).each do |column|
      computer_input = win_game(column)
      return computer_input if computer_input
    end

    extract_diagonal(game_board).each do |diag|
      computer_input = win_game(diag)
      return computer_input if computer_input
    end
    nil
  end

  def self.win_game(values)
    if values.count("O") == 2 && values.count("X") != 1
      values.delete("O")
      values.first.to_s
    end
  end

  def self.block_player(values)
    if values.count("X") == 2 && values.count("O") != 1
      values.delete("X")
      values.first.to_s
    end
  end

  def self.determine_computers_move(game_board)
    computer_input = try_to_win(game_board)
    return computer_input if computer_input

    extract_horizontal(game_board).each do |row|
      computer_input = block_player(row)
      return computer_input if computer_input
    end

    extract_veritical(game_board).each do |column|
      computer_input = block_player(column)
      return computer_input if computer_input
    end

    extract_diagonal(game_board).each do |diag|
      computer_input = block_player(diag)
      return computer_input if computer_input
    end

    computer_input = '5' if game_board[4] == "5"
    return computer_input if computer_input

    valid_moves = game_board.map { |i| i if i == "1" || i == "3" || i == "7" || i == "9" }
    computer_input = valid_moves.compact.sample.to_s
    return computer_input
  end

  def self.prompt_text(text)
    puts text
    user_input = gets.chomp.upcase
  end

  def self.game_complete(game_board)
    extract_horizontal(game_board).each do |row|
      return true if winning_condition(row)
    end

    extract_veritical(game_board).each do |column|
      return true if winning_condition(column)
    end

    extract_diagonal(game_board).each do |diag|
      return true if winning_condition(diag)
    end

    spots = 0
    game_board.map { |i| spots += 1 if i == 'X' || i == 'O' }
    return true if spots == 9
    false
  end

  def self.play_game
    user_input = prompt_text "Welcome to unbeatable Tic Tac Toe, prepare to cry.  Not like it matters but do you want to go first? [Y/N]"
    user_input == "Y"? player_first = true : player_first = false
    game_board = initalize_board
    while !game_complete(game_board)
      if player_first
        draw_board(game_board)
        user_input = prompt_text "Enter a number between 1 and 9 to make your move"
        game_board = play_spot(game_board, user_input.to_s.strip, "X")
        computer_input = determine_computers_move(game_board)
        game_board = play_spot(game_board, computer_input, "O")
      else # computer goes first
        computer_input = determine_computers_move(game_board)
        game_board = play_spot(game_board, computer_input, "O")
        draw_board(game_board)
        break if game_complete(game_board) # Check if computer has won before allowing player to move
        user_input = prompt_text "Enter a number between 1 and 9 to make your move"
        game_board = play_spot(game_board, user_input.to_s.strip, "X")
      end
    end
    draw_board(game_board) if player_first
    user_input = prompt_text "You lose! Wanna lose again? [Y/N]"
    play_game if user_input == "Y"
  end
end
