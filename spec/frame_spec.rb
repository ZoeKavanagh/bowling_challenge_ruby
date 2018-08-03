require 'frame'

describe Frame do
  describe '#strike?' do
    it 'should return true if first roll in frame is 10' do
      subject.add_roll(10)
      expect(subject.strike?).to eq true
    end
  end

  describe '#spare?' do
    it 'should return true if both rolls total 10' do
      subject.add_roll(8)
      subject.add_roll(2)
      expect(subject.spare?).to eq true
    end
  end

  describe '#complete?' do
    it 'should return true if total for both rolls are less than 10' do
      subject.add_roll(2)
      subject.add_roll(3)
      expect(subject.complete?).to eq true
    end
  end

  describe '#add_roll' do
    it 'should add a roll to the rolls array' do
      expect(subject.add_roll(10)).to eq [10]
    end

    it 'should add a second roll to the rolls array' do
      subject.add_roll(9)
      expect(subject.add_roll(1)).to eq [9, 1]
    end
  end
end
