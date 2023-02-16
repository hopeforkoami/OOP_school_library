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

  def to_json
    return JSON.generate({
      :id => @id,
      :specialization => @specialization,
      :age => @age,
      :name => @name

    })
  end
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'specialization' => @specialization,
      'age' => @age,
      'name' => @name
    }.to_json(*args)
  end

  def from_json(string)
    data = JSON.load string
    @id = data['id']
    @specialization = data['specialization']
    @age = data['age']
    @name =  data['name']
  end

end
