require 'calculate_score'

describe CalculateScore do
  describe '#score_calc' do
    let(:simple_frame) { instance_double('simple_frame', rolls: [1, 2], complete?: true, spare?: false, strike?: false, final?: false) }
    let(:spare_frame) { instance_double('spare_frame', rolls: [9, 1], spare?: true, complete?: false, strike?: false, final?: false) }
    let(:strike_frame) { instance_double('strike_frame', rolls: [10], strike?: true, complete?: false, spare?: false, final?: false) }

    it 'will return the total score of a game with no spares or strikes' do
      frames = Array.new(10, simple_frame)
      expect(subject.calculation(frames)).to eq 30
    end

    it 'will return the total score of a game with one spare' do
      frames = [spare_frame]
      9.times { frames << simple_frame }
      expect(subject.calculation(frames)).to eq 38
    end

    it 'will return the total score of 135 of a game with all spares' do
      frames = []
      10.times { frames << spare_frame }
      expect(subject.calculation(frames)).to eq 181
    end

    it 'will return the total score of a game with one strike' do
      frames = [strike_frame]
      9.times { frames << simple_frame }
      expect(subject.calculation(frames)).to eq 40
    end

    it 'will return the total score of 300 for a perfect game' do
      final_frame = instance_double('final_frame', rolls: [10, 10, 10], strike?: true, spare: false, complete?: false, final?: true)
      frames = []
      9.times { frames << strike_frame }
      frames << final_frame
      expect(subject.calculation(frames)).to eq 300
    end
  end
end
