class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(rent_date, book, person)
    @date = rent_date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def to_json(*args)
    @book.rentals = nil
    @person.rentals = nil
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'date' => @date,
      'book' => @book,
      'person' => @person
    }.to_json(*args)
  end

  def from_json(data)
    @id = data['id']
    @date = data['date']
    @book = data['book']
    @person =  data['person']
  end
end
