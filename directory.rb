@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.delete("\n")
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    puts "Please enter the student's nationality: "
    nationality = gets.delete("\n")
    puts "What is the student's cohort?"
    cohort = gets.delete("\n").capitalize.to_sym
    if cohort.empty?
      puts "Default cohort is November"
      cohort = "November"
    end
    @students << {name: name, cohort: cohort, nationality: nationality}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # Get another name from the user
    name = gets.delete("\n")
  end
end


def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students."
  puts "2. Show the students"
  puts "9. Exit" # Because we'll be adding more variables.
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else puts "I don't know what you mean, try again"
  end
end

def print_header
  puts "The students of Villains Academy".center(50, '-')
  puts "-------------".center(50)
end

def print_students_list
  puts "Please input the cohort you would like to see"
  cohort_choice = gets.chomp.to_sym
  @students.each_with_index do |student, index|
  if cohort_choice == student[:cohort]
  puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort, #{student[:nationality]})".center(50)
  end
end


def print_footer
  if @students.count == 1
    puts "We have 1 great student here.".center(50)
  elsif @students.count == 0
    puts "There are no students enrolled."
  else
    puts "Overall, we have #{@students.count} great students".center(50)
  end
end
end

interactive_menu
