# list of students in array
students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :june},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :june},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :may}
]

MONTHS = [
    :january,
    :february,
    :march,
    :april,
    :may,
    :june,
    :july,
    :august,
    :september,
    :october,
    :november,
    :december
]

# define student inuput method
def input_students
  puts "Please enter the names of the students and their cohort"
  puts "To finish, just hit return twice"
  puts "\nEnter Name:"
  # create empty array
  students = []
  name = gets.chomp
  month = ''
  # while name isn't empty, repeat
  while !name.empty? do
     while !MONTHS.include?(month)
       puts "Enter cohort month:"
       month = gets.chomp.to_sym
     end
    #add student to array
    students << {name: name, cohort: month}
    puts "Now we have #{students.count} students\n\n"
    puts "Enter another Name:"
    name = gets.chomp
    month = ''
  end
  students
end

# define print methods
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(students, number: 'n', letter: '', max_length: 1e9, by_cohort: 'n')
    maxlen = 0
    students.each do |s|
      if s[:name].length > maxlen
        maxlen = s[:name].length
      end
    end
    cohort = {}
    students.each_with_index do |student, i|
      prefix = ""
      if number == 'y'
        prefix = "#{i+1}. ".rjust(4)
      end
      if student[:name].length <= max_length && (letter == "" || student[:name][0] == letter)
        line = "#{prefix}#{student[:name].ljust(maxlen)}"
        if by_cohort == 'y'
          if !cohort.keys.include?(student[:cohort])
            cohort[student[:cohort]] = []
          end
          cohort[student[:cohort]].push(line)
        else
          puts line + " (#{student[:cohort]} cohort)"
        end
      end
    end
    if cohort != {}
      MONTHS.each do |month|
        if cohort.keys.include?(month)
          puts "#{month.to_s.capitalize} Cohort:"
          puts cohort[month].join("\n")
        end
      end
    end
end

def print_footer(names)
  print "-------------\nOverall, we have #{names.count} great student#{("s"*(names.count - 1))[0]}"
end

# adding menu
def interactive_menu
  students  = []
  loop do
    # Print menu and ask user for input
    puts "Select an option from the list below"
    puts "1. Input Students"
    puts "2. Show Students"
    puts "9. Exit"
    # Read and store input
    selection = gets.chomp
    # Do what has been selected
    case selection
    when "1"
      students = input_students
    when "2"
      if students.length != 0
        print_header
        # print_students(students, number: 'y', letter: '', max_length: 12, by_cohort: 'y')
        print_students(students)
        print_footer(students)
      else
        puts "No students are enrolled"
      end
    when "9"
      exit
    else
      puts "Try Again."
    end
  end
end

interactive_menu
