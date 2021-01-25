require 'pry'
class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    # binding.pry
    student_hash.each {|k, v| self.send(("#{k}="),v)}
    @@all << self
    #  binding.pry
  end

  def self.create_from_collection(students_array)
    # binding.pry
    students_array.each {|student| student = self.new(student)}
  end

  def add_student_attributes(attributes_hash)
    # binding.pry
     @twitter = attributes_hash[:twitter]
    @linkedin = attributes_hash[:linkedin]
    @github = attributes_hash[:github]
    @blog = attributes_hash[:blog]
    @profile_quote = attributes_hash[:profile_quote]
    @bio = attributes_hash[:bio]
  end

  def self.all
     @@all
  end
end

