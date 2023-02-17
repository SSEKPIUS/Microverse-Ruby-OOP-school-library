require_relative './student'
require_relative './book'
require_relative './rental'
require_relative './teacher'
require_relative './classroom'

# rubocop:disable Metrics
class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @class = Classroom.new('Grade 5')
  end

  def run
    puts 'Welcome to School Library App!'
    puts
    select
  end

  def select
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option = gets.chomp
    run_choice option
  end

  def run_choice(input)
    case input
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    when '7'
      puts 'See you again'
    else
      puts 'Invalid! Please enter a number from 1 to 7'
      select
    end
  end

  def list_books
    puts 'No books added!' if @books.empty?

    @books.each { |book| puts "Title: #{book.title}, author: #{book.author}" }
    puts ''
    select
  end

  def list_people
    puts 'No person added!' if @people.empty?

    @people.map { |person| puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
    puts ''
    select
  end

  def create_person
    print 'Select (1) to create Student and (2) to create Teacher: '
    choice = gets.chomp
    case choice
    when '1'
      create_student
    when '2'
      create_teacher
    else
      print 'Invalid input! Please select either 1  or 2: '
    end
  end

  def create_student
    print 'Enter age: '
    age = gets.chomp.to_i

    print 'Enter your name: '
    name = gets.chomp

    new_student = Student.new(@classroom, age, name)
    @people.push(new_student)

    puts "Student #{name.upcase} created successfully"

    select
  end

  def create_teacher
    print 'Enter age: '
    age = gets.chomp.to_i

    print 'Enter your name: '
    name = gets.chomp

    print 'Enter specialization: '
    specialization = gets.chomp

    new_teacher = Teacher.new(specialization, age, name)
    @people.push(new_teacher)

    puts "Teacher #{name.upcase} created successfully"

    select
  end

  def create_book
    print 'Enter book title: '
    title = gets.chomp

    print 'Enter book author: '
    author = gets.chomp

    new_book = Book.new(title, author)
    @books.push(new_book)

    puts "#{title} by #{author} created successfully"
    select
  end

  def create_rental
    print 'Date of book rental: '
    date = gets.chomp.to_i

    puts 'Please select the id of the book from the list of books'
    @books.each_with_index { |book, index| puts "#{index}. #{book.title} by #{book.author}" }

    book_id = gets.chomp.to_i
    if (0..@books.length).include?(book_id)
      puts 'Please select person id from list of people'
      @people.each_with_index { |person, index| puts "#{index}. #{person.name}" }
      person_id = gets.chomp.to_i
      new_rental = Rental.new(date, @books[book_id], @people[person_id])
      @rentals.push(new_rental)

      puts 'Rental created successfully'

      select

    else
      print 'Invalid! Please select a valid book id: '
    end
  end

  def list_rentals
    if @rentals.empty?
      puts 'No data for people found.'
      select
    end

    print 'Enter person ID: '
    person_id = gets.chomp.to_i
    puts 'Books rentals:'
    @rentals.each do |rented|
      puts "Date: #{rented.date}, Book #{rented.book} by #{rented.person}" if rented.person.id == person_id
    end

    select
  end
end

def main
  app = App.new
  app.run
end
# rubocop:enable Metrics
main
