require_relative 'calculate_score'
require_relative 'frame'
require_relative 'final_frame'

class Game
  attr_reader :frames, :new_frame

  def initialize(score = CalculateScore.new)
    @frames = []
    9.times { @frames << Frame.new }
    @frames << FinalFrame.new
    @score = score
  end

  def add_roll(pins)
    current_frame.rolls << pins
  end

  def total_score(frames)
    @score.calculation(frames)
  end

  private

  def complete?
    @frames.last.complete?
  end

  def current_frame
    @frames.find(&:incomplete?)
  end

  def add_extra_roll(pins)
    @final_frame.rolls << pins
  end

  def final_frame?
    @frames.last 
  end
end
