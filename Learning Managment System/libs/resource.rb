class Resource < Assignment
  attr_accessor :resource_name, :assign_subject

  def initialize(assign_subject, resource_name)
    @assign_subject = assign_subject
    @resource_name = resource_name
  end

  def save_resources
    ifile = File.open("data/resourcesdata")
    data = ifile.readlines
    ifile.close
    data.insert(1, "assignment_name: ", @assign_subject, ",", "resource_source: ", @resource_name, "\n")
    File.write("data/resourcesdata", data.join, mode: "w")
    puts "Resources added...!!!"
  end
end
