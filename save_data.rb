require 'json'

      class SaveData

          def save_books(books)
            books_array = []
            return books_array if books == []

            books.each { |book|
              book_obj = {
                title: book.title,
                author: book.author
              }
              books_array << book_obj
            }
          
            opts = {
              array_nl: "\n",
              object_nl: "\n",
              indent: '  ',
              space_before: ' ',
              space: ' '
            }

            File.write("./data/books.json", JSON.generate(books_array, opts)) 

          end

          def save_people(people)
            people_array = []
            return people_array if people == []

            people.each { |person|
              person_obj = {
                id: person.id,
                name: person.name,
                age: person.age,
                has_permission: person.parent_permission,
                type: person.class
              }
              if person.class == Student
                person_obj[:classroom] = person.classroom
              else
                person_obj[:specialization] == person.specialization
              end
              people_array << person_obj
            }

            opts = {
              array_nl: "\n",
              object_nl: "\n",
              indent: '  ',
              space_before: ' ',
              space: ' '
            }

            File.write("./data/people.json", JSON.generate(people_array, opts)) 

          end

          def save_rentals(rentals)
            rentals_array = []
            return rentals_array if rentals == []

            rentals.each { |rental|
              rental_obj = {
                date: rental.date,
                title: rental.book.title,
                author: rental.book.author,
                id: rental.person.id,
                name: rental.person.name,
                age: rental.person.age,
                has_permission: rental.person.parent_permission,
                type: rental.person.class
              }
              if rental.person.class == Student
                rental_obj[:classroom] = rental.person.classroom
              else
                rental_obj[:specialization] = rental.person.specialization
              end
              rentals_array << rental_obj
            }

            opts = {
              array_nl: "\n",
              object_nl: "\n",
              indent: '  ',
              space_before: ' ',
              space: ' '
            }

            File.write("./data/rentals.json", JSON.generate(rentals_array, opts)) 

          end
      end