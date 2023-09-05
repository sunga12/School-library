# How do you load data?

#   look for the File
#   read the file: json = File.read("user.txt")

#   if json = '["foo", 1, 1.0, 2.0e2, true, false, null]'
#     then ruby = JSON.parse(json)
#          ruby # => ["foo", 1, 1.0, 200.0, true, false, nil]
#          then set the appropriate array to the saved data eg @people = ruby

# 1. Creat empty earray
# 1b. CHeck if file exists, return empty array if doesnt
# 2. open/read the File
# 3. parse the data
# 4. data.each {push book into empty array}
# 5. close the file if opened
# 6. return populated array

require 'json'
require './student'
require './teacher'
   
class LoadData
  def load_books
    books = []
    return books unless File.exist?('./data/books.json')

    json = File.read('./data/books.json')
    data = JSON.parse(json)

    data.each do |item| 
    books << Book.new(item['title'], item['author']) 
    end
    books
  end

  def load_people
    people = []
    return people unless File.exist?('./data/people.json')

    json = File.read('./data/people.json')
    data = JSON.parse(json)

    data.each do |item| 
      if item['type'] == 'Student'
        student = Student.new(item['age'], item['name'])
        # student.classroom = item['classroom']
        student.parent_permission = item['has_permission']
        student.id = item['id']
        people << student
      else 
        teacher = Teacher.new(item['age'], item['name'], item['specialization'])
        teacher.id = item['id']
        people << teacher
      end
    end
    people
  end

  def load_rentals
    rentals = []
    return rentals unless File.exist?('./data/rentals.json')

    json = File.read('./data/rentals.json')
    data = JSON.parse(json)

    data.each do |item|
    rental = make_rental(item)
    rentals << rental
    end
    rentals
  end

  def make_rental(rental)
    if rental['type'] == 'Student'
      student = Student.new(rental['age'], rental['name'])
      student.parent_permission = rental['has_permission']
      student.id = rental['id']
      book = Book.new(rental['title'], rental['author']) 
      rental = Rental.new(rental['date'], student, book)
    else
      teacher = Teacher.new(rental['age'], rental['name'], rental['specialization'])
      teacher.id = rental['id']
      book = Book.new(rental['title'], rental['author']) 
      rental = Rental.new(rental['date'], teacher, book)
    end
  end
end
