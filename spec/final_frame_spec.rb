require 'frame'
require 'final_frame'

describe FinalFrame do
  describe '#complete?' do
    it 'should return true if three strikes were rolled' do
      3.times { subject.add_roll(10) }
      expect(subject.complete?).to eq true
    end

    it 'should return true if two normal rolls have been added' do
      subject.add_roll(2)
      subject.add_roll(4)
      expect(subject.complete?).to eq true
    end

    it 'should return true if a spare has been rolled with a final roll' do
      subject.add_roll(5)
      subject.add_roll(5)
      subject.add_roll(3)
      expect(subject.complete?).to eq true
    end
  end
end
