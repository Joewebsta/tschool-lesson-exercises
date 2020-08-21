require 'awesome_print'

# WARMUP

# class Student
#   attr_reader :name, :id

#   def initialize(name, id)
#     @name = name
#     @id = id
#   end
# end

# student1 = Student.new('Megan', 4)
# student2 = Student.new('Brian', 9)
# student3 = Student.new('Sal', 1)
# student4 = Student.new('Mike', 2)
# student5 = Student.new('Amy', 5)
# students = [student1, student2, student3, student4, student5]

# 1. Create an Array of all the Student names
# student_names = students.map(&:name)

# 2. Create an Array of all the Students whose names start with the letter “M”
# student_names_m = students.select { |student| student.name.start_with?('M') }

# 3. Get the Student whose id is 1
# student_id1 = students.find { |student| student.id == 1 }

# 4. Check if one Student is named “Amy”
# student_amy = students.one? { |student| student.name == 'Amy' }

# 5. Check if any of the Students have an id of 10
# student_id10 = students.any? { |student| student.id == 10 }

# 6. Find the Student with the highest id
# student_highest_id = students.max_by(&:id)

# 7. Create an Array with the Students in order of name, alphabetically
# student_sort = students.sort_by(&:name)

# 8. Create an Array with the Students in order of name by length
# students_by_name_length = students.sort_by { |student| student.name.length }

# ********************************************************************
# ADVANCED PROBLEMS

class Student
  attr_reader :name, :id

  def initialize(name, id)
    @name = name
    @id = id
  end
end

student1 = Student.new('Megan', 4)
student2 = Student.new('Brian', 9)
student3 = Student.new('Sal', 1)
student4 = Student.new('Mike', 2)
student5 = Student.new('Amy', 5)

modules = {
  mod_1: [student1, student2, student3],
  mod_2: [],
  mod_3: [student4],
  mod_4: [student5]
}

# Create an array of all mods (as symbols) that have more than one student. The answer should be [:mod_1] .
more_than_1_student = modules.each_with_object([]) do |key_val, mod_arr|
  mod = key_val[0]
  student_arr = key_val[1]
  mod_arr << mod if student_arr.count > 1
end

# Create a hash that associates a mod with an Array of students names. The answer should be:
# {
#   mod_1: ["Megan", "Brian", "Sal"],
#   mod_2: [],
#   mod_3: ["Mike"],
#   mod_4: ["Amy"]
# }
student_names_hash = modules.each_with_object({}) do |key_val, names_hash|
  mod = key_val[0]
  names_arr = key_val[1]
  names_hash[mod] = names_arr.map(&:name)
end

# Figure out which mod has the most students. The answer should be :mod_1 .
most_students = modules.max_by { |_key, val| val.count }[0]

# Create a Hash that associates a mod with the student with the name of the Student highest id.
# The answer should be:
# {
#   mod_1: "Brian",
#   mod_2: nil,
#   mod_3: "Mike",
#   mod_4: "Amy"
# }

modules_by_highest_student_id = modules.each_with_object({}) do |key_val, hash|
  mod = key_val[0]
  students_arr = key_val[1]
  hash[mod] = students_arr.empty? ? nil : students_arr.max_by(&:id).name
end

# Create the following hash:
# {
#   ids_greater_than_or_equal_to_5:   "Brian and Amy",
#   ids_less_than_5:                  "Megan and Sal and Mike"
# }

custom_hash = modules.each_with_object({}) do |key_val, hash|
  student_arr = key_val[1]
  hash[:ids_greater_than_or_equal_to_5] = modules.values.flatten.select { |student| student.id >= 5 }.map(&:name).join(' and ')
  hash[:ids_less_than_5] = modules.values.flatten.select { |student| student.id < 5 }.map(&:name).join(' and ')
end
