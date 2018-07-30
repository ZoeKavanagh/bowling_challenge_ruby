# frozen_string_literal: true

class Game
  attr_reader :frames, :score

  def initialize
    @frames = []
    @score = 0
  end
end
