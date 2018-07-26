# frozen_string_literal: true

require 'game'

describe Game do
  describe '#initialize' do
    it 'has an empty frame on initialize' do
      expect(subject.frames).to eq []
    end
  end  
end
