require 'open-uri'

class ItunesApiCallService
  def initialize(search_term)
    @base_url = "https://itunes.apple.com/search?limit=15&term="
    @search_term = search_term
    @result = nil
  end

  # each api call return an array of recommendables, which is an array of
  # recommendable instances (for now we just check movies, eventually it will
  # be also podcasts and audiobooks etc)
  def call
    recommendables = []
    result_json_arr = fetch
    result_json_arr.each do |result_json|
      recommendable = nil
      recommendable = build_movie(result_json) if movie?(result_json)
      recommendables << recommendable unless recommendable.nil?
    end
    recommendables
  end

  private

  # do the api call an return an array of result_json's (no need for resultsCount)
  def fetch
    url = @base_url + normalize(@search_term)
    data = JSON.parse(open(url).read)
    data["results"]
  end

  # spaces inside a search term need to be subsituted with "+"
  def normalize(search_term)
    search_term.chomp.tr(" ", "+")
  end

  # checks if the result_json returned by the itunes API is a movie
  def movie?(result_json)
    result_json["kind"] == "feature-movie"
  end

  # creates a movie instance out the result_json
  def build_movie(result_json)
    Movie.new(
      title: result_json["trackName"],
      itunes_id: result_json["trackId"].to_i,
      image_url: resize(result_json["artworkUrl100"]),
      genre: result_json["primaryGenreName"]
    )
  end

  def resize(url)
    url.gsub("100x100bb.jpg", "400x400bb.jpg")
  end
end
