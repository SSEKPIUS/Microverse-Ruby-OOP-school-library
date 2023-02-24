require_relative '../book'
require_relative '../person'
require 'date'

describe Book do
  it 'Should create an instance of the Book class' do
    book = Book.new('The Alchemist', 'Paulo Coelho')
    expect(book).to be_instance_of Book
  end

  it 'Should create a rental' do
    book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    date = Date.parse '2022/07/10'
    person = Person.new(24, 332, 'James', parent_permission: true)
    book.add_rental(date, person)
    expect(book.rentals.length).to be 0
  end

  it 'Should have a title and author' do
    book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    expect(book.title).to eq('The Great Gatsby')
    expect(book.author).to eq('F. Scott Fitzgerald')
  end
end
