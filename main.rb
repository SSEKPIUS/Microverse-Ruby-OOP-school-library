require_relative './main_loop'

class Main
  puts 'Welcome to School Library App!'
  puts
  loop = MainLoop.new
  loop.options
  option = gets.chomp
  loop.run(option) if option != '7'
end
