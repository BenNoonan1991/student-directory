@students = []

def print_menu
  puts "1. Input the students."
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # Because we'll be adding more variables.
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.delete("\n"))
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else puts "I don't know what you mean, try again"
  end
end

def store_info
  @students << {name: @name, cohort: @cohort.to_sym, nationality: @nationality}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  @name = STDIN.gets.delete("\n")
  # While the name is not empty, repeat this code
  while !@name.empty? do
    # Add the student hash to the array
    puts "Please enter the student's nationality: "
    @nationality = STDIN.gets.delete("\n")
    puts "What is the student's cohort?"
    @cohort = STDIN.gets.delete("\n").capitalize.to_sym
    if @cohort.empty?
      puts "Default cohort is November"
      @cohort = "November"
    end
    store_info
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # Get another name from the user
    @name = STDIN.gets.delete("\n")
  end
end



def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(50, '-')
  puts "-------------".center(50)
end

def print_students_list
  puts "Please input the cohort you would like to see"
  cohort_choice = STDIN.gets.chomp.to_sym
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

def save_students
  #Open the file for writing
  file = File.open("students.csv", "w")
  #Iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  @name, @cohort = line.chomp.split(',')
    store_info
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    load_students("students.csv")
    puts "Loaded #{@students.count} from students.csv."
  elsif File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
