require_relative './app'

# rubocop:disable Metrics
class MainLoop
  app = App.new

  def options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'     
  end

  def run(option)
    loop do
      case option
      when '1'
        app.list_books
      when '2'
        app.list_people
      when '3'
        app.create_person
      when '4'
        app.create_book
      when '5'
        app.create_rental
      when '6'
        app.list_rentals
      when '7'
        puts 'See you again'
        break
      else
        puts 'Invalid! Please enter a number from 1 to 7'
      return
      end
      rescue LocalJumpError
      puts 'Invalid input'
      break
      end
end









# rubocop:enable Metrics
app = Main.new
app
