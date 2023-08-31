require "./student.rb"
require "./teacher.rb"
require "./book.rb"
require "./rental.rb"

class App
  def initialize
    @books = []
    @people = []
    @rentals_list = []
  end
  
  def list_books
    if @books == []
      puts "No books yet, add one first"
    else
      puts "Heres the list of all our Books:"
      @books.map do |book| puts "#{book.title} by #{book.author}" end
    end
  end

  def list_people
    if @people == []
      puts "No people yet, add one first"
    else
      puts "Heres the list of all our People:"
      @people.map do |person| puts person.name end
    end
  end

  def create_person
    puts "Let's Create a Person"
    puts "For Student, type 1. For Teacher, type 2"
    person_type = gets.chomp.to_i

    case person_type
    when 1
      puts "Name?" 
      name = gets.chomp
      puts "Age?"
      age = gets.chomp.to_i
      new_student = Student.new(age, name)
      print "Do they have Parent permission? (y/n)"
      permission = gets.chomp

      while permission != "y" && permission != "n"
        print "Do they have Parent permission? (y/n)"
        permission = gets.chomp

        if permission == "n"
          new_student.parent_permission = false
        elsif permission =="y"
          new_student.parent_permission = true
        end
      end

      puts "Student Created Successfully: Name: #{new_student.name}, Age: #{new_student.age}, Permission: #{new_student.parent_permission}"
      @people << new_student
    when 2
      puts "Name?" 
      name = gets.chomp
      puts "Age?"
      age = gets.chomp.to_i
      puts "What is their specialization?"
      spec = gets.chomp.to_s
      new_teacher = Teacher.new(age, name, spec)
      puts "Teacher created Successfully: Name: #{new_teacher.name}, Age: #{new_teacher.age}, Specialization: #{new_teacher.specialization}"
      @people << new_teacher
    else
      puts "pending"
    end
  end

  def create_book
    puts "What is the Title?"
    title = gets.chomp
    puts "Whos is the author?"
    author = gets.chomp
    new_book = Book.new(title, author)
    puts "Book created Successfully: Title: #{new_book.title}, Author: #{new_book.author}"
    @books << new_book
  end

  def create_rental
    puts "Let's Create a Rental"
    if @books == [] || @people == []
      puts "Can't create rentals yet, Make sure both books and people exist first"
    else
      puts "Select a book from the following list by number"
      @books.each_with_index do |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" end
      book_index = gets.chomp.to_i

      while book_index > @books.length-1
        book_index = gets.chomp.to_i
      end

      puts "Select a person from the following list by number (not ID)"
      @people.each_with_index do |person, index| puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" end
      person_index = gets.chomp.to_i

      while person_index > @people.length-1
        person_index = gets.chomp.to_i
      end

      puts "Choose a date to rent (yyyy/mm/dd)"
      rental_date = gets.chomp
      new_rental = Rental.new(rental_date, @people[person_index], @books[book_index])
      puts "Rental created Successfully, Date: #{rental_date}, Person: #{@people[person_index].name}, Book: #{@books[book_index].title}"
      @rentals_list << new_rental

    end

  end

  def list_rentals_for_given_id
    if @rentals_list == []
      puts "No rentals yet, add one first"
    else
      puts "What is the Person's ID?"
      @people.map do |person, index| puts "Name: #{person.name}, ID: #{person.id}" end
      rental_id = gets.chomp.to_i

      puts "Heres the list of all our rentals for a person: #{rental_id}"

        @rentals_list.each do |rental|
          puts "Book: #{rental.book.title} by #{rental.book.author}, was Rented on #{rental.date}" if rental.person.id == rental_id
        end

    end
  end

  def exit_library
    puts "Thank you and goodbye"
  end
end