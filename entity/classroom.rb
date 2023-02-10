class Classroom
  attr_reader :students
  attr_accessor :label

  def initialize(class_label)
    @label = class_label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
