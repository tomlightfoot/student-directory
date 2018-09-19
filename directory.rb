# Array of students
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Micheal Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffery Baratheon",
  "Norman Bates"
]

# Print the list of students
puts "The students of Villans Academy"
puts "------------"
students.each { |student| puts student }

# Print how many students we have
puts "Overall, we have #{students.count} great students"
