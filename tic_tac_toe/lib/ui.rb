class UI
  def exposition
    puts "\nWelcome to unbeatable Tic Tac Toe, prepare to cry.  You can quit at any time by pressing Q"
  end

  def turn(player)
    puts "\nIt's the #{player} turn!"
  end
  
  def winner
    puts "\nThe computer won!" 
    abort
  end

  def thinking
    puts "\nThe computer is moving"
    sleep 2
  end
  
  def tie
    puts "\nThe game ended in a tie!  I told you that you were not going to win"
    abort
  end

  def invalid_input
    puts "\nOops! Looks like your input was invalid."
  end
  
  def prompt_move(board)
    puts "\nPlease enter a number between 1 and #{board.size} to make your move"
  end

  def quit
    puts "\nWould you like to quit the game?"
  end

  def try_again
    puts "\nWould you like to play again?"
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
    puts "\n"
    puts output
  end
end
