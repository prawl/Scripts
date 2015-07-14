require 'spec_helper'

describe Board do

  let(:board) { Board.new }
  let(:slots) { Array.new(9) }

  describe '#initialize' do
    context 'by default' do
      it 'creates a standard 3x3 tic_tac_toe board' do
        expect(board.game_slots).to eq(slots)
      end
    end
    
    context 'when passed a 4' do
      let(:board) { Board.new(4) }
      let(:slots) { Array.new(16) }

      it 'creates a 4x4 tic_tac_toe board' do
        expect(board.game_slots).to eq(slots)
      end
    end
  end

  describe '#print' do
    it 'print the game board' do
      puts board.print
    end
  end

  describe '#size' do
    it 'prints the size of the board' do
      expect(board.size).to eq(9)
    end
  end

end
