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
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    puts
  end

  def list_people
    puts 'List of People:'
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
    puts
  end

  def create_person(name, age, type, specialization = nil)
    if type == 'teacher'
      person = Teacher.new(specialization, name, age)
    elsif type == 'student'
      person = Student.new(name, age)
    else
      puts 'Invalid person type.'
      return
    end

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
    if book.nil?
      puts "Book with title '#{title}' not found."
      return
    end

    puts 'Enter the person ID for the rental:'
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts "Person with ID #{person_id} not found."
      return
    end

    rental = Rental.new(date, book, person)
    @rentals << rental

    puts "Rental of '#{book.title}' by #{book.author} to #{person.correct_name} on #{rental.date} has been created."
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |p| p.id == person_id }

    if person.nil?
      puts 'Person not found.'
      return
    end

    puts "Rentals for #{person.name}:"
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}, Author: #{rental.book.author}"
    end
    puts
  end
end
