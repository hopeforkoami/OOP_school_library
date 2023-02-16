require './entity/rental'
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'author' => @author,
      'rentals' => @rentals
    }.to_json(*args)
  end
  def from_json(data)
    
    @id = data['id']
    @title = data['title']
    @author = data['author']
    @rentals =  data['rentals']
  end

  
end
