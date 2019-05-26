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
  character_hash = response_hash["results"]
  character_movies = []

  character_hash.each do |character|
    character.each do |key, value|
      if key == "name" && value.downcase == character_name.downcase
        character_movies = character["films"]
      end
    end
  end
  character_movies
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  response_string = RestClient.get('http://www.swapi.co/api/films/')
  response_hash = JSON.parse(response_string)

  film_hash = response_hash["results"]
  film_titles = []

  film_hash.each do |film|
    film.each do |key, value|
      films.each do |url|
        if key == "url" && url == value
          film_titles << film["title"]
        end
      end
    end
  end
  position = 1
  film_titles.each do |title|
    puts "#{position} #{title}"
    position += 1
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
