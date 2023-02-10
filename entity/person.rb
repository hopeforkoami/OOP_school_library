require './interface/nameable'
class Person < Nameable
  attr_reader :id 
  attr_accessor :name, :age ,:rentals

  def initialize(age, name, parent_permission: true)
    super
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age > 18
  end

  public

  def can_use_services?
    of_age? || @permission
  end
end
