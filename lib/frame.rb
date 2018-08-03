class Frame
  attr_reader :rolls

  NUMBER_OF_ROLLS = 2
  STRIKE = 10
  SPARE = 10

  def initialize
    @rolls = []
  end

  def add_roll(pins)
    @rolls << pins
  end

  def incomplete?
    !complete?
  end

  def strike?
    @rolls[0] == STRIKE
  end

  def spare?
    @rolls.length == NUMBER_OF_ROLLS && rolls.sum == SPARE
  end

  def complete?
    @rolls.length == NUMBER_OF_ROLLS || strike? || spare?
  end

  def final?
    false
  end
end
