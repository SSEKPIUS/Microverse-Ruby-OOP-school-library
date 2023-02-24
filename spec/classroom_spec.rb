require_relative '../classroom'
require_relative '../student'

describe Classroom do
  it 'Should create an instance of Classroom class' do
    classroom = Classroom.new('Physics')
    expect(classroom).to be_instance_of Classroom
  end

  it 'add_student method should add student' do
    name = 'John'
    age = 21
    id = 212
    parent_permission = true
    classroom = Classroom.new('Physics')
    student = Student.new(age, id, name, parent_permission: parent_permission)
    new_student = classroom.add_student(student)
    expect(new_student.students.length).to be 1
  end
end
