def welcome
  # puts out a welcome message here!
  puts "Hi. Welcome to the Star Wars Search Engine."
end

def get_character_from_user
  puts "Please enter a character name:"
  # use gets to capture the user's input. This method should return that input, downcased.
  character = gets.chomp
  character
end
