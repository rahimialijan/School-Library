require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(name: 'Unknown', age: 0, classroom: nil)
    super(name, age, parent_permission: true)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
