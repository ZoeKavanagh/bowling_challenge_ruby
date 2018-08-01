require 'calculate_score'

describe Calculate_score do
  describe '#score_calc' do
    it 'will return the total score of a game with no spares or strikes' do
      simple_frame = instance_double('simple_frame', :rolls => [1, 2], :status => 'complete')
      frames = Array.new(10, simple_frame)

      expect(subject.calculation(frames)).to eq 30
    end

    it 'will return the total score of a game with one spare' do
      simple_frame = instance_double('simple_frame', :rolls => [1, 2], :status => 'complete')
      spare_frame = instance_double('spare_frame', :rolls => [9, 1], :status => 'spare')
      frames = [spare_frame]
      9.times { frames << simple_frame }

      expect(subject.calculation(frames)).to eq 38
    end

    it 'will return the total score of 135 of a game with all spares' do
      spare_frame = instance_double('spare_frame', :rolls => [9, 1], :status => 'spare')
      frames = []
      10.times { frames << spare_frame }

      expect(subject.calculation(frames)).to eq 181
    end

    it 'will return the total score of a game with one strike' do
      simple_frame = instance_double('simple_frame', :rolls => [1, 2], :status => 'complete')
      strike_frame = instance_double('strike_frame', :rolls => [10], :status => 'strike')
      frames = [strike_frame]
      9.times { frames << simple_frame }

      expect(subject.calculation(frames)).to eq 40
    end

    it 'will return the total score of 300 for a perfect game' do
      strike_frame = instance_double('strike_frame', :rolls => [10], :status => 'strike')
      final_frame = instance_double('final_frame', :rolls => [10, 10, 10], :status => 'strike')
      frames = []
      9.times { frames << strike_frame }
      frames << final_frame

      expect(subject.calculation(frames)).to eq 300
    end
  end
end
