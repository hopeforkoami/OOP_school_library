require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name)
    super(age, name, true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def display_person
    "[Teacher]  Name: #{@name} , ID: #{@id.to_i}  , age: #{@age}  , Specialization : #{@specialization}"
  end
end
