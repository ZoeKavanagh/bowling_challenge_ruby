require_relative 'calculate_score'
require_relative 'frame'

class Game
  attr_reader :frames

  def initialize(frame_type = Frame.new, score = Calculate_score.new)
    @new_frame = frame_type
    @frames = [@new_frame]
    @score = score
  end

  def add_roll(pins)
    add_frame if last_frame_complete?
    add_roll_to_frame(pins)
  end

  def total_score(frames)
    @score.calculation(frames)
  end

  private

  def add_frame
    @frames << @new_frame
  end

  def last_frame_complete?
    @frames.last.status != 'incomplete'
  end

  def add_roll_to_frame(pins)
    @frames.last.rolls << pins
  end
end
