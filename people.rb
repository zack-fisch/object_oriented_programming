
class Person 
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def greet
		puts "My name is #{name}"
	end
end

class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach 
		puts "Everything is a ruby object."
	end
end

chris = Instructor.new("Chris")
chris.greet
chris.teach

cristina = Student.new("Cristina")
cristina.greet
cristina.learn
cristina.teach # does not work, student class has nothing to do with instructor class, both inherit from person, not from each other
