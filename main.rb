require_relative './app'
require_relative './rental'
require 'json'

@app = App.new

def options
  puts 'Please choose an option by entering a number:
  1 - List of all books
  2 - List of all people
  3 - Add a person
  4 - Create a book
  5 - Add a rental
  6 - List of all rental for given id
  7 - Exit'
end

def choice()
  option = gets.chomp
  case option
  when '1'
    @app.list_books
  when '2'
    @app.list_people
  when '3'
    @app.create_person
  when '4'
    @app.create_book
  when '5'
    @app.create_rental
  when '6'
    @app.list_rentals
  else
    puts 'See you again'
    exit
  end
end

def run()
  loop do
    options
    choice
  end
end

puts 'Welcome to School Library App!\n'
run
