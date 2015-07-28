require 'spec_helper' 

describe Computer do

  let(:computer) { Computer.new }
  let(:piece) { computer.swap_pieces("X") }

  it 'switches game pieces' do
    expect(piece).to eq("O")
  end
end
