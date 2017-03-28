# Changes to directory to prompt the user
# for the students nationality

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
    students << {name: name, cohort: :november, nationality: nationality}
    puts "Now we have #{students.count} students"
    # Get another name from the user
    name = gets.chomp
  end
  # Return the array of students
  students
end

def print(students)
students.each_with_index do |student, index|
  puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort, #{student[:nationality]})"
  end
end
