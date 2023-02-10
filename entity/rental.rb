class Rental
  attr_reader :book, :person
  attr_accessor :date
  def initialize(rent_date,book, person)
    @date = rent_date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end
end