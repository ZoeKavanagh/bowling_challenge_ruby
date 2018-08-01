class Calculate_score

  def initialize
    @total_score = 0
  end

  def score_calc(frames)
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
    if @frames[frame_index + 1].nil?
      return 'Game Finished'
    elsif frame.type == 'spare'
      @total_score += @frames[frame_index + 1].rolls[0]
    elsif frame.type == 'strike'
      @total_score += @frames[frame_index + 1].rolls.sum
    end
  end
end
