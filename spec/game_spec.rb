# frozen_string_literal: true

require 'game'

describe Game do
  let(:frame) { instance_double('frame', :rolls => [], :status => 'incomplete') }
  let(:subject) { Game.new(frame) }

  describe '#add_roll' do
    it 'adds the first roll to the frame' do
      subject.add_roll(5)
      expect(subject.frames.last.rolls).to eq [5]
    end

    it 'adds second roll to the same frame' do
      subject.add_roll(5)
      subject.add_roll(3)
      expect(subject.frames.last.rolls).to eq [5, 3]
    end

    it 'adds next roll to a seperate frame' do
      complete_frame = double('complete_frame', :rolls => [], :status => 'complete')
      game = Game.new(complete_frame)
      game.add_roll(5)
      expect(game.frames.length).to eq 2
    end
  end

  describe '#total_score' do
    it 'should return the total score of a complete game' do
      spare_frame = instance_double('spare_frame', :rolls => [9, 1], :status => 'spare')
      frames = []
      10.times { frames << spare_frame }
      game = Game.new(frames)
      expect(game.total_score(frames)).to eq 181
    end
  end


  describe '#make_final_frame' do
    it 'should change the frame_name of the last frame to final' do
      game = Game.new
      10.times { game.add_roll(10) }
      expect(game.make_final_frame).to eq 'final'
    end
  end
end
