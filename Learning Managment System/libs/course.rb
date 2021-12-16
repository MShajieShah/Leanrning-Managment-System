class Course
  attr_accessor :course_name, :course_code, :offering_school, :capacity, :instructor_username
  @@all = []

  def initialize(course_code, course_name, offering_school, capacity, instructor_username)
    @course_code = course_code
    @course_name = course_name
    @offering_school = offering_school
    @capacity = capacity
    @instructor_username = instructor_username
    @@all << self
  end

  def save_course
    ifile = File.open("data/coursedata")
    data = ifile.readlines
    ifile.close
    data.insert(1, "course_code:", @course_code, ",", "course_name:", @course_name, ",", "offering_school:", @offering_school, ",", "capacity:", @capacity, ",", "instructor_username:", @instructor_username, "\n")
    File.write("data/coursedata", data.join, mode: "w")
    puts "Course Added Sucessfully"
  end

  def self.show_course
    File.foreach("data/coursedata") { |line| puts line }
  end
  def self.all
    @@all
  end
  def self.find_by(instructor_username)
    cour_list = File.readlines("data/coursedata").select { |word| word.include?(instructor_username) }
    cour_list
  end
end
