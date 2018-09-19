def input_students
  puts "Please enter the names of the students, their nationality, hobbie and cohort"
  puts "To finish, just hit return twice"
  #creates an empty array
  students = []
  name = gets.chomp
  nationality = gets.chomp
  nationality.empty? ? nationality = "BLANK" : nationality
  hobbie = gets.chomp
  hobbie.empty? ? hobbie = "BLANK" : hobbie
  cohort = gets.chomp.to_s
  cohort.empty? ? cohort = "BLANK" : cohort
  # while the name is not empty, repeat this code
  while !name.empty? do
    students << {name: name, nationality: nationality, hobbie: hobbie, cohort: cohort}
    puts  students.count == 1 ? "Now we have #{students.count} great student" : "Now we have #{students.count} great students"
    # get another name from the user
    name = gets.chomp
    break if name.empty?
    nationality = gets.chomp
    nationality.empty? ? nationality = "BLANK" : nationality
    hobbie = gets.chomp
    hobbie.empty? ? hobbie = "BLANK" : hobbie
    cohort = gets.chomp.to_s
    cohort.empty? ? cohort = "BLANK" : cohort
  end
  students
end

def print_header
  puts "The students of Villans Academy".center(200)
  puts "------------".center(200)
end

def print(students)
  puts "Which cohort would you like to list the students from?"
  list = gets.chomp
  @count = 0
  print_header
  students.map { |student|
    if student[:cohort] == list
      @count += 1
      puts student[:name].center(200)
    end
  }
end

def print_footer(names)
  puts  @count == 1 ? "Overall, we have #{@count} great student in this cohort".center(200) : "Overall, we have #{@count} great students in this cohort".center(200)
end

students = input_students
print(students)
print_footer(students)
