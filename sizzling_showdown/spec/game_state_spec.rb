require 'spec_helper'

describe GameState do
  subject { GameState.new(5) }

  it 'always starts in the middle' do
    expect(subject.position).to eq(3)
  end

  it 'creates the state size' do
    expect(subject.state_size).to eq(5)
  end

  describe '#loss?' do
    it 'returns true when position is at the minimum' do
      3.times { subject.recede }
      expect(subject.loss?).to eq(true)
    end

    it 'return false when position is not as the minimum' do
      expect(subject.loss?).to eq(false)
    end
  end

  describe '#won?' do
    it 'returns true when the position is at the maximum' do
      3.times { subject.advance }
      expect(subject.won?).to eq(true)
    end

    it 'returns false when the position is not at the maximum' do
    end
  end

  describe "state" do
    it 'is an array' do
      expect(subject.state).to be_kind_of Array
    end

    it 'has the size of state_size' do
      expect(subject.state.size).to eq(subject.state_size)
    end
  end

  describe '#advance' do
    before { subject.advance }

    it 'move up the game state' do
      expect(subject.position).to eq(4)
    end

    context 'at limit' do
      before { 4.times { subject.advance } }

      it 'does not move up the game state' do
        expect(subject.position).to eq(6)
      end
    end
  end

  context 'receeding' do
    before { subject.recede }

    it 'move back the game state' do
      expect(subject.position).to eq(2)
    end

    context 'at limit' do
      before { 4.times { subject.recede } }

      it 'cannot go below minimum limit' do
        expect(subject.position).to eq(0)
      end
    end
  end
end
