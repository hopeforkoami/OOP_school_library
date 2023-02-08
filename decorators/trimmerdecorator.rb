require_relative './decorator'
class TrimmerDecorator < Decorator
  def initialize(param)
    super(param)
  end

  def correct_name
    @nameable.correct_name[0,10]
  end
end