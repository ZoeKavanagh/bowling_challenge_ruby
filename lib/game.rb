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

  def make_final_frame
    @frames.last.make_final_frame
  end

  private

  def add_frame
    @frames << @new_frame
    make_final_frame if @frames.length == 10
  end

  def last_frame_complete?
    @frames.last.status != 'incomplete'
  end

  def add_roll_to_frame(pins)
    @frames.last.rolls << pins
  end

  def add_roll_to_final_frame(pins)
    @frames.last.rolls << pins
    @frames.last.rolls << pins
    @frames.last.rolls << pins
  end

  def final_frame?
    @frames.last.frame_name == 'final'
  end
end
