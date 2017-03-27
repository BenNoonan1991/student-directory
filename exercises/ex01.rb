# Prints a number before the name of each student.  

def print(students)
students.each_with_index do |student, index|
  puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
