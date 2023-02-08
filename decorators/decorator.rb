require_relative '../interface/nameable'
class Decorator < Nameable
  def initialize(params)
    super
    @nameable = params
  end

  def correct_name
    @nameable.correct_name
  end
end
