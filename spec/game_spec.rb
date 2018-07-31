# frozen_string_literal: true

require 'game'

describe Game do
  describe '#initialize' do
    it 'has an empty frame on initialize' do
      expect(subject.frames).to eq []
    end

    it 'has an initial score of 0 on initialize' do
      expect(subject.total_score).to eq 0
    end
  end

  describe '#add_roll_one' do
    it 'adds the first roll to the frame' do
      expect(subject.add_roll_one(5)).to eq [5]
    end
  end

  describe '#add_roll_two' do
    it 'adds the second roll to the frame' do
      expect(subject.add_roll_two(3)).to eq [3]
    end
  end
end
