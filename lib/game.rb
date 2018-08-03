require_relative 'calculate_score'
require_relative 'frame'
require_relative 'final_frame'

class Game
  attr_reader :frames

  class GameOverError < StandardError; end

  def initialize(score = CalculateScore.new)
    @frames = [FinalFrame.new]
    9.times { @frames.unshift Frame.new }
    @score_calculator = score
  end

  def add_roll(pins)
    raise GameOverError if complete?
    current_frame.rolls << pins
  end

  def total_score
    @score_calculator.calculation(@frames)
  end

  private

  def complete?
    final_frame.complete?
  end

  def current_frame
    @frames.find(&:incomplete?)
  end

  def final_frame
    @frames.last
  end
end
