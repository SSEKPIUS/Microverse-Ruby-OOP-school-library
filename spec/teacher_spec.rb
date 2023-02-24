require_relative '../teacher'

describe Teacher do
  name = 'John'
  age = 21
  id = 212
  parent_permission = true

  it 'Should create an instance of Teacher class' do
    student = Teacher.new(age, id, name, parent_permission: parent_permission)
    expect(student).to be_instance_of Teacher
  end

  it 'Should create an instance of Teacher class' do
    student = Teacher.new(age, id, name, parent_permission: parent_permission)
    expect(student.can_use_services?).to be true
  end
end
