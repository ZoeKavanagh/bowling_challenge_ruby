class Frame
  attr_reader :rolls, :frame_name

  def initialize
    @rolls = []
    @frame_name = 'normal'
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

  def make_final_frame
    @frame_name = 'final'
  end

  private

  def strike?
    @rolls[0] == 10
  end

  def spare?
    @rolls.length == 2 && rolls.sum == 10
  end

  def complete?
    p @rolls.length
    @rolls.length > 1
  end

  def not_final_frame?
    @frame_name == 'normal'
  end
end
