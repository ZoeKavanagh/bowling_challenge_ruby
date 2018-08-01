class Frame
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def add_roll(pins)
    @rolls << pins
  end

  def status
    return 'strike' if strike?
    return 'spare' if  spare?
    return 'complete' if not_complete?
    'incomplete'
  end

  private

  def strike?
    @rolls[0] == 10
  end

  def spare?
    @rolls.sum == 10
  end

  def not_complete?
    @rolls.length > 1
  end
end
