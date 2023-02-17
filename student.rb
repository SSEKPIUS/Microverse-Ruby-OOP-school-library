require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'Unknown', id = Random.rand(1..1000), parent_permission: true)
    super(age, id, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
