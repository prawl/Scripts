require 'spec_helper' 

describe Computer do

  let(:computer) { Computer.new "X" }
  let(:piece) { computer.swap_pieces("X") }
  let(:board) { Board.new }

  it 'switches game pieces' do
    expect(piece).to eq("O")
  end

  describe '.score' do
    let(:score) { computer.score(board) }

    context 'gives 10 points' do
      let!(:update_board) { board.game_slots = ['X', 'O', 'O', 'O', 'X', 'X', 'X', 'X', 'X'] }
      it 'winning move' do
        expect(score).to eq(10)
      end
    end

    context 'gives -10 points' do
      let!(:update_board) { board.game_slots = ['X', 'O', 'O', 'O', 'X', 'O', 'X', 'X', 'O'] }
      it 'losing move' do
        expect(score).to eq(-10)
      end
    end

    context 'give 0 points' do
      let!(:update_board) { board.game_slots = ['X', 'O', 'O', 'O', 'X', 'X', 'X', 'X', 'O'] }
      it 'neutral move' do
        expect(score).to eq(0)
      end
    end
  end
end
