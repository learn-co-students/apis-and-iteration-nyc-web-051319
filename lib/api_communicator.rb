require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  characters_hash = response_hash["results"]
  character = find_character(character_name, characters_hash)
  character_films = find_films(character)
end

def find_character(character_name, characters)
  characters.map do |character|
    if character_name == character["name"].downcase
      character["films"]
    end
  end.flatten.reject {|element| element.nil?}
end

def find_films(character_films)
  character_films.map do |movie_url|
    movie_string = RestClient.get("#{movie_url}")
    movie_hash = JSON.parse(movie_string)
  end
end

def print_movies(films)
  films.map.with_index do |film, index|
    puts "#{index + 1}. #{film["title"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
