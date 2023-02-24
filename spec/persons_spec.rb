require_relative '../person'

describe Person do
  name = 'John'
  age = 21
  id = 212
  parent_permission = true
  it 'Should create an instance of the person class' do
    person = Person.new(age, id, name, parent_permission: parent_permission)
    expect(person).to be_instance_of Person
  end

  it 'correct_name method should be name' do
    name = 'John'
    age = 21
    id = 212
    parent_permission = true
    person = Person.new(age, id, name, parent_permission: parent_permission)
    expect(person.correct_name).to be person.name
  end

  it 'correct_name method should be name' do
    name = 'John'
    age = 21
    id = 212
    parent_permission = true
    person = Person.new(age, id, name, parent_permission: parent_permission)
    expect(person.of_age?).to be true
  end
end

describe CapitalizeDecorator do
  name = 'john'
  age = 21
  id = 212
  parent_permission = true
  before :all do
    @person = Person.new(age, id, name, parent_permission: parent_permission)
    @capitalize = CapitalizeDecorator.new(@person)
  end

  context 'Should capitalize class' do
    it('Should create an instance of the CapitalizeDecorator class') do
      expect(@capitalize).to be_instance_of CapitalizeDecorator
    end
    it('correct_name method should capitalize string') do
      expect(@capitalize.correct_name).to eq('John')
    end
  end
end

describe TrimmerDecorator do
  name = 'Pair programming'
  age = 21
  id = 212
  parent_permission = true
  before :all do
    @person = Person.new(age, id, name, parent_permission: parent_permission)
    @trim = TrimmerDecorator.new(@person)
  end

  context 'Should trim class' do
    it('correct_name method should reduce string if length is > 10') do
      expect(@trim.correct_name).to eq('Pair progr')
    end
    
    it('Should create an instance of the TrimmerDecorator class') do
      expect(@trim).to be_instance_of TrimmerDecorator
    end
  end
end
