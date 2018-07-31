class Calculate_score
  attr_reader :frame, :frame_index, :rolls, :total_score

  def initialize
    @total_score = 0
  end

  def total_score(frames)
    @frames = frames
    if a_perfect_game?
      @total_score += 300
    else
      @frames.each_with_index { |frame, index| calculate_frame_score(frame, index) }
    end
    @total_score
  end

private

  def a_perfect_game?
    @frames.max == @frames.min && @frames[0].rolls[0] == 10
  end

  def calculate_frame_score(frame, frame_index)
      @total_score += frame.rolls.sum
      calculate_special_scores(frame, frame_index)
  end

  def calculate_special_scores(frame, frame_index)
    if @frames[frame_index + 1].nil?
      puts 'Game Finished'
    elsif frame.type == 'spare'
      @total_score += @frames[frame_index + 1].rolls[0]
    elsif frame.type == 'strike'
      @total_score += @frames[frame_index + 1].rolls.sum
    end
  end
end
