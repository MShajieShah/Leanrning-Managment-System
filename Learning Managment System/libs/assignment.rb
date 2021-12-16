class Assignment < Instructor
  attr_accessor :course_code, :assign_title, :instructor_username
  @@all = []

  def initialize(assign_course_code, assign_title, instructor_username)
    @assign_course_code = assign_course_code
    @assign_title = assign_title
    @instructor_username = instructor_username
    @@all << self
  end

  def save_assign
    ifile = File.open("data/assignmentdata")
    data = ifile.readlines
    ifile.close
    data.insert(1, "assignment_course_code: ", @assign_course_code, ",", "assignemnt_title: ", @assign_title, ",", "instructor_username: ", @instructor_username, "\n")
    File.write("data/assignmentdata", data.join, mode: "w")
    puts "Assignment Added Sucessfully"
  end

  # def self.add_assign_marks(search_code)
  #   mem = File.readlines("data/assignmentdata").select { |word| word.include?(search_code) }
  #   puts "Enter Marks"
  #   marks = gets.chomp

  #   read_file = File.new("data/assignmentdata", "r+").read
  #   write_file = File.new("data/assignmentdata", "w")
  #   puts "Record Updated Sucessfully"
  #   read_file.each_line do |line|
  #     write_file.write(line) unless line.include? search_code
  #   end
  #   write_file.close

  #   ifile = File.open("data/assignmentdata")
  #   data = ifile.readlines
  #   data.insert(1, mem[0].chomp << ",marks: " + marks)
  #   File.write("data/assignmentdata", data.join, mode: "w+")
  # end
  def self.show_assign(course_code)
    mem_list = File.readlines("data/assignmentdata").select { |word| word.include?(course_code) }
    puts mem_list
  end
end
