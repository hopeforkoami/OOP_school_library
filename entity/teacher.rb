require_relative './person'
require 'rubygems'
require 'json'

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
  def export_to_json
    self.to_json
  end
  def initialize_from_json(string)
    data = JSON.load string
    @id = data['id']
    @specialization = data['specialization']
    @age = data['age']
    @name =  data['name']
  end



end
