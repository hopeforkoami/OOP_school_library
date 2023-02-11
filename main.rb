require './app'
def main
  app = App.new
  retour = 0
  until retour=='7' do
    retour = display_main_menu()
    case retour  
    when '1'
        app.list_books
    when '2'
      app.list_persons
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      print'ID of person : '
      pers_id = gets.chomp
      app.list_rentals_of(pers_id)
    when '7'
      puts'Exiting the App'    
    else
      puts"Error: menu option has an invalid value (#{retour})"
    end
  end
  puts'Progam exit '
  
end

main
