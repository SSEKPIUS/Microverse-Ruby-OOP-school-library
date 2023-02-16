require_relative './rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    rent_book = Rental.new(date, self, person)
    @rentals.push(rent_book)
  end
end
