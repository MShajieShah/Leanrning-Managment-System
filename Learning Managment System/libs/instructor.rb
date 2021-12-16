class Instructor < User
  attr_accessor :instructor_username, :designation, :qualification

  def initialize(inst_fname, inst_lname, inst_pass, instructor_username, inst_designation, inst_qualification)
    @inst_firstname = inst_fname
    @inst_lastname = inst_lname
    @inst_pass = inst_pass
    @instructor_username = instructor_username
    @designation = inst_designation
    @qualification = inst_qualification
  end

  def save_inst
    ifile = File.open("data/instructordata")
    data = ifile.readlines
    ifile.close
    data.insert(1, "instructor_first_name:", @inst_firstname, ",", "instructor_last_name:", @inst_lastname, ",", "instructor_password:", @inst_pass, ",", "instructor_username:", @instructor_username, ",", "instructor_designation:", @designation, ",", "instructor_qualification:", @qualification, "\n")
    File.write("data/instructordata", data.join, mode: "w")
    puts "Account Created...!!!"
  end

  def self.getprofile(entry_name)
    mem2 = File.readlines("data/instructordata").select { |word| word.include?(entry_name) }
    c = []
    mem2.join.split(",").each { |x| c << Hash[*x.split(":")] }
    mem2 = Hash[*c.map(&:to_a).flatten]
    if mem2["instructor_username"] <=> entry_name
      p mem2["instructor_first_name"] + mem2["instructor_last_name"] + "," + mem2["instructor_designation"]
    else
      p "Not Found"
    end
  end

  def self.inst_user_name(mem)
    b = []
    mem.join.split(",").each { |x| b << Hash[*x.split(":")] }
    mem = Hash[*b.map(&:to_a).flatten]
    return mem["instructor_username"]
  end

  def self.pass_check(mem)
    b = []
    mem.join.split(",").each { |x| b << Hash[*x.split(":")] }
    mem = Hash[*b.map(&:to_a).flatten]
    return mem["instructor_password"]
  end
end
