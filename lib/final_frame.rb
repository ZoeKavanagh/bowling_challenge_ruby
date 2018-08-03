class FinalFrame < Frame

  NUMBER_OF_ROLLS = 2

  def initilaize
    @rolls = []
  end

  def complete?
    return @rolls.length > NUMBER_OF_ROLLS if strike? || spare?
    @rolls.length == NUMBER_OF_ROLLS
  end

  def final?
    true
  end
end
