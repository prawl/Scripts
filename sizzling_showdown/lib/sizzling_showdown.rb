require './game_state.rb'
require './ui.rb'
require './player.rb'

class SizzlingShowdown
  attr_reader :state, :ui, :player

  def initialize
    @state =  GameState.new(3)
    @ui = UI.new(state)
    @player = Player.new
  end

  def play
    ui.banner
    while true
      ui.board
      ui.prompt
      player.get_input
    end
  end
end

SizzlingShowdown.new.play
