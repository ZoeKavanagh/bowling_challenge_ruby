# frozen_string_literal: true

require 'game'

describe Game do
  let(:subject) { described_class.new }

  describe '#add_roll' do
    it 'adds the first roll to the frame' do
      expect(subject.add_roll(5)).to eq [5]
    end

    it 'adds second roll to the same frame' do
      subject.add_roll(5)
      expect(subject.add_roll(3)).to eq [5, 3]
    end

    it 'adds next roll to a seperate frame' do
      subject.add_roll(5)
      subject.add_roll(2)
      subject.add_roll(3)
      expect(subject.frames[1].rolls).to eq [3]
    end

    it 'will add next roll to a seperate frame following a strike' do
      subject.add_roll(10)
      subject.add_roll(2)
      expect(subject.frames[1].rolls).to eq [2]
    end

    it 'will add next roll to a seperate frame following a spare' do
      subject.add_roll(5)
      subject.add_roll(5)
      subject.add_roll(2)
      expect(subject.frames[1].rolls).to eq [2]
    end

    it 'should allow three rolls on final frame if first roll is a strike' do
      10.times { subject.add_roll(10) }
      subject.add_roll(2)
      expect(subject.frames.last.rolls).to eq [10, 2]
    end
  end

  describe '#total_score' do
    it 'should return the total score of a complete game' do
      21.times { subject.add_roll(5)}
      expect(subject.total_score(subject.frames)).to eq 150
    end
  end
end
