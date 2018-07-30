require 'calculate_score'

describe Calculate_score do
  describe '#total_score' do
    it 'will return the total score of a game with no spares or strikes' do
      simple_frame = instance_double('simple_frame', :rolls => [1, 2], :type => 'complete')
      frames = Array.new(10, simple_frame)

      expect(subject.total_score(frames)).to eq 30
    end

    it 'will return the total score of a game with one spare' do
      simple_frame = instance_double('simple_frame', :rolls => [1, 2], :type => 'complete')
      spare_frame = instance_double('spare_frame', :rolls => [9, 1], :type => 'spare')
      frames = [spare_frame]
      9.times { frames << simple_frame }
      allow(:frames).to receive(:total_score).and_return(false)

      expect(subject.total_score(frames)).to eq 38
    end

    it 'will return the total score of 135 of a game with all spares' do
      spare_frame = instance_double('spare_frame', :rolls => [9, 1], :type => 'spare')
      frames = []
      10.times { frames << spare_frame }

      expect(subject.total_score(frames)).to eq 181
    end

    it 'will return the total score of a game with one strike' do
      simple_frame = instance_double('simple_frame', :rolls => [1, 2], :type => 'complete')
      strike_frame = instance_double('strike_frame', :rolls => [10], :type => 'strike')
      frames = [strike_frame]
      9.times { frames << simple_frame }

      expect(subject.total_score(frames)).to eq 40
    end

    it 'will return the total score of 300 for a perfect game' do
      strike_frame = instance_double('strike_frame', :rolls => [10], :type => 'strike')
      frames = []
      10.times { frames << strike_frame }

      expect(subject.total_score(frames)).to eq 300
    end
  end
end
