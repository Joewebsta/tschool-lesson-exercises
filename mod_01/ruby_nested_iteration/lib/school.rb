class School
  attr_reader :name, :houses, :courses

  def initialize(name, houses)
    @name = name
    @houses = houses
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def sort(student)
    student.house = @houses.sample
  end

  def student_list
    @courses.each_with_object([]) { |course, students| students.concat(course.students) }.uniq
  end

  def sort_students
    student_list.each { |student| sort(student) }
  end

  def student_names
    student_list.map(&:name)
  end

  def students_by_house
    @houses.each_with_object({}) do |house, hash|
      hash[house] = student_list.select { |student| student.house == house }
    end
  end
end
