class Marks < Assignment
  attr_accessor :assign_name, :assign_marks

  def initialize(assign_name, student_name, assign_marks)
    @assign_name = assign_name
    @student_name = student_name
    @assign_marks = assign_marks
  end

  def save_assign_marks
    ifile = File.open("data/marksdata")
    data = ifile.readlines
    ifile.close
    data.insert(1, "assignment_title: ", @assign_name, ",", "student_username: ", @student_name, ",", "assignemnt_marks: ", @assign_marks, "\n")
    File.write("data/marksdata", data.join, mode: "w")
    puts "Marks Added Sucessfully"
  end

  def self.show_marks(search_marks_by_name)
    mem_list = File.readlines("data/marksdata").select { |word| word.include?(search_marks_by_name) }
    puts mem_list
  end
end
