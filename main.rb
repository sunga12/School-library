require './options'

def main
  display_options
end

main

# Needed:

# 1. create: person, book rental
# 2. upon exit, should all be saved OR upon creation, should be saved
# 2a. saving ie write data to files, save it as json
# 2b. using JSON.generate(data) & File.write(args)

# How do you save data to file?
#   what format is it in? 
#     ie people, books & rentals == arrays 
#     if ruby = [0, 's', :foo]
#     then json = JSON.generate(ruby) 
#          json # => '[0,"s","foo"]'

#     if opts = {
#       array_nl: "\n",
#       object_nl: "\n",
#       indent: '  ',
#       space_before: ' ',
#       space: ' '
#     }

#     JSON.generate(ruby, opts)

#     then check if  File.exists? 
#       then  write to a file:
#         File.write("log.txt", json, mode: "a")
#     if there is already json data, it should write using append mode
 
# 3. after exit, run program, saved data should load ie books, people and rentals

# How do you load data?

#   look for the File
#   read the file: json = File.read("user.txt")

#   if json = '["foo", 1, 1.0, 2.0e2, true, false, null]'
#     then ruby = JSON.parse(json)
#          ruby # => ["foo", 1, 1.0, 200.0, true, false, nil]
#          then set the appropriate array to the saved data eg @people = ruby

    

