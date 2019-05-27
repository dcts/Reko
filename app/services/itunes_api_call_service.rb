# require 'json'
require 'open-uri'

class ItunesApiCallService
  def initialize(search_term)
    @base_url = "https://itunes.apple.com/search?limit=15&term="
    @search_term = search_term
    @result = nil
  end

  def call
    content_arr = []
    results = fetch
    results.each do |result_object|
      content = nil
      content = build_movie(result_object) if movie?(result_object)
      # content = build_documentary(result_object) if documentary?(result_object)
      # content = build_serie(result_object) if serie?(result_object)
      # content = build_audiobook(result_object) if audiobook?(result_object)
      # content = build_podcast(result_object) if podcast?(result_object)
      content_arr << content unless content.nil?
    end
    content_arr
  end

  def url
    @url
  end

  private

  def fetch
    url = @base_url + normalize(@search_term)
    data = JSON.parse(open(url).read)
    results = data["results"]
    # binding.pry
    # result_count = data["resultCount"] # not needed
  end

  def normalize(search_term)
    search_term.chomp.gsub(" ", "+")
  end

  # evaluates it the result is of interest ()
  def evaluate_type(result_object)

  end

  def movie?(result_object)
    result_object["kind"] == "feature-movie" && result_object["primaryGenreName"] != "Documentary"
  end

  def documentary?(result_object)
    result_object["kind"] == "feature-movie" && result_object["primaryGenreName"] == "Documentary"
  end

  def serie?(result_object)
    false
  end

  def audiobook?(result_object)
    false
  end

  def podcast?(result_object)
    false
  end

  # def build_instance(result_object)
  #   kind = result_object["kind"]
  #   genre = result_object["primaryGenreName"]
  #   # if kind == "feature-movie"
  # end

  def build_movie(attr)
    Movie.new(
      title: attr["trackName"],
      itunes_id: attr["trackId"].to_i,
      image_url: resize(attr["artworkUrl100"]),
      # year: attr["releaseDate"][0..3].to_i
    )
  end

  # def build_documentary(attr)
  #   Documentary.new(
  #     title: attr["trackName"],
  #     itunes_id: attr["trackId"].to_i,
  #     image_url: resize(attr["artworkUrl100"]),
  #     year: attr["releaseDate"][0..3].to_i
  #   )
  # end

  # def build_serie(attr)
  #   Serie.new(
  #     title: attr["trackName"],
  #     itunes_id: attr["trackId"].to_i,
  #     image_url: resize(attr["artworkUrl100"]),
  #     year: attr["releaseDate"][0..3].to_i
  #   )
  # end

  # def build_audiobook(attr)
  #   Audiobook.new(
  #     title: attr["trackName"],
  #     itunes_id: attr["trackId"].to_i,
  #     image_url: resize(attr["artworkUrl100"]),
  #     author: "attr[]"
  #   )
  # end

  # def build_podcast(attr)
  #   Podcast.new(
  #     title: attr["trackName"],
  #     itunes_id: attr["trackId"].to_i,
  #     image_url: resize(attr["artworkUrl100"]),
  #     author: "attr[]"
  #   )
  # end

  def resize(url)
    url.gsub("100x100bb.jpg", "400x400bb.jpg")
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
