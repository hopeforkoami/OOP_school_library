class Classroom
  attr_reader :Students
  attr_accessor :label
  def initialize(class_label)
    @label = class_label
    @Students =[]
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end