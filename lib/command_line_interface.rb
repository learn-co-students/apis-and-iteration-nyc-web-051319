def welcome
  # puts out a welcome message here!
  puts "Hey there Starwars fan! Welcome to the Starwars database!"
end

def get_character_from_user
  puts "Please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp
  input.downcase
end
