require 'spec_helper'

describe 'TicTacToe' do
  let(:board) { TicTacToe.initalize_board }

  describe '.initalize_board' do
    it 'creates the game board' do
      expect(TicTacToe.initalize_board).to eq(['1', '2', '3', '4', '5', '6', '7', '8', '9'])
    end
  end

  describe '.extract_horizontal' do
    let(:horizontal) { TicTacToe.extract_horizontal(board) }
    it 'extracts horizontal moves' do
       expect(horizontal).to eq([["1","2","3"], ["4","5","6"], ["7","8","9"]])
    end
  end

  describe '.extract_veritical' do
    let(:vertical) { TicTacToe.extract_veritical(board) }
    it 'extracts vertical moves' do
      expect(vertical).to eq([["1","4","7"], ["2","5","8"], ["3","6","9"]])
    end
  end

  describe '.extract_diagonal' do
    let(:diagonal) { TicTacToe.extract_diagonal(board) }
    it 'extracts diagonal moves' do
      expect(diagonal).to eq([["1","5","9"], ["3","5","7"]])
    end
  end

  describe '.play_spot' do
    let(:user_input) { '1' }
    let(:valid_play) { TicTacToe.play_spot(board, user_input, 'X' )}
    it 'saves user input into the game board' do
      expect(valid_play).to eq(['X', '2', '3', '4', '5', '6', '7', '8', '9'])
    end
  end

  describe '.game_complete' do
    let(:winning_board) { ['O', '2', '3', '4', 'O', '6', '7', '8', 'O'] }
    let(:win) { TicTacToe.game_complete?(winning_board) }
    context 'player win' do
      it 'returns true' do
        expect(win).to eq(true)
      end
    end
  end

  describe '.block_player' do
    context 'player has a potential win' do
      let (:block_player) { ['2', 'X', 'X'] }
      before { TicTacToe.check_block(block_player) }

      it 'blocks the player' do
        expect(block_player).to eq (["2"])
      end
    end
  end

  describe '.check_win' do
    context 'computer has a potential win' do
      let (:win_game) { ['O', 'O', '6'] }
      before { TicTacToe.check_win(win_game) }

      it 'wins the game' do
        expect(win_game).to eq (["6"])
      end
    end
  end

  describe '.determine_computers_move' do
    let(:diagonal_block_play) { ['X', '2', '3', '4', '5', '6', '7', '8', 'X'] }
    let(:block_diag) { TicTacToe.determine_computers_move(diagonal_block_play) }
    context 'diagonal block' do
      it 'picks the winning spot for the computer' do
        expect(block_diag).to eq('5')
      end
    end

    let(:horizontal_block_play) { ['1', '2', '3', 'X', 'X', '6', '7', '8', '9'] }
    let(:block_hori) { TicTacToe.determine_computers_move(horizontal_block_play) }
    context 'horizontal block' do
      it 'picks the winning spot for the computer' do
        expect(block_hori).to eq('6')
      end
    end

    let(:virtical_block_play) { ['1', '2', 'X', '4', '5', 'X', '7', '8', '9'] }
    let(:block_virt) { TicTacToe.determine_computers_move(virtical_block_play) }
    context 'virtical block' do
      it 'picks the winning spot for the computer' do
        expect(block_virt).to eq('9')
      end
    end

    let(:center_picked_play) { ['1', '2', '3', '4', '5', '6', '7', '8', '9'] }
    let(:center) { TicTacToe.determine_computers_move(center_picked_play) }
    context 'randomly pick a spot ' do
      it 'picks a corner spot' do
        expect(center).to eq('5')
      end
    end

    let(:random) { ['1', '2', '3', '4', 'X', '6', '7', '8', '9'] }
    let(:randomly_picked_play) { TicTacToe.determine_computers_move(random) }
    context '' do
      it '' do
        expect(random).to include(randomly_picked_play)
      end
    end
  end

  describe '.available_spots' do
    let(:available) { TicTacToe.available_spots(['O', 'X', 'X', '4', '5', 'O', '7', '8', 'X']) }
    let(:spots) { ['4', '5', '7', '8'] }
    it 'gives the available spots that can be played' do
      expect(spots).to include(available)
    end
  end

  describe '.game_board' do
    context 'not full' do
      let(:plays) { TicTacToe.board_full?(['O', 'X', 'X', '4', '5', 'O', '7', '8', 'X']) }
      it 'determined when no available spots are left' do
        expect(plays).to eq(false)
      end
    end

    context 'full' do
    let(:plays) { TicTacToe.board_full?(['O', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'X']) }
      it 'determines when the board is full' do
        expect(plays).to eq(true)
      end
    end
  end

  describe '.valid_move' do
    let(:valid_input)  { "1" }
    let(:invalid_input)  { "Junk" }
    let(:valid_move) { TicTacToe.valid_move?(board, valid_input) }
    let(:invalid_move) { TicTacToe.valid_move?(board, invalid_input) }

    it 'keeps prompting for input until valid' do
      expect(invalid_move).to eq(false)
    end

    it 'keep prompting for input until valid' do
      expect(valid_move).to eq(true)
    end
  end

  describe '.special_case' do
    let(:corners) { ['1', '3', '7', '9'] }
    let(:mids) { ['2', '4', '6', '8'] }
    context 'player controls two corners' do
      let(:board) { TicTacToe.special_case(['X', '2', '3', '4', 'O', '6', '7', '8', 'X'])  }
      it 'computer always picks a side' do
        expect(mids).to include(board)
        expect(corners).not_to include(board)
      end
    end
    context 'player picks middle' do
      let(:board) { TicTacToe.special_case(['1', '2', '3', '4', 'X', '6', '7', '8', '9'])  }
      it 'computer always picks a corner' do
        expect(corners).to include(board)
        expect(mids).not_to include(board)
      end
    end
    context 'player picks middle and controls 1 corner' do
      let(:board) { TicTacToe.special_case(['O', '2', '3', '4', 'X', '6', '7', '8', 'X'])  }
      it 'computer always picks a corner' do
        expect(corners).to include(board)
        expect(mids).not_to include(board)
      end
    end
  end
end
