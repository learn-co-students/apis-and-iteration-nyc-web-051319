require 'rest-client'
require 'json'
require 'pry'

def get_response
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response_hash
end

def get_films(character_name)
  response_hash = get_response

  characters_films = response_hash["results"].find do |result|
    result["name"] == character_name
  end["films"]

  characters_films
end

def get_character_movies_from_api(character_name)
  characters_films = get_films(character_name)
  films = []
  films_hash = characters_films.each do |url|
    films << JSON.parse(RestClient.get("#{url}"))
  end
  films
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  puts "List of movies with this character..."
  puts ""
  films.each do |film|
    puts film["title"]
  end
  puts ""
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

def print_movie_info(films, movie)

  film_info = films.find do |film|
    film["title"] == movie
  end

  director = film_info["director"]
  producer = film_info["producer"]

  puts ""
  puts "This movie's director(s) is/are #{director} and the producer(s) is/are #{producer}."
end

def movie_info(movie, character)
  films = get_character_movies_from_api(character)
  print_movie_info(films, movie)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
