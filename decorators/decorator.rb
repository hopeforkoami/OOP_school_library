require_relative '../interface/nameable'
class Decorator < Nameable
  attr_accessor :nameable

  def initialize(params)
    super
    @nameable = params
  end

  def correct_name
    @nameable.correct_name
  end
end
