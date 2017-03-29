def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  name = gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    puts "Please enter the student's nationality: "
    nationality = gets.chomp
    puts "What is the student's cohort?"
    cohort = gets.chomp.capitalize.to_sym
    if cohort.empty?
      puts "Default cohort is November"
      cohort = "November"
    end
    students << {name: name, cohort: cohort, nationality: nationality}
    puts "Now we have #{students.count} students"
    # Get another name from the user
    name = gets.chomp
  end
  # Return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50, '-')
  puts "-------------".center(50)
end

def print(students)
students.each_with_index do |student, index|
  puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort, #{student[:nationality]})".center(50)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

students = input_students
# Nothing happens until we call the methods
print_header
print(students)
print_footer(students)
