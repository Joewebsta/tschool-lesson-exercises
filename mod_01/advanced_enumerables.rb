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

# Figure out which mod has the most students. The answer should be :mod_1 .
more_than_1_student = modules.select { |_mod, students| students.count > 1 }
more_than_1_student.keys

# Create a hash that associates a mod with an Array of students names

new_modules = {}
modules.each do |key, value|
  student_names = value.map(&:name)
  new_modules[key] = student_names
end
new_modules

# Figure out which mod has the most students. The answer should be :mod_1 .
most_students = []
modules.each do |_mod, student_arr|
  most_students = student_arr if student_arr.count > most_students.count
end

modules.key(most_students)

# Create a Hash that associates a mod with the student with the name of the Student highest id.
modules_by_highest_student_id = {}
modules.each do |key, val|
  if val.empty?
    modules_by_highest_student_id[key] = nil
    next
  end

  highest_id = val.max_by(&:id)
  modules_by_highest_student_id[key] = highest_id.name
end
modules_by_highest_student_id

# Create the following hash:
# {
#   ids_greater_than_or_equal_to_5:   "Brian and Amy",
#   ids_less_than_5:                  "Megan and Sal and Mike"
# }

final_hash = {}
id_over_5 = modules.values.flatten.select { |student| student.id >= 5 }.map(&:name).join(' and ')
id_below_5 = modules.values.flatten.select { |student| student.id < 5 }.map(&:name).join(' and ')
final_hash[:ids_greater_than_or_equal_to_5] = id_over_5
final_hash[:ids_less_than_5] = id_below_5
