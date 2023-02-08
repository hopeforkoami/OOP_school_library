class TrimmerDecorator
  def initialize(param)
    super(param)
  end

  def correct_name
    @nameable.correct_name[0,9]
  end
end