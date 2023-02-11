require'./entity/student'
require'./entity/teacher'
require'./entity/classroom'
require'./entity/book'
require'./entity/rental'
class App
  def initialize
    @books =[]
    @persons =[]
    @rentals =[]
    @default_class = Classroom.new('Tle C4')
  end
  def display_main_menu
    puts'Welcome to School Library App!\n\n'
    puts'Please choose an option by enterin a number:'
    puts'1 - List all books'
    puts'2 - List all people'
    puts'3 - Create a person'
    puts'4 - Create a book'
    puts'5 - Create a rental'
    puts'6 - List all the rentals for a given person id'
    puts'7 - Exit'
    return gets.chomp
  end
  def list_persons
    @persons.each { |person| puts person.display_person }
  end
  def create_book
    print'Title : '
    title = gets.chomp
    print'Author : '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts'Book created successfully'
    puts''
    puts''
  end
  def list_books
    cpt = 0
    @books.each { |book|
      puts cpt.to_s.concat')  Title: "'.concat(book.title).concat('" , Author: ').concat(book.author)
      cpt = cpt + 1
    }
  end
  def create_person
    person_option =''
    optionshash =['1','2']
      print'Do you want to create a student(1) or a teacher(2)?[input the number]: '
      person_option = gets.chomp
      case person_option
      when '1'
        print'Age : '
        age = gets.chomp
        print'Name : '
        name = gets.chomp
        print'Has parent permission? [Y/N] : '
        permission = gets.chomp
        aperson = ''
        if(permission.upcase=='Y')
          aperson = Student.new(@default_class,age, name, true)
        else
          aperson = Student.new(@default_class,age, name, false)
        end
        @persons.push(aperson)
        puts'Person created successfully'
        puts''
        puts''
      when '2'
        print'Age : '
        aget = gets.chomp
        print'Name : '
        namet = gets.chomp
        print'Specialization : '
        specializationt = gets.chomp
        tperson = Teacher.new(specializationt, aget, namet)
        @persons.push(tperson)
        puts'Person created successfully'
        puts''
        puts''
      else
        puts"Error: option  has an invalid value (#{person_option})"
      end
  end

  def create_rental
    puts'Select a book from the following list by number'
    list_books
    book_id = gets.chomp
    puts''
    puts'Select a person from the following list by number(not id)'
    person_id = gets.chomp
    dat = Time.new
    @rentals.push(dat, @book[book_id], @persons[person_id])
    puts''
    puts'Date  '.concat(dat.strftime("%Y/%m/%d"))
    puts'Rental created successfully'

  end
  def list_rentals_of(id)
    pers = ''
    @persons.each { |person|
      if person.id == id
        person.display_self_rentals
      end
    }
  end

  def run
    retour = 0
    until retour=='7' do
      retour = display_main_menu()
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
        print'ID of person : '
        pers_id = gets.chomp
        list_rentals_of(pers_id)
      when '7'
        puts'Exiting the App'    
      else
        puts"Error: menu option has an invalid value (#{retour})"
        puts retour.class
      end
    end
    puts'Progam exit '
  end
end