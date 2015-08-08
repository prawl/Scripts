require 'spec_helper'

describe Human do

  let(:player) { Human.new }
  let(:board) { Board.new }
  let(:ui) { UI.new }
  let(:user_input) { player.quit?("q") }

  it 'check if player wants to quit' do
    expect(user_input).to eq(true)
  end

  describe '.valid_move?' do
    let!(:slots) { [1,3,4,5,7].map { |i|  board.play_position(i, "X") } }

    context 'invalid' do
      let(:move)  { player.valid_move?(ui, "Junk", board) }

      it 'prompts invalid move' do
        expect(move).to eq(false)
      end
    end

    context 'valid' do
      let(:move)  { player.valid_move?(ui, 2, board) }
      it 'does not prompt' do
        expect(move).to eq(true)
      end
    end
  end
end
