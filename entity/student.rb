require './person'

class Student < Person
  attr_reader :classroom

  def initialize(class_room, age, name: 'Unknown', permission: true)
    super(age, name: name, parent_permission: permission)
    @classroom = class_room
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom = (class_room)
    @classroom = class_room
    class_room.students.push(self) unless class_room.students.include?(self) 
  end

end
