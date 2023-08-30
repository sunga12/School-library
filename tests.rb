require './person'
require './decorator'
require './capitalize_decorator'
require './trimmer_decorator'
require './book'
require './rental'

# person = Person.new(22, 'maximilianus')
# p person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name

# book1 = book 1
# book2 = book 2
# rental = rental
# person = person

book1 = Book.new('Emery black', 'Jax')
book2 = Book.new('Harry Potter', 'JKRowling')

person_maria = Person.new(17, 'Maria')
person_john = Person.new(22, 'John')

Rental.new('2017-12-22', book1, person_maria)
Rental.new('2017-12-31', book1, person_maria)

p "book1 rentals #{book1.rentals.count}"
book1.rentals.map(&:date)
p "person john #{person_john.rentals.count}"
p "person maria #{person_maria.rentals.count}"
# person_maria.rentals.map { |rental| p rental.book.title}

Rental.new('2017-11-11', person_john, book2)
Rental.new('2017-10-10', person_maria, book2)

p "book2 rentals #{book2.rentals.count}"
book2.rentals.map(&:date)
p "person john #{person_john.rentals.count}"
# person_john.rentals.map { |rental| rental.book.author }
p "person maria #{person_maria.rentals.count}"
# person_maria.rentals.map { |rental| rental.book.author }
