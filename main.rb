# main.rb

require_relative 'app'

def main_menu
  puts '------------------------'
  puts 'Welcome to the Library!'
  puts '------------------------'
  puts 'Please choose an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Quit'
  print 'Enter your choice: '
  gets.chomp.to_i
end

# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
def main
  app = App.new

  loop do
    choice = main_menu

    case choice
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      create_person(app)
    when 4
      create_book(app)
    when 5
      create_rental(app)
    when 6
      list_rentals(app)
    when 7
      puts 'Goodbye!'
      break
    else
      puts 'Invalid choice. Please try again.'
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength

# Call the main method to start the app
main
