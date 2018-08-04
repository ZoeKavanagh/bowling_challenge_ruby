class FinalFrame < Frame

  NUMBER_OF_ROLLS = 2

  def complete?
    return @rolls.length > NUMBER_OF_ROLLS if strike? || final_spare?
    @rolls.length == NUMBER_OF_ROLLS
  end

  def final?
    true
  end

  private

  def final_spare?
    if @rolls.length >= NUMBER_OF_ROLLS
      rolls_sum = (@rolls.inject(0, :+))
      rolls_sum >= 10
    end
  end
end
