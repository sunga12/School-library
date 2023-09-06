require './student'
require './teacher'
require './book'
require './rental'
require './save_data'
require './load_data'

class App
  def initialize
    @books = LoadData.new.load_books
    @people = LoadData.new.load_people
    @rentals_list = LoadData.new.load_rentals
  end

  def list_books
    if @books == []
      puts 'No books yet, add one first'
    else
      puts 'Heres the list of all our Books:'
      @books.map { |book| puts "#{book.title} by #{book.author}" }
    end
  end

  def list_people
    if @people == []
      puts 'No people yet, add one first'
    else
      puts 'Heres the list of all our People:'
      @people.map { |person| puts person.name }
    end
  end

  def create_person
    puts "Let's Create a Person. For Student, type 1. For Teacher, type 2"
    person_type = gets.chomp.to_i
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'pending'
    end
  end

  def create_student
    puts 'Enter a Name, then their Age'
    name = gets.chomp
    age = gets.chomp.to_i
    new_student = Student.new(age, name)
    print 'Do they have Parent permission? (y/n)'
    permission = gets.chomp
    while permission != 'y' && permission != 'n'
      print 'Do they have Parent permission? (y/n)'
      permission = gets.chomp
      if permission == 'n'
        new_student.parent_permission = false
      elsif permission == 'y'
        new_student.parent_permission = true
      end
    end
    puts "Student Created Successfully: Name: #{new_student.name}, Age: #{new_student.age}"
    @people << new_student
  end

  def create_teacher
    puts 'Enter a Name, then their Age'
    name = gets.chomp
    age = gets.chomp.to_i
    puts 'What is their specialization?'
    spec = gets.chomp.to_s
    new_teacher = Teacher.new(age, name, spec)
    puts "Teacher created Successfully: Name: #{new_teacher.name}, Age: #{new_teacher.age}"
    @people << new_teacher
  end

  def create_book
    puts 'What is the Title?'
    title = gets.chomp
    puts 'Whos is the author?'
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
      puts 'Select a book from the following list by number'
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
      book_index = gets.chomp.to_i

      book_index = gets.chomp.to_i while book_index > @books.length - 1

      puts 'Select a person from the following list by number (not ID)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      person_index = gets.chomp.to_i

      person_index = gets.chomp.to_i while person_index > @people.length - 1

      puts 'Choose a date to rent (yyyy/mm/dd)'
      rental_date = gets.chomp
      new_rental = Rental.new(rental_date, @people[person_index], @books[book_index])
      puts "Rental created Successfully, on #{rental_date}, #{@people[person_index].name}, #{@books[book_index].title}"
      @rentals_list << new_rental

    end
  end

  def list_rentals_for_given_id
    if @rentals_list == []
      puts 'No rentals yet, add one first'
    else
      puts "What is the Person's ID?"
      @people.map { |person, _index| puts "Name: #{person.name}, ID: #{person.id}" }
      rental_id = gets.chomp.to_i

      puts "Heres the list of all our rentals for a person: #{rental_id}"

      @rentals_list.each do |rental|
        if rental.person.id == rental_id
          puts "Book: #{rental.book.title} by #{rental.book.author}, was Rented on #{rental.date}"
        end
      end

    end
  end

  def exit_library
    SaveData.new.save_books(@books) unless @books == []
    SaveData.new.save_people(@people) unless @people == []
    SaveData.new.save_rentals(@rentals_list) unless @rentals_list == []
    puts 'Thank you and goodbye'
  end
end
