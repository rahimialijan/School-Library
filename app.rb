# app.rb

require_relative 'classroom'
require_relative 'book'
require_relative 'nameable'
require_relative 'person'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'
require_relative 'decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    puts 'List of Books:'
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    puts
  end

  def list_people
    puts 'List of People:'
    @people.each { |person| puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
    puts
  end

  def create_person(name, age, type, specialization = nil)
    person = type == 'teacher' ? Teacher.new(specialization, name, age) : Student.new(name, age)
    @people << person
    puts "Person with ID #{person.id} was created."
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "Book '#{book.title}' by #{book.author} was created."
  end

  def create_rental
    puts 'Enter the rental date (yyyy-mm-dd):'
    date = gets.chomp
    puts 'Enter the book title for the rental:'
    title = gets.chomp

    book = @books.find { |b| b.title == title }
    return puts "Book with title '#{title}' not found." if book.nil?

    puts 'Enter the person ID for the rental:'
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }
    return puts "Person with ID #{person_id} not found." if person.nil?

    rental = Rental.new(date, book, person)
    @rentals << rental

    puts "Rental of '#{book.title}' by #{book.author} to #{person.correct_name} on #{rental.date} has been created."
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |p| p.id == person_id }

    if person.nil?
      puts 'Person not found.'
    else
      puts "Rentals for #{person.name}:"
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title}, Author: #{rental.book.author}"
      end
      puts
    end
  end
end

def create_person(app)
  print 'Enter name: '
  name = gets.chomp
  print 'Enter age: '
  age = gets.chomp.to_i
  print 'Enter person type (teacher or student): '
  type = gets.chomp.downcase
  if type == 'teacher'
    print 'Enter specialization: '
    specialization = gets.chomp
    app.create_person(name, age, type, specialization)
  elsif type == 'student'
    app.create_person(name, age, type)
  else
    puts 'Invalid person type.'
  end
end

def create_book(app)
  print 'Enter book title: '
  title = gets.chomp
  print 'Enter book author: '
  author = gets.chomp
  app.create_book(title, author)
end

def create_rental(app)
  app.create_rental
end

def list_rentals(app)
  print 'Enter person ID: '
  person_id = gets.chomp.to_i
  app.list_rentals_for_person(person_id)
end
