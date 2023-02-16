require './app'
require './entity/student'
require './entity/book'
require './entity/teacher'
require './entity/classroom'
require './entity/rental'

def main
  app = App.new
  app.load_data
  retour = 0
  until retour == '7'
    retour = app.display_main_menu
    if retour == '7'
      app.save_data
      puts 'Exiting the program'
    else
      app.action_controller(retour)
    end

  end
  puts 'Progam exit '
end
def test
  
  app = App.new
  persons =[
    Student.new('TleC4',14,'kokou',true),
    Teacher.new('English','Mr Komla',40),
    Student.new('TleC4',15,'erik',false),
    Teacher.new('Maths','Bt Jerome',50),
    Student.new('TleC4',20,'james',true),
    ]
  app.load_data
  #puts app.persons[1].display_person
  app.show_persons  
  
end
  
def test_books
  app = App.new
  books = [
    Book.new('book1','author1'),
    Book.new('book2','author2'),
    Book.new('book3','author3'),
    Book.new('book4','author4'),
    Book.new('book5','author5'),
    Book.new('book6','author6')
  ]
  app.load_book
  app.list_books
end
test_books
