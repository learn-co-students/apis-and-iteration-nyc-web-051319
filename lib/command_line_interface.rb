def welcome
  # puts out a welcome message here!
end

def get_character_from_user
  puts "please enter a character name"
  puts ""
  # use gets to capture the user's input. This method should return that input, downcased.
  character = gets.chomp
end

def get_movie_from_user
  puts "please enter a movie title"
  puts ""
  movie = gets.chomp
end
