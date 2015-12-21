class UI
  attr_reader :game_state

  def initialize(game_state)
    @game_state = game_state

  end

  def banner
    "Welcome to sizzling show down!"
  end

  def game_over
    "You lose!  Want to try again?"
  end

  def board
    output = []
    (0..game_state.state_size).each do |position|
      output <<
      "
      ===
      | |
      ===
      "
    end
    puts output
  end

  def prompt
    puts "Make your move"
  end

end
