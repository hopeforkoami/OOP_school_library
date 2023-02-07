class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @permission = parent_permission
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
