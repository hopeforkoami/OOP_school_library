require './app'
require './entity/student'
require './entity/book'
require './entity/teacher'
require './entity/classroom'
require './entity/rental'

def main
  app = App.new
  retour = 0
  until retour == '7'
    retour = app.display_main_menu
    if retour == '7'
      puts 'Exiting the program'
    else
      app.action_controller(retour)
    end

  end
  puts 'Progam exit '
end

main
