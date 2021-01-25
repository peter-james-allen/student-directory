# list of students in array
students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]

# define student inuput method
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create empty array
  students = []
  name = gets.chomp
  # while name isn't empty, repeat
  while !name.empty? do
    #add student to array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

# define print methods
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(students, number: 'n', letter: '', max_length: 1e9)
    students.each_with_index do |student, i|
      prefix = ""
      if number == 'y'
        prefix = "#{i+1}. ".rjust(4)
      end
      if student[:name].length <= max_length && (letter == "" || student[:name][0] == letter)
        puts "#{prefix}#{student[:name].ljust(30)} (#{student[:cohort]} cohort)"
      end
    end
end
  
def print_students_with_num(student)
  student.each_with_index do |student, i|
    puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  print "-------------\nOverall, we have #{names.count} great students"
end

# call methods
# students = input_students
print_header
print_students(students, number:'y')
print_footer(students)
