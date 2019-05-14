require 'rest-client'
require 'json'
require 'pry'

movies_array = []
url_array = []

def get_character_movies_from_api(character)
  #make the web request
  character_query = character
  response_string = RestClient.get("https://swapi.co/api/people/?search=#{character_query}")
  response_hash = JSON.parse(response_string)
  # iterate over the response hash to find the collection of `films` for the given `character`

    movies_array = response_hash["results"].first["films"]

    #for each URL make a get request and then parse it
    #then from the hash that has just been parsed return all values of the title key

    movies_array.each_with_index do |url, index|
      # binding.pry
      client_request = RestClient.get("#{url}")
      parsed_request = JSON.parse(client_request)

      #parsed_request.each do |title|
      puts "#{index+1} #{parsed_request["title"]}"
    end
end


# def print_movies(films)
#   # some iteration magic and puts out the movies in a nice list
# end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  #print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
