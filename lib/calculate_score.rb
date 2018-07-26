class Calculate_score

  def initialize
    @frame = []
    @total_score = 0
  end

  def total_score(frames)
    @frames = frames
    @frames.each_with_index { |frame, index| calculate_frame_score(frame, index) }
    @total_score
  end

  private

  def calculate_frame_score(frame, frame_index)
    @total_score += frame.rolls.sum
    calculate_extra_score(frame, frame_index)
  end

  def calculate_extra_score(frame, frame_index)
    if frame.type == 'spare'
      @total_score += @frames[frame_index + 1].rolls[0]
    end
  end

end
