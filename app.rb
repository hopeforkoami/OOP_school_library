require './entity/student'
require './entity/teacher'
require './entity/classroom'
require './entity/book'
require './entity/rental'
class App
  attr_accessor :books, :persons, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
    @default_class = Classroom.new('Tle C4')
  end

  def display_main_menu
    puts 'Welcome to School Library App!'
    puts ''
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all the rentals for a given person id'
    puts '7 - Exit'
    gets.chomp
  end

  def list_persons
    @persons.each { |person| puts person.display_person }
  end

  def create_book
    print 'Title : '
    title = gets.chomp
    print 'Author : '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
    puts ''
    puts ''
  end

  def list_books
    cpt = 0
    @books.each do |book|
      puts cpt.to_s.concat ')  Title: "'.concat(book.title).concat('" , Author: ').concat(book.author)
      cpt += 1
    end
  end

  def show_persons
    cpt = 0
    @persons.each do |person|
      puts "#{cpt}) -  #{person.display_person}"
      cpt += 1
    end
  end

  def create_teacher
    print 'Age : '
    aget = gets.chomp
    print 'Name : '
    namet = gets.chomp
    print 'Specialization : '
    specializationt = gets.chomp
    tperson = Teacher.new(specializationt, aget, namet)
    @persons.push(tperson)
    puts 'Person created successfully'
    puts ''
    puts ''
  end

  def create_student
    print 'Age : '
    age = gets.chomp
    print 'Name : '
    name = gets.chomp
    print 'Has parent permission? [Y/N] : '
    permission = gets.chomp
    aperson = if permission.upcase == 'Y'
                Student.new(@default_class, age, name, true)
              else
                Student.new(@default_class, age, name, false)
              end
    @persons.push(aperson)
    puts 'Person created successfully'
    puts ''
    puts ''
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher(2)?[input the number]: '
    person_option = gets.chomp
    case person_option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts "Error: option  has an invalid value (#{person_option})"
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_id = gets.chomp.to_i
    puts ''
    puts 'Select a person from the following list by number(not id)'
    show_persons
    person_id = gets.chomp.to_i
    print 'Date: '
    dat = gets.chomp
    @rentals.push(dat, @books[book_id], @persons[person_id])
    puts ''
    puts 'Rental created successfully'
  end

  def list_rentals_of(id)
    @persons.each do |person|
      person.display_self_rentals if person.id == id
    end
  end

  def action_controller(retour)
    case retour
    when '1'
      list_books
    when '2'
      list_persons
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      print 'ID of person : '
      pers_id = gets.chomp.to_i
      list_rentals_of(pers_id)
    else
      puts "Error: menu option has an invalid value (#{retour})"
    end
  end
end
