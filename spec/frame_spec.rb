require 'frame'

describe Frame do
  describe '#status' do
    it 'should return strike if first roll in frame is 10' do
      subject.add_roll(10)
      expect(subject.status).to eq 'strike'
    end

    it 'should return spare if both rolls total 10' do
      subject.add_roll(8)
      subject.add_roll(2)
      expect(subject.status).to eq 'spare'
    end

    it 'should return normal if total for both rolls are less than 10' do
      subject.add_roll(2)
      subject.add_roll(3)
      expect(subject.status).to eq 'complete'
    end
  end

  describe '#add_roll' do
    it 'should add a roll to the rolls array' do
      frame = Frame.new
      expect(frame.add_roll(10)).to eq [10]
    end

    it 'should add a second roll to the rolls array' do
      frame = Frame.new
      frame.add_roll(9)
      expect(frame.add_roll(1)).to eq [9, 1]
    end
  end
end
