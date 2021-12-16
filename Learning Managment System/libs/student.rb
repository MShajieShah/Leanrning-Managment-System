class Student < User
  attr_accessor :student_username, :roll_no, :status

  def initialize(std_fname, std_lname, std_pass, student_username, std_rollno, std_status)
    @std_firstname = std_fname
    @std_lastname = std_lname
    @std_pass = std_pass
    @student_username = student_username
    @std_rollno = std_rollno
    @status = std_status
  end

  def save_std
    ifile = File.open("data/studentdata")
    data = ifile.readlines
    ifile.close
    data.insert(1, "student_first_name:", @std_firstname, ",", "student_last_name:", @std_lastname, ",", "student_password:", @std_pass, ",", "student_user_name:", @student_username, ",", "student_roll_no:", @std_rollno, ",", "student_status:", @status, "\n")
    File.write("data/studentdata", data.join, mode: "w")
    puts "Account Created...!!!"
  end

  def self.getprofile(entry_name)
    mem = File.readlines("data/studentdata").select { |word| word.include?(entry_name) }
    b = []
    mem.join.split(",").each { |x| b << Hash[*x.split(":")] }
    mem = Hash[*b.map(&:to_a).flatten]
    if mem["student_user_name"] <=> entry_name
      p mem["student_first_name"] + mem["student_last_name"] + "," + mem["student_status"].chomp
    else
      p "Not Found"
    end
  end
  def self.show_course(name)
    mem_list = File.readlines("data/coursedata").select { |word| word.include?(name) }
    puts mem_list
  end
  def self.show_resource(name)
    mem_list = File.readlines("data/resourcesdata").select { |word| word.include?(name) }
    puts mem_list
  end

  def self.user_name(mem)
    b = []
    mem.join.split(",").each { |x| b << Hash[*x.split(":")] }
    mem = Hash[*b.map(&:to_a).flatten]
    return mem["student_user_name"]
  end
  def self.pass_check(mem)
    b = []
    mem.join.split(",").each { |x| b << Hash[*x.split(":")] }
    mem = Hash[*b.map(&:to_a).flatten]
    return mem["student_password"]
  end

  def self.add_course(search_code, student_username)
    mem = File.readlines("data/coursedata").select { |word| word.include?(search_code) }

    read_file = File.new("data/coursedata", "r+").read
    write_file = File.new("data/coursedata", "w")
    puts "Record Updated Sucessfully"
    read_file.each_line do |line|
      write_file.write(line) unless line.include? search_code
    end
    write_file.close

    ifile = File.open("data/coursedata")
    data = ifile.readlines
    data.insert(1, mem[0].chomp << ",student_username:" + student_username)
    File.write("data/coursedata", data.join, mode: "w+")
  end
end
