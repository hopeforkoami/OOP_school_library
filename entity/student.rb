require "./person"

class Student < Person
  attr_accessor :classroom
  def initialize(class_room, age, name: "Unknown", permission: true)
    super(age, name: name, parent_permission: permission)
    @classroom = class_room
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end