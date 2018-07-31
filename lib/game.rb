require_relative 'calculate_score'
require_relative 'frame'

class Game
  attr_reader :frames, :score, :frame

  def initialize(score=Calculate_score.new, frame=Frame.new)
    @frame = frame
    @frames = []
    @score = score
  end

  def add_roll_one(pins)
    @frame.add_roll(pins)
  end

  def add_roll_two(pins)
    @frame.add_roll(pins)
  end

  def add_frame(rolls)
    @frames << rolls
    @frame.clear_rolls
  end
end
