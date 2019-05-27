class ContentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @movies = Movie.all
    @documentaries = Documentary.all
    @series = Serie.all
    @audiobooks = Audiobook.all
    @podcasts = Podcast.all
  end
end
