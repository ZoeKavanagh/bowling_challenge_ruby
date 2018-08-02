class CalculateScore

  def initialize
    @total_score = 0
  end

  def calculation(frames)
    @frames = frames
    @frames.each_with_index { |frame, index| calculate_frame_score(frame, index) }
    @total_score
  end

private

  def calculate_frame_score(frame, frame_index)
      @total_score += frame.rolls.sum
      calculate_special_scores(frame, frame_index)
  end

  def calculate_special_scores(frame, frame_index)
    if @frames[frame_index + 1].nil? == false
      spare_score(frame, frame_index)
      strike_score(frame, frame_index)
    end
  end

  def spare_score(frame, frame_index)
    if frame.status == 'spare' || frame.status == 'strike'
      @total_score += @frames[frame_index + 1].rolls[0]
    end
  end

  def strike_score(frame, frame_index)
    if frame.status == 'strike'
      if @frames[frame_index + 1].rolls[1].nil? == false
        @total_score += @frames[frame_index + 1].rolls[1]
      elsif @frames[frame_index + 2].rolls[0].nil? == false
        @total_score += @frames[frame_index + 2].rolls[0]
      end
    end
  end
end
