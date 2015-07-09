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

  describe '.ai_calculate' do
    context 'player has a potential win' do
      let (:block_player) { ['2', 'X', 'X'] }
      before { TicTacToe.ai_calculate(block_player) }

      it 'blocks the player' do
        expect(block_player).to eq (["2"])
      end
    end

    context 'computer has a potential win' do
      let (:win_game) { ['O', 'O', '6'] }
      before { TicTacToe.ai_calculate(win_game) }

      it 'wins the game' do
        expect(win_game).to eq (["6"])
      end
    end

    context 'no potential win' do
      let (:not_valid) { TicTacToe.ai_calculate (['1', '2', '3']) }

      it 'returns nil' do
        expect(not_valid).to eq (nil)
      end
    end
  end

  describe '.valid_move' do
    let(:valid_input)  { "1" }
    let(:invalid_input)  { "Junk" }
    let(:valid_move) { TicTacToe.valid_move(board, valid_input) }
    let(:invalid_move) { TicTacToe.valid_move(board, invalid_input) }

    it 'keeps prompting for input until valid' do
      expect(invalid_move).to eq(false)
    end

    it 'keep prompting for input until valid' do
      expect(valid_move).to eq(true)
    end
  end
end
