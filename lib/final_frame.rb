class FinalFrame < Frame

  def initilaize
    @rolls = []
  end

  def complete?
    return @rolls.length > 3 if strike? || spare?
    @rolls.length > 1
  end
end
