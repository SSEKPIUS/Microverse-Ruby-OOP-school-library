require_relative '../rental'
require_relative '../book'
require_relative '../person'
require 'date'

describe Rental do
  name = 'John'
  age = 21
  id = 212
  parent_permission = true

  it 'Should create an instance of the Rental class' do
    date = Date.parse '2022/09/09'
    book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    person = Person.new(age, id, name, parent_permission: parent_permission)
    rental = Rental.new(date, book, person)
    expect(rental).to be_instance_of Rental
  end
end
