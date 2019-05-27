require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  character_hash = response_hash["results"].find do |info|
    info["name"].downcase == character_name
  end
  film_urls = character_hash["films"]
  films = film_urls.map do |film|
    JSON.parse(RestClient.get(film))
  end
  films
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  puts ""
    films.each do |film|
    puts film['title']
    puts "*" * 10
  end
puts ""
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
