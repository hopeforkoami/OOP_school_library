require"decorator"
class CapitalizeDecorator < Decorator
  def initialize(param)
    super(param)
  end

  def correct_name
    @nameable.correct_name.upcase
  end
end