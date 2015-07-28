class UI
  def exposition
    puts "Welcome to unbeatable Tic Tac Toe, prepare to cry.  You can quit at any time by pressing Q"
  end

  def turn(player)
    new_line
    puts "It's the #{player} turn!"
  end
  
  def winner
    new_line
    puts "The computer won!" 
  end
  
  def tie
    new_line
    puts "The game ended in a tie!  I told you that you were not going to win"
  end

  def invalid_input
    new_line
    puts "Oops! Looks like your input was invalid."
  end
  
  def prompt_move(board)
    new_line
    puts "Please enter a number between 1 and #{board.size} to make your move"
  end

  def quit
    new_line
    puts "Would you like to quit the game?"
  end

  def try_again
    new_line
    puts "Would you like to play again?"
  end

  def new_line
    puts "\n"
  end

  def display_board(board)
    output = ''
    size = board.size
    (1..size).each do |index|
      if index % board.grid_size == 0
        output << " #{board.game_slots[index-1]} \n" 
        output << "----------- \n" if index != size
      else
        output << " #{board.game_slots[index-1]} |"
      end
    end
    new_line
    puts output
  end
end
