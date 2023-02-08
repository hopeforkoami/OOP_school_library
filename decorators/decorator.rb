require"./interface/nameable"
class Decorator < Nameable
  def initialize(params)
    @nameable = params
  end

  def correct_name 
    @nameable.correct_name
  end
end