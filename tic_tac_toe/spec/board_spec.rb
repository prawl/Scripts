require 'spec_helper'

describe Board do

  let(:board) { Board.new }
  let(:slots) { ['1', '2', '3', '4', '5', '6', '7', '8', '9'] }
  let(:slots_x4) { ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16'] }

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
        expect(board.game_slots).to eq(slots_x4)
      end
    end
  end

  describe '#size' do
    it 'prints the size of the board' do
      expect(board.size).to eq(9)
    end
  end

  describe '#grid size' do
    context '3x3 tic_tac_toe board' do
      let(:grid_size) { board.grid_size }
      it 'returns the size of the grid' do
        expect(grid_size).to eq(3)
      end
    end

    context '4x4 tic_tac_toe board' do
      it 'returns the size of the grid' do
        expect(Board.new(4).grid_size).to eq(4)
      end
    end
  end

  describe '#play_position' do
    let(:move) { board.play_position(1, 'X') }
    let(:turn) { ['X', '2', '3', '4', '5', '6', '7', '8', '9'] }
    it 'places the given game piece on the specified board position' do
      expect(move).to eq(turn)
    end
  end

  describe '#tie?' do
    let(:game) { board.tie? }

    context 'is full' do
      before do
         board.game_slots = ['X', 'O', 'O', 'X', 'O', 'X', 'O', 'O', 'X']
      end

      it 'determines when the game board is full' do
        expect(game).to eq(true)
      end
    end

    context 'not full' do
      before do
         board.game_slots = ['X', '2', '3', '4', '5', '6', '7', '8', '9']
      end

      it 'determines when the game board is not full' do
        expect(game).to eq(false)
      end
    end
  end

  describe '.available?' do
    let!(:move) { board.game_slots = ['X', '2', 'O', 'O', 'X', '6', 'O', '8', '9'] }
    let(:not_available) { board.available?('4') }

    it 'space is available' do
      expect(not_available).to eq(false)
    end

    let(:available) { board.available?('2') }

    it 'space is not available' do
      expect(available).to eq(true)
    end
  end

  describe '.vertical_wins' do
    let (:exctract_vertical) { board.vertical_wins }
    let(:vertial) { [ ['1','4','7'], ['2','5','8'], ['3','6','9'] ] }

    it 'extracts all vertial win potentials' do
      expect(exctract_vertical).to eq(vertial)
    end
  end

  describe '.winning positions' do
    let(:vertical_wins) { board.vertical_wins }
    let(:horizontal_wins) { board.horizontal_wins }
    let(:diagonal_wins) { board.diagonal_wins }
    let(:diagonal) { [ ['1','5','9'], ['3','5','7'] ]  }
    let(:horizontal) { [ ['1','2','3'], ['4','5','6'], ['7','8','9'] ] }
    let(:vertical) { [ ['1','4','7'], ['2','5','8'], ['3','6','9'] ] }

    context 'empty board' do
      it 'gives all possible vertical wins posiitions' do
        expect(vertical_wins).to eq(vertical)
      end

      it 'gives all possible horizontal winning posiitions' do
        expect(horizontal_wins).to eq(horizontal)
      end

      it 'gives all possible diagonal winning posiitions' do
        expect(diagonal_wins).to eq(diagonal)
      end
    end

    context 'non-empty board' do
      let!(:test) { board.game_slots = ['X', '2', '3', 'X', '5', '6', 'X', '8', '9'] }
      let(:vertical) { [ ['X','X','X'], ['2','5','8'], ['3','6','9'] ] }
      let(:vertical_wins) { board.vertical_wins }

      it 'gives all possible vertical wins posiitions' do
        expect(vertical_wins).to eq(vertical)
      end
    end
  end

  describe '.winner?' do
    let(:winner) { board.winner? }

    context 'winning condition found' do
      let!(:test) { board.game_slots = ['X', 'X', 'X', '4', '5', '6', '7', '8', '9'] }
      it 'returns true' do
        expect(winner).to eq(true)
      end
    end

    context 'winning condition not found' do
      it 'returns false' do
        expect(winner).to eq(false)
      end
    end
  end
end
