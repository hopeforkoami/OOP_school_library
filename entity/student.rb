require_relative './person'
require 'rubygems'
require 'json'

class Student < Person
  attr_reader :classroom

  def initialize(class_room, age, name, permission)
    super(age, name, permission)
    @classroom = class_room
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(class_room)
    @classroom = class_room
    class_room.students.push(self) unless class_room.students.include?(self)
  end

  def display_person
    "[Student]  Name: #{@name} , ID: #{@id.to_i}  , age: #{@age}  "
  end
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'classroom' => @classroom,
      'age' => @age,
      'name' => @name,
      'permission' => @parent_permission == nil ? true : @persmission
    }.to_json(*args)
  end
  def from_json(data)
    
    @id = data['id']
    @classroom = data['classroom']
    @age = data['age']
    @name =  data['name']
    @persmission =  data['permission']
  end
end
