require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name, id = Random.rand(1..1000), parent_permission: true)
    super(age, name, id, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
