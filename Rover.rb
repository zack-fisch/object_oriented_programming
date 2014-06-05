class Rover
	
	attr_accessor :x, :y, :bearing, :odometer

	def initialize(x, y, bearing)
		@x = x
		@y = y
		@bearing = bearing
		@odometer = 0
	end

	def face(direction)
		@bearing = direction
		puts "Your scientific Rover is now facing #{direction}"
	end

	def move(movement)
		@odometer += movement.to_i
		puts "The rover has moved #{@odometer} spaces."
	end

end

my_rover = Rover.new(0, 0, "N")


puts "Your Rover is alive and well. Please enter your parameters."
puts "Would you like your rover to move or change its direciton?"

input = gets.chomp

while input.downcase != ""
	if input.downcase == "move"
		puts "How many moves?"
		moves = gets.chomp
		my_rover.move(moves)
		puts "Would you like your rover to move or change its direciton?"
		input = gets.chomp
	elsif input.downcase == "direction"
		puts "Which direction?"
		direction = gets.chomp
		my_rover.face(direction)
		puts "Would you like your rover to move or change its direciton?"
		input = gets.chomp
	else
		puts "You have moved a total of " + my_rover.odometer.to_s +  " moves and are facing "+ my_rover.bearing
		puts "Goodbye"
		break
	end
end