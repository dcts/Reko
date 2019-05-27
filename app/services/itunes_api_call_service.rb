# require 'json'
require 'open-uri'

class ItunesApiCallService
  def initialize(search_term)
    @base_url = "https://itunes.apple.com/search?limit=15&media=tvShow&entity=tvSeason&term="
    @search_term = search_term
    @result = nil
  end

  def call
    results = fetch
    results.each do |result_object|
      return buildMovie(result_object) if movie?(result_object)
    end
    # content_arr = [] # array with instances of movie / documentary / podcast / audiobook etc.
    # # url = 'https://api.github.com/users/ssaunier'
    # # user_serialized = open(url).read
    # # user = JSON.parse(user_serialized)
    # # puts "#{user['name']} - #{user['bio']}"
    # content_arr << extract(results[0])
  end

  def url
    @url
  end

  private

  def fetch
    url = @base_url + normalize(@search_term)
    data = JSON.parse(open(url).read)
    results = data["results"]
    binding.pry
    # result_count = data["resultCount"] # not needed
  end

  def normalize(search_term)
    search_term.chomp.gsub(" ", "+")
  end

  # evaluates it the result is of interest ()
  def evaluate_type(result_object)

  end

  def movie?(result_object)
    result_object["kind"] == "feature-movie"
  end

  def documentary?(result_object)
    result_object["primaryGenreName"] == "Documentary"
  end

  def build_instance(result_object)
    kind = result_object["kind"]
    genre = result_object["primaryGenreName"]
    # if kind == "feature-movie"
  end

  def buildMovie(attr)
    Movie.new(
      title: attr["trackName"],
      itunes_id: attr["trackId"].to_i,
      image_url: resize(attr["artworkUrl100"], 400),
      year: attr["releaseDate"][0..3].to_i)
  end

  def resize(url, target_size)
    url.gsub("100x100bb.jpg", "#{target_size}x#{target_size}bb.jpg")
  end
end



# const proxyurl = "https://cors-anywhere.herokuapp.com/"; // TO PREVENT CORS FAILURE
# const url = "https://itunes.apple.com/search?media=movie&term=identical";
# let resultsCount = 0;
# fetch(proxyurl + url)
# .then((response) => response.json())
# .then((data) => {
#   resultsCount = data.resultCount;
#   // console.log(resultsCount);
#   data.results.forEach((result) => {
#     const movie = buildMovie(result);
#     console.log(movie);
#   });
# });
