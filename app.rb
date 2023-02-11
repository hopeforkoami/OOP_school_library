require'./entity/student'
require'./entity/teacher'
require'./entity/classroom'
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
  def run
    retour = 0
    until retour=='7' do
      retour = display_main_menu()
      case retour  
      when '3'
          create_person
          
      else
        puts"Error: capacity has an invalid value (#{retour})"
        puts retour.class
      end
    end
    puts'Progam exit '
  end
  def testing
    create_person
    create_person
    list_persons
  end
end