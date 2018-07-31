require 'frame'

describe Frame do
  describe '#frame_type' do
    it 'should return strike if first roll in frame is 10' do
      rolls = [10]
      expect(subject.frame_type(rolls)).to eq 'strike'
    end

    it 'should return spare if both rolls total 10' do
      rolls = [8, 2]
      expect(subject.frame_type(rolls)).to eq 'spare'
    end

    it 'should return normal if total for both rolls are less than 10' do
      rolls = [5, 3]
      expect(subject.frame_type(rolls)).to eq 'normal'
    end
  end

  describe '#add_roll_one' do
    it 'should add a roll to the rolls array' do
      frame = Frame.new
      expect(frame.add_roll_one(10)).to eq [10]
    end
  end

  describe '#add_roll_two' do
    it 'should add a second roll to the rolls array' do
      frame = Frame.new
      frames = []
      frame.add_roll_one(9)
      expect(frame.add_roll_two(1, frames)).to eq [[9, 1]]
    end
  end
end
