def welcome
  # puts out a welcome message here!
  puts ""
  puts ""
  puts ""
  puts ""
  puts "A Long time ago, in a galaxy far, far away..."
  sleep(2)
  puts ""
  puts "*" * 32
  puts "STAR WARS: REVENGE OF THE PARSER"
  puts "*" * 32
  puts ""
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  character_name = gets.chomp.downcase
end