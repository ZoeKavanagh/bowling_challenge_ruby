class Frame
  attr_reader :rolls, :frame_type

  def initialize
    @rolls = []
    @frame_type = frame_type(rolls)
  end

  def add_roll(pins)
    @rolls << pins
  end

  def frame_type(rolls)
    if rolls[0] == 10
      @frame_type = 'strike'
    elsif rolls.sum == 10
      @frame_type = 'spare'
    else
      @frame_type = 'normal'
    end
  end

  def clear_rolls
    @rolls.clear
  end
end
