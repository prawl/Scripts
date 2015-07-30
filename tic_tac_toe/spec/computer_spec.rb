require 'spec_helper' 

describe Computer do

  let(:computer) { Computer.new }
  let(:piece) { computer.swap_pieces("X") }

  it 'switches game pieces' do
    expect(piece).to eq("O")
  end

  describe '.score' do
    it 'gives 10 points to a winner move' do
    end
    it 'remove 10 points to a losing move' do
    end
    it 'give 0 points to a neutral move' do
    end
  end
end
