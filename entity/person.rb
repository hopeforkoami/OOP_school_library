require './interface/nameable'
require './entity/rental'
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def display_self_rentals
    puts 'Rentals'
    @rentals = @rentals.nil? ? [] : @rentals
    if @rentals.length>0
      @rentals.each do |rental|
        puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end

  private

  def of_age?
    @age > 18
  end

  public

  def can_use_services?
    of_age? || @permission
  end
end
