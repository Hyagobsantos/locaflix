require 'uri'
require 'net/http'
require 'openssl'
require 'json'
class SearchDetailsMovies
  def search(title)
    url = URI("https://online-movie-database.p.rapidapi.com/title/find?q=#{title}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = '0c6bec672fmshed41a8d6ee81aa5p1c834fjsnc46a5d7855f5'
    request["X-RapidAPI-Host"] = 'online-movie-database.p.rapidapi.com'

    response = http.request(request)
    movie = JSON.parse(response.body).transform_keys { |k| k.to_sym }

    {
      image: movie[:results][0]['image']['url'],
      year: movie[:results][0]['year']
    }
  end
end