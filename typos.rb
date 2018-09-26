# create an empty array
@students = []

require 'CSV'

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
      puts "Students have been inputted"
    when "2"
      show_students
    when "3"
      save_students
      puts "Students saved"
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  @name = STDIN.gets.chomp
  while !@name.empty? do
    add_students
    puts "Now we have #{@students.count} students"
    @name = STDIN.gets.chomp
  end
  @students
end

def add_students
  @students << {name: @name, cohort: :november}
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

# DO SACE STUDENTS CSV BIT

def save_students
  CSV.open(@filename, "a") do |file|
    @students.each do |student|
      file << [student[:name], student[:cohort]]
    end
  end
end

def load_students
  CSV.foreach(@filename) do |line|
    @name, cohort = line
    add_students
  end
end

def try_load_students
  @filename = ARGV.first
  @filename = "students.csv" if @filename.nil?
  if File.exists?(@filename)
    load_students
    puts "Loaded #{@students.count} students from #{@filename}"
  else
    puts "Sorry, #{@filename} doesn't exist"
    exit
  end
end

try_load_students
interactive_menu
