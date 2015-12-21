class GameState
  attr_reader :position, :state_size, :state

  def initialize(state_size)
    @state_size = state_size
    @state = create_state
    @position = state_size
  end

  def advance
    @position += 1 unless max_limit
  end

  def recede
    @position -= 1 unless min_limit
  end

  private

  def create_state
    arr = []
    (0...state_size).each { arr << "" }
    arr
  end

  def max_limit
    @position >= state_size * 2
  end

  def min_limit
    @position <= 0
  end
end
