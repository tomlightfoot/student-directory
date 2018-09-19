def input_students
  puts "Please enter the names of the students"
  puts "To, finish, just hit return twice"
  #creates an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} student(s)"
    # get another name from the user
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villans Academy"
  puts "------------"
end

def print(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
