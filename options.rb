require './app'

def list
  puts 'What do you want to do today? Choose a number:'
  options_list = "
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a give Person ID
  7 - Exit\n"
  print options_list
end

def display_options
  app = App.new

  loop do
    print "Welcome to The School Library\n\n"
    list
    puts 'Choose an Option'
    choice = gets.chomp.to_i
    process_choice(choice, app)
    return true if choice == 7
  end
end

# rubocop:disable Metrics
def process_choice(choice, app)
  case choice
  when 1 then app.list_books
  when 2 then app.list_people
  when 3 then app.create_person
  when 4 then app.create_book
  when 5 then app.create_rental
  when 6 then app.list_rentals_for_given_id
  when 7 then app.exit_library
  else
    puts 'Invalid choice, Choose another option'
  end
end
# rubocop:enable Metrics
