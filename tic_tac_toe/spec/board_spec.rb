require 'spec_helper'

describe Board do

  let(:board) { Board.new }
  let!(:slots) { [nil, nil, nil,nil, nil, nil,nil, nil, nil] }
  let(:slots_x4) { [nil, nil, nil,nil, nil, nil,nil, nil, nil, nil, nil, nil, nil, nil, nil, nil] }

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

  describe '#grid_size' do
    context '3x3 tic_tac_toe board' do
      it 'returns the size of the grid' do
        expect(Board.new(3).grid_size).to eq(3)
      end
    end

    context '4x4 tic_tac_toe board' do
      it 'returns the size of the grid' do
        expect(Board.new(4).grid_size).to eq(4)
      end
    end
  end

  describe '#play_position' do
    context 'play a position' do
      let(:move) { board.play_position(1, 'X') }
      let(:turn) { ['X', '2', '3', '4', '5', '6', '7', '8', '9'] }
      it 'places the given game piece on the specified board position' do
        expect(move).to eq('X')
      end
    end

    context 'board game slots should be unique' do
      let!(:board_1) { Board.new }
      let!(:board_2) { Board.new }
      let!(:play) { board_1.play_position(0, "X") }

      before { board_2 = board_1 }
      it '' do
        expect(board_1.game_slots).not_to eq(board_2.game_slots)
      end
    end

  end

  describe '#tie?' do
    let(:game) { board.tie? }

    context 'is full' do
      before { (0...9).map { |v| board.play_position(v, 'X') } }

      it 'determines when the game board is full' do
        expect(game).to eq(true)
      end
    end

    context 'not full' do
      before { board.play_position(1, "X") }

      it 'determines when the game board is not full' do
        expect(game).to eq(false)
      end
    end
  end

  describe '.winning_positions' do
    let(:vertical_wins) { board.vertical_wins }
    let(:horizontal_wins) { board.horizontal_wins }
    let(:diagonal_wins) { board.diagonal_wins }
    let(:diagonal) { [ [0,4,8], [2,4,6] ]  }
    let(:horizontal) { [ [0,1,2], [3,4,5], [6,7,8] ] }
    let(:vertical) { [ [0,3,6], [1,4,7], [2,5,8] ] }

    it 'all possible vertical wins' do
      expect(vertical_wins).to eq(vertical)
    end

    it 'all possible horizontal wins' do
      expect(horizontal_wins).to eq(horizontal)
    end

    it 'all possible diagonal wins' do
      expect(diagonal_wins).to eq(diagonal)
    end
  end

  describe '.winner?' do
    let(:winner) { board.winner? }

    context 'winning condition found' do
      let!(:win) { (0...3).map { |i| board.play_position(i, "O") } }
      it 'returns true' do
        expect(winner).to eq(true)
      end
    end

    context 'winning condition not found' do
      before { board.play_position(1, "X") }

      it 'returns false' do
        expect(winner).to eq(false)
      end
    end
  end

  describe '.winning_piece' do
    let(:winning) { board.winning_piece }

    context 'X won' do
      let!(:win_1) { (0...3).map { |i| board.play_position(i, "X") } }
      it 'return X' do
        expect(winning).to eq("X")
      end
    end

    context 'O won' do
      let!(:win_2) { (0...3).map { |i| board.play_position(i, "O") } }
      it 'return O' do
        expect(winning).to eq("O")
      end
    end

    context 'neither won' do
      let!(:win_3) { (0...9).map { |i| board.play_position(i, "Z") } }
      it 'returns false' do
        expect(winning).to eq(false)
      end
    end
  end

  describe '.available?' do
    let!(:move) { [0,2,3,4,6].map { |i| board.play_position(i, "X") } }
    let(:not_available) { board.available?(4) }

    it 'space is available' do
      expect(not_available).to eq(false)
    end

    let(:available) { board.available?(8) }

    it 'space is not available' do
      expect(available).to eq(true)
    end

    let(:junk) { board.available?('junk') }
    it 'always false on junk input' do
      expect(junk).to eq(false)
    end
  end

  describe '.available_moves' do
    context 'moves are available' do
      let!(:moves) { [0,1,2,4].map { |i| board.play_position(i, "X") } }
      let!(:available) { board.available_moves } 
      it 'gives a list of moves that can be played' do
        expect(available).to eq([3, 5, 6, 7, 8])
      end
    end

    context 'no moves available' do
      let!(:moves) { (0...9).map { |i| board.play_position(i, "O") } }
      let!(:available) { board.available_moves } 
      it 'returns an empty move set' do
        expect(available).to eq([])
      end
    end
  end
end
