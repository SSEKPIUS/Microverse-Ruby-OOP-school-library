require_relative '../student'
require_relative '../classroom'

describe Student do
  name = 'John'
  age = 21
  id = 212
  parent_permission = true
  it 'Should create an instance of Student class' do
    student = Student.new(age, id, name, parent_permission: parent_permission)
    expect(student).to be_instance_of Student
  end

  it 'Play hooky method should return correnct string' do
    student = Student.new(age, id, name, parent_permission: parent_permission)
    expect(student.play_hooky).to eq '¯\(ツ)/¯'
  end
end
