require './game_state.rb'
require './ui.rb'
require './player.rb'

class SizzlingShowdown
  attr_reader :state, :ui, :player

  def initialize
    @state =  GameState.new(5)
    @ui = UI.new(state)
    @player = Player.new
  end

  def play
    ui.banner
    while true
      ui.board
      ui.prompt
      response = player.get_input
      state.advance if response == "w"
      state.recede if response == "l"
      ui.winner if state.won?
      ui.game_over if state.loss?
    end
  end
end

SizzlingShowdown.new.play
