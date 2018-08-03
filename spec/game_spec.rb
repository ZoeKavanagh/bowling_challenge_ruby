# frozen_string_literal: true
require 'game'

describe Game do
  describe '#add_roll' do
    it 'adds the first roll to the frame' do
      expect(subject.add_roll(5)).to eq [5]
    end

    it 'adds second roll to the same frame' do
      subject.add_roll(5)
      expect(subject.add_roll(3)).to eq [5, 3]
    end

    it 'adds next roll to a seperate frame' do
      [5, 2, 3].each { |pins| subject.add_roll(pins) }
      expect(subject.frames[1].rolls).to eq [3]
    end

    it 'will add next roll to a seperate frame following a strike' do
      subject.add_roll(10)
      subject.add_roll(2)
      expect(subject.frames[1].rolls).to eq [2]
    end

    it 'will add next roll to a seperate frame following a spare' do
      [5, 5, 2].each { |pins| subject.add_roll(pins) }
      expect(subject.frames[1].rolls).to eq [2]
    end

    it 'should allow three rolls on final frame if first roll is a strike' do
      10.times { subject.add_roll(10) }
      subject.add_roll(2)
      expect(subject.frames.last.rolls).to eq [10, 2]
    end

    it 'should raise GameOverError if game is complete' do
      allow(subject).to receive(:complete?).and_return(true)
      expect { subject.add_roll(2) }.to raise_error(Game::GameOverError)
    end
  end

  describe '#total_score' do
    it 'should return the total score of a complete game' do
      21.times { subject.add_roll(5) }
      expect(subject.total_score).to eq 150
    end
  end
end
