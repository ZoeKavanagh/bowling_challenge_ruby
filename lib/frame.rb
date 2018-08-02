class Frame
  attr_reader :rolls, :frame_name

  def initialize
    @rolls = []
  end

  def add_roll(pins)
    @rolls << pins
  end

  def status
    return 'strike' if strike?
    return 'spare' if  spare?
    return 'complete' if complete?
    'incomplete'
  end

  def incomplete?
    !complete?
  end

  def strike?
    @rolls[0] == 10
  end

  def spare?
    @rolls.length == 2 && rolls.sum == 10
  end

  def complete?
    @rolls.length > 1 || strike? || spare?
  end
end
