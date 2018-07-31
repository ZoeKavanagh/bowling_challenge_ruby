class Frame

  def initialize
    @rolls = []
  end

  def add_roll_one(pins)
    @rolls << pins
  end

  def add_roll_two(pins, frames)
    @rolls << pins
    @frames << @rolls
  end

  def frame_type(rolls)
    if rolls[0] == 10
      frame_type = 'strike'
    elsif rolls.sum == 10
      frame_type = 'spare'
    else
      frame_type = 'normal'
    end
  end
end
