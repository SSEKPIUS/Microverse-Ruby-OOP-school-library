require_relative './student'
require_relative './book'
require_relative './rental'
require_relative './teacher'
require_relative './classroom'
require 'date'
require 'json'
require_relative './hasher'

class App
  def initialize
    @hasher = Hasher.new
    @rentals = @hasher.recover_data('rentals')
    @students = @hasher.recover_data('students')
    @teachers = @hasher.recover_data('teachers')
    @books = @hasher.recover_data('books')
    @class = Classroom.new('Grade 5')
  end

  def save
    @hasher.save_data('students', @students)
    @hasher.save_data('teachers', @teachers)
    @hasher.save_data('books', @books)
    @hasher.save_data('rentals', @rentals)
  end

  def list_books
    puts 'No books added!' if @books.empty?
    @books.each { |book| puts "#{book['title']} by #{book['author']}" }
    puts ''
  end

  def list_students
    puts 'No person added!' if @students.empty?
    @students.map do |student|
      puts "Name: #{student['name']}, Age: #{student['age']}, Permission: #{student['parent_permission']}"
    end
    puts ''
  end

  def list_teachers
    puts 'No person added!' if @teachers.empty?
    @teachers.map do |teacher|
      puts "Name: #{teacher['name']}, Age: #{teacher['age']}, Specialization: #{teacher['specialization']}"
    end
  end

  def list_people
    puts 'Students'
    list_students
    puts 'Teachers'
    list_teachers
    puts ''
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

    print 'Parent permission [y/n]:'
    permission = gets.chomp

    @students.push({ name: name, age: age, parent_permission: permission })

    puts "Student #{name.upcase} created successfully"
  end

  def create_teacher
    print 'Enter age: '
    age = gets.chomp.to_i

    print 'Enter your name: '
    name = gets.chomp

    print 'Enter specialization: '
    specialization = gets.chomp

    @teachers.push({ name: name, age: age, specialization: specialization })

    puts "Teacher #{name.upcase} created successfully"
  end

  def create_book
    print 'Enter book title: '
    title = gets.chomp

    print 'Enter book author: '
    author = gets.chomp

    @books.push({ title: title, author: author })

    puts "#{title} by #{author} created successfully"
  end

  def insert_into_rentals(date, book_id)
    person_id = gets.chomp.to_i
    if (0..@students.length - 1).include?(person_id)
      new_rental = Rental.new(date, @books[book_id], @students[person_id])
      @rentals.push({ date: new_rental.date, book: new_rental.book['title'], person: new_rental.person6['name'] })
      puts 'rental created successfully'
    else
      puts 'Invalid person id'
    end
  end

  def create_rental
    if @books.empty?
      puts 'There are no books or people'
      return
    end
    puts 'Date of book rental: '
    date = gets.chomp.to_s
    puts 'Please select the id of the book from the list of books'
    @books.each_with_index { |book, index| puts "#{index}. #{book['title']} by #{book['author']}" }
    book_id = gets.chomp.to_i
    if (0..@books.length - 1).include?(book_id)
      puts 'Please select person id from list of people'
      @students.each_with_index { |student, index| puts "#{index}. #{student['name']}" }
      insert_into_rentals(date, book_id)
    else
      puts 'Invalid! No book with that id'
    end
  end

  def list_rentals
    if @rentals.empty?
      puts 'No data for people found.'
      return
    end
    puts 'Books rentals:'
    @rentals.each do |rented|
      puts "#{rented['person']} rented #{rented['book']} on #{rented['date']}"
      puts ''
    end
  end
end
