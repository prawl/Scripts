require 'pry'

class UI
  attr_reader :game_state

  def initialize(game_state)
    @game_state = game_state
  end

  def banner
    "Welcome to sizzling show down!"
  end

  def winner
    puts "Nice job!"
  end

  def game_over
    puts "You lose! Want to try again?"
  end

  def prompt
    puts "Make your move"
  end

  def board
    output = []
    (0...game_state.state_size).each do |position|
      output <<
      "
      ===
      |#{ position == game_state.position - 1 ? "X" : game_state.state[position] }|
      ===
      "
    end
    puts output
  end
end
