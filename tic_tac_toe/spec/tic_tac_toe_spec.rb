require 'spec_helper'

describe 'TicTacToe' do
  let (:board) { TicTacToe.initalize_board }

  describe '.initalize_board' do
    it 'creates the game board' do
      expect(TicTacToe.initalize_board).to be_kind_of(Array)
    end
  end

  describe '.extract_horizontal' do
    let(:horizontal) { TicTacToe.extract_horizontal(board) }
    it 'extracts horizontal moves' do
       expect(horizontal).to eq([["1","2","3"], ["4","5","6"], ["7","8","9"]])
    end
  end

  describe '.play_spot' do
    let(:user_input) { '1' }
    let(:valid_play) { TicTacToe.play_spot(board, user_input, 'X' )}
    it 'saves user input into the game board' do
      expect(valid_play).to eq(['X', '2', '3', '4', '5', '6', '7', '8', '9'])
    end

    let(:invalid_play) { TicTacToe.play_spot(board, user_input, 'Z' )}
    it 'blocks invalid input' do
      expect(invalid_play).to eq(board)
    end
  end

  describe '.try_to_win' do
    let(:diagonal_winning_play) { ['O', '2', '3', '4', 'O', '6', '7', '8', '9'] }
    let(:win_diag) { TicTacToe.try_to_win(diagonal_winning_play) }
    context 'diagonal win' do
      it 'picks the winning spot for the computer' do
        expect(win_diag).to eq('9')
      end
    end

    let(:horizontal_winning_play) { ['O', 'O', '3', '4', '5', '6', '7', '8', '9'] }
    let(:win_hori) { TicTacToe.try_to_win(horizontal_winning_play) }
    context 'horizontal win' do
      it 'picks the winning spot for the computer' do
        expect(win_hori).to eq('3')
      end
    end

    let(:virtical_winning_play) { ['O', '2', '3', 'O', '5', '6', '7', '8', '9'] }
    let(:win_virt) { TicTacToe.try_to_win(virtical_winning_play) }
    context 'virtical win' do
      it 'picks the winning spot for the computer' do
        expect(win_virt).to eq('7')
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

    let(:randomly_picked_play) { ['1', '2', '3', '4', 'X', '6', '7', '8', '9'] }
    let(:random) { TicTacToe.determine_computers_move(randomly_picked_play) }
    context 'randomly pick a spot ' do
      it 'picks a corner spot' do
        expect(["1","3","7","9"]).to include(random)
      end
    end
  end

  describe '.game_complete' do
    let(:winning_board) { ['O', '2', '3', '4', 'O', '6', '7', '8', 'O'] }
    let(:win) { TicTacToe.game_complete(winning_board) }
    context 'player win' do
      it 'returns true' do
        expect(win).to eq(true)
      end
    end
  end
end
