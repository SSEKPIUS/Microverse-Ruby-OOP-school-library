require_relative './app'

class MainLoop
  def initialize()
    @app = App.new
  end

  def options
    'Please choose an option by entering a number:
    1 - List of all books
    2 - List of all people
    3 - Add a person
    4 - Create a book
    5 - Add a rental
    6 - List of all rental for given id
    7 - Exit'
  end

  def choice(option)
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

  def run(option)
    loop do
      choice(option)
      options
      option = gets.chomp
    end
  end
end
