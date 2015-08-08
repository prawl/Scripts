require 'spec_helper' 

describe Computer do

  let(:computer) { Computer.new "X" }
  let(:piece) { computer.swap_pieces("X") }
  let!(:board) { Board.new }
  let(:ui) { UI.new }

  it 'switches game pieces' do
    expect(piece).to eq("O")
  end

  describe '.score' do
    let(:score) { computer.score(board) }

    context 'gives 10 points' do
      it 'winning move' do
       #  expect(score).to eq(10)
      end
    end

    context 'gives -10 points' do
      it 'losing move' do
       #  expect(score).to eq(-10)
      end
    end

    context 'give 0 points' do
      it 'neutral move' do
       #  expect(score).to eq(0)
      end
    end
  end

  describe '.minmax' do
    let!(:update_board) { board.play_position(1, "X") }
    let!(:minmax) { computer.minmax(board, computer.game_piece) }

    it 'gives the best available score' do
      # expect(minmax).to eq(10)
      # expect(computer.best_choice).to eq(3)
      # expect(board.game_slots).not_to eq(["X","X","X","X","X","X","X","X","X"])
    end
  end

  describe '.play_position' do
    let(:move) { ['1', '2', 'X', '4', '5', '6', '7', '8', '9'] }
    let(:best_choice) { 3 }
    let(:computer_move) { board.play_position(best_choice, computer.game_piece) }

    it '' do
      expect(computer_move).to eq(computer.game_piece)
    end
  end


  describe '.best_move' do
    let(:scores) { {"1" => 10, "2" => -10, "3" => 10 } } 
    let(:best_move) { computer.best_move(computer.game_piece, scores) }
    it 'does something' do
      expect(best_move).to eq( ['1', 10 ])
    end

    let(:scores_2) { [  ["7" => 10], ["9" => 10] ]   }
    let(:best_move_2) { computer.best_move(computer.game_piece, scores_2) }

    it 'does something else' do
    end
  end

  describe 'play_piece' do
    let!(:board_2) { board.dup } 
   #  let!(:update_board) { board.play_position(1, "O") }
    let!(:play_piece) { computer.play_piece(board, ui) }

    it '' do
    #  expect(computer.game_piece).to eq('X')
    #  expect(board.game_slots).to eq( ['O', '2', '3', '4', '5', 'X', '7', '8', '9'])
    end
  end
end
