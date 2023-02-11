require_relative './person'

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
end
