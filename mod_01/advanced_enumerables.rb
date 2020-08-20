# WARMUP

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
students = [student1, student2, student3, student4, student5]

# 1. Create an Array of all the Student names
student_names = students.map(&:name)

# 2. Create an Array of all the Students whose names start with the letter “M”
student_names_m = students.select { |student| student.name.start_with?('M') }

# 3. Get the Student whose id is 1
student_id1 = students.find { |student| student.id == 1 }

# 4. Check if one Student is named “Amy”
student_amy = students.one? { |student| student.name == 'Amy' }

# 5. Check if any of the Students have an id of 10
student_id10 = students.any? { |student| student.id == 10 }

# 6. Find the Student with the highest id
student_highest_id = students.max_by(&:id)

# 7. Create an Array with the Students in order of name, alphabetically
student_sort = students.sort_by(&:name)

# 8. Create an Array with the Students in order of name by length
students_by_name_length = students.sort_by { |student| student.name.length }
