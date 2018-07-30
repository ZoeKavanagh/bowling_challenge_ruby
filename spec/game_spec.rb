# frozen_string_literal: true

require 'game'

describe Game do
  describe '#initialize' do
    it 'has an empty frame on initialize' do
      expect(subject.frames).to eq []
    end
    
    it 'has an initial score of 0 on initialize' do
      expect(subject.score).to eq 0
    end
  end
end
