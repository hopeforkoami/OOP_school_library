class App
  def initialize
    @books =[]
    @person =[]
    @rentals =[]
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
  def create_person
    person_option =''
    optionshash =['1','2']
    if optionshash.include?(person_option)
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
        Person.new()
      
      else
        puts"Error: option  has an invalid value (#{person_option})"
      end
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
end